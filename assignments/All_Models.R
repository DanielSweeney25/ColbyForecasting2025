source("setup.R")

#read the model input file, read the configuration file, read covariates
model_input = read_model_input(scientificname = "Placopecten magellanicus", 
                               approach = "greedy", 
                               mon = "Aug")
cfg = read_configuration(version = "g_Aug")
db = brickman_database()
covars = read_brickman(db |> filter(scenario == "PRESENT", interval == "mon"))|>
  select(all_of(cfg$keep_vars))

#keeping only the covariate data from august
all_data = prep_model_data(model_input, 
                           month = "Aug",
                           covars = covars, 
                           form = "table") |>
  select(all_of(c("class", cfg$keep_vars)))
all_data

#compute the ratio of background/presence points
get_ratio = function(x){
  counts = count(x, class)
  np = filter(counts, class == "presence") |> pull(n)
  nb = filter(counts, class == "background") |> pull(n)
  return(np/nb)
}

cat("ratio of presence/background in full data set:", get_ratio(all_data), "\n")

#split the data into training and testing
split_data = initial_split(all_data, 
                           prop = 3/4,
                           strata = class)
split_data

#verify that the ratio of background/presence points is the same as the entire dataset
cat("ratio of presence/background in training data:", 
    training(split_data) |> get_ratio(), "\n")

cat("ratio of presence/background in testing data:", 
    testing(split_data) |> get_ratio(), "\n")

#make a workflow
wflow = workflow()

#get the training data from the split data
tr_data = training(split_data)
tr_data

#starting the recipe
rec = recipe(class ~ ., data = slice(tr_data,1))
rec

#looking at the recipe
summary(rec)

#log scaling bottom sheer and bottom depth
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
rec

#add correlation filter to predictor variables to ensure no colinearity
rec = rec |> 
  step_corr(all_numeric_predictors())
rec

#adding the recipe to the workflow
wflow = wflow |>
  add_recipe(rec)
wflow

#creating a random forest model
model = rand_forest() |>
  set_mode("classification") |>
  set_engine("ranger", probability = TRUE, importance = "permutation") 
model

#adding the model to the workflow
wflow = wflow |>
  add_model(model)
wflow

#fit the model to the data
fitted_wflow = fit(wflow, data = tr_data)
fitted_wflow

#produce prediction table using the training data
train_pred = predict_table(fitted_wflow, tr_data, type = "prob")
train_pred

#count the outcomes 
count(train_pred, .pred, class)

#count outcomes in a diff format
train_confmat = conf_mat(train_pred, class, .pred)
train_confmat

#plot the outcomes to verify accuracy 
autoplot(train_confmat, type = "heatmap")

#plot the receiver operator curve
plot_roc(train_pred, class, .pred_presence)

#compute the area under the curve
roc_auc(train_pred, class,  .pred_presence)

#check the accuracy of the prediction using the training data
accuracy(train_pred, class, .pred)

#produce partial dependence plots
partial_dependence_plot(fitted_wflow, data = tr_data)

#pull the testing data from split data and run the model on testing data
test_data = testing(split_data)
test_pred = predict_table(fitted_wflow, test_data, type = "prob")
test_pred

#confusion matrixes with testing data
test_confmat = conf_mat(test_pred, class, .pred)
autoplot(test_confmat, type = "heatmap")

#produce receiver operator curve
plot_roc(test_pred, class, .pred_presence)

#check accuracy of model using testing data
accuracy(test_pred, class, .pred)

#produce partial dependence plots
partial_dependence_plot(fitted_wflow, data = test_data)

#write the workflow to a file
write_workflow(fitted_wflow, version = cfg$version)
