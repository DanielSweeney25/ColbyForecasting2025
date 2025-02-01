#name the approaches since I'm not sure where they're stored
approaches <- c("greedy", "conservative")

#loop both month and approach
for (approach in approaches){
  for (month in month.abb){
    #create a naming convention for the config files
    approach_prefix <- ifelse(approach == "greedy", "g", "c")
    config_version <- paste0(approach_prefix,"_", month)
    
    #read model input
    model_input = read_model_input(scientificname = "Placopecten magellanicus",
                                   mon = month,
                                   approach = approach)
    cfg = read_configuration(version = config_version)
    db = brickman_database()
    covars = read_brickman(db |> filter(scenario == "PRESENT", interval == "mon"))|>
      select(all_of(cfg$keep_vars))
    #keep covariate data only from one month
    all_data = prep_model_data(model_input, 
                               month = month,
                               covars = covars, 
                               form = "table") |>
      select(all_of(c("class", cfg$keep_vars)))
    #split data
    split_data = initial_split(all_data, 
                               prop = 3/4,
                               strata = class)
    wflow = workflow()
    tr_data = training(split_data)
    rec = recipe(class ~ ., data = slice(tr_data,1))
    #log scaling depth and bottom sheer
    rec = rec |> 
      step_naomit()
    if ("depth" %in% cfg$keep_vars){
      rec = rec |>
        step_log(depth,  base = 10)
    }
    if ("Xbtm" %in% cfg$keep_vars){
      rec = rec |>
        step_log(Xbtm,  base = 10)
    }
    #filter out covariates that are too correlated
    rec = rec |> 
      step_corr(all_numeric_predictors())
    #add recipe to workflow
    wflow = wflow |>
      add_recipe(rec)
    #calling the model
    model = rand_forest() |>
      set_mode("classification") |>
      set_engine("ranger", probability = TRUE, importance = "permutation") 
    #add model to workflow
    wflow = wflow |>
      add_model(model)
    #fit the model
    fitted_wflow = fit(wflow, data = tr_data)
    #predict using training data
    train_pred = predict_table(fitted_wflow, tr_data, type = "prob")
    #predict using testing data
    test_data = testing(split_data)
    test_pred = predict_table(fitted_wflow, test_data, type = "prob")
    
    #get an AUC value and save it as a csv
    AUC = roc_auc(test_pred, class,  .pred_presence)
    output_dir <- "/Users/bloom/Desktop/data/2025/bloom/models"
    file_name <- file.path(output_dir, paste0(approach_prefix,"_", month, "AUC.csv"))
    write.csv(AUC, file = file_name)
    #write the workflow to file
    write_workflow(fitted_wflow, version = cfg$version)
  }
}
