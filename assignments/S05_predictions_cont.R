source("setup.R")

cfg_g_Dec = read_configuration(version = "g_Dec")
db = brickman_database()
covars_pres_Dec = read_brickman(db |> filter(scenario == "PRESENT", interval == "mon")) |>
  select(all_of(cfg_g_Dec$keep_vars)) |>
  slice("month", "Dec")


wflow_g_Dec = read_workflow(version = cfg_g_Dec$version)

nowcast_g_Dec = predict_stars(wflow_g_Dec, covars_pres_Dec)


coast = read_coastline()
plot(nowcast_g_Dec['.pred_presence'], main = "Nowcast Dec", 
     axes = TRUE, breaks = seq(0, 1, by = 0.1), reset = FALSE)
plot(coast, col = "orange", lwd = 2, add = TRUE)


plot(nowcast_g_Dec['.pred'], main = "Nowcast Dec Labels", 
     axes = TRUE, reset = FALSE)
plot(coast, col = "black", lwd = 2, add = TRUE)


covars_rcp85_2075_Dec = read_brickman(db |> filter(scenario == "RCP85", year == 2075, interval == "mon")) |>
  select(all_of(cfg_g_Dec$keep_vars)) |>
  slice("month", "Dec")

forecast_rcp85_2075_Dec = predict_stars(wflow_g_Dec, covars_rcp85_2075_Dec)

coast = read_coastline()
plot(forecast_rcp85_2075_Dec['.pred_presence'], main = "RCP85 2075 Dec", 
     axes = TRUE, breaks = seq(0, 1, by = 0.1), reset = FALSE)
plot(coast, col = "orange", lwd = 2, add = TRUE)


covars_rcp85_2055_Dec = read_brickman(db |> filter(scenario == "RCP85", year == 2055, interval == "mon")) |>
  select(all_of(cfg_g_Dec$keep_vars)) |>
  slice("month", "Dec")
forecast_rcp85_2055_Dec = predict_stars(wflow_g_Dec, covars_rcp85_2055_Dec)


rcp85_Dec = c(nowcast_g_Dec, forecast_rcp85_2055_Dec, forecast_rcp85_2075_Dec, along = list(year = c("2020", "2055", "2075")))


plot_coast = function(){
  plot(coast, col = "orange", lwd = 2, add = TRUE)
}
plot(rcp85_Dec['.pred_presence'], 
     hook = plot_coast,
     axes = TRUE, breaks = seq(0, 1, by = 0.1), join_zlim  = TRUE, reset = FALSE)

#rcp45
covars_rcp45_2075_Dec = read_brickman(db |> filter(scenario == "RCP45", year == 2075, interval == "mon")) |>
  select(all_of(cfg_g_Dec$keep_vars)) |>
  slice("month", "Dec")

forecast_rcp45_2075_Dec = predict_stars(wflow_g_Dec, covars_rcp45_2075_Dec)

coast = read_coastline()
plot(forecast_rcp45_2075_Dec['.pred_presence'], main = "RCP45 2075 Dec", 
     axes = TRUE, breaks = seq(0, 1, by = 0.1), reset = FALSE)
plot(coast, col = "orange", lwd = 2, add = TRUE)


covars_rcp45_2055_Dec = read_brickman(db |> filter(scenario == "RCP45", year == 2055, interval == "mon")) |>
  select(all_of(cfg_g_Dec$keep_vars)) |>
  slice("month", "Dec")
forecast_rcp45_2055_Dec = predict_stars(wflow_g_Dec, covars_rcp45_2055_Dec)


rcp45_Dec = c(nowcast_g_Dec, forecast_rcp45_2055_Dec, forecast_rcp45_2075_Dec, along = list(year = c("2020", "2055", "2075")))


plot_coast = function(){
  plot(coast, col = "orange", lwd = 2, add = TRUE)
}
plot(rcp45_Dec['.pred_presence'], 
     hook = plot_coast,
     axes = TRUE, breaks = seq(0, 1, by = 0.1), join_zlim  = TRUE, reset = FALSE)
#rcp45 ends

path = data_path("predictions")
if (!dir.exists(path)) ok = dir.create(path, recursive = TRUE)

# write individual arrays?
write_prediction(nowcast_g_Dec, file = file.path(path,"g_Dec_2020.tif"))
write_prediction(forecast_rcp85_2055_Dec, file = file.path(path, "g_Dec_RCP85_2055.tif"))
write_prediction(forecast_rcp85_2075_Dec, file = file.path(path, "g_Dec_RCP85_2075.tif"))
write_prediction(forecast_rcp45_2055_Dec, file = file.path(path, "g_Dec_RCP45_2055.tif"))
write_prediction(forecast_rcp45_2075_Dec, file = file.path(path, "g_Dec_RCP45_2075.tif"))

# or write them together in a "multi-layer" file?
write_prediction(rcp85_Dec, file = file.path(path, "g_Dec_RCP85_all.tif"))
