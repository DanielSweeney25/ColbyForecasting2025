DB = brickman_database()
buoys = gom_buoys()
coast = read_coastline()

#filtering each dataset
m01 <- bouys %>%
  dplyr::filter(id == "static")