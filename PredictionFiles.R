cfg_g_Jan = read_configuration(version = "g_Jan")

covars_now_g = read_brickman(db |> filter(scenario == "PRESENT", interval == "mon")) |>
  select(all_of(cfg_g_Jan$keep_vars)) |>
  slice("month", "Jan")
nowcast_g_Jan = predict_stars(wflow_g_Dec, covars_now_g)

covars_rcp45_2055_Dec = read_brickman(db |> filter(scenario == "RCP45", year == 2055, interval == "mon")) |>
  select(all_of(cfg_g_Jan$keep_vars)) |>
  slice("month", "Jan")
forecast_rcp45_2055_Jan = predict_stars(wflow_g_Dec, covars_rcp45_2055_Dec)

covars_rcp85_2055_Dec = read_brickman(db |> filter(scenario == "RCP45", year == 2055, interval == "mon")) |>
  select(all_of(cfg_g_Jan$keep_vars)) |>
  slice("month", "Jan")
forecast_rcp45_2075_Jan = predict_stars(wflow_g_Dec, covars_rcp45_2055_Dec)

covars_rcp45_2075_Dec = read_brickman(db |> filter(scenario == "RCP45", year == 2055, interval == "mon")) |>
  select(all_of(cfg_g_Jan$keep_vars)) |>
  slice("month", "Jan")
forecast_rcp85_2055_Jan = predict_stars(wflow_g_Dec, covars_rcp45_2055_Dec)

covars_rcp85_2075_Dec = read_brickman(db |> filter(scenario == "RCP45", year == 2055, interval == "mon")) |>
  select(all_of(cfg_g_Jan$keep_vars)) |>
  slice("month", "Jan")
forecast_rcp85_2075_Jan = predict_stars(wflow_g_Dec, covars_rcp45_2055_Dec)

