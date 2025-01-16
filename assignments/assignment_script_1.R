DB = brickman_database()
buoys = gom_buoys()
coast = read_coastline()

#filtering each dataset
m01 <- buoys %>%
  dplyr::filter(id == "M01")

RCP45 <- DB %>%
  dplyr::filter(scenario == "RCP45",
                year == "2055",
                interval == "mon")

#read in covariates
covars = read_brickman(db)

#extract varaibles from covariates
extraction = extract_brickman(covars, buoys, form = "wide")

#order the months chronologically
extraction = extraction %>%
  mutate(month = factor(month, levels = month.abb))

#plot the sst by month for buouy m01 in scenario rcp45
ggplot(extraction, aes(x=month, y=SST))+
  geom_point()+
  theme_bw()+
  labs(x="Month", y="Sea Surface Temperature (C)", title = "Predicted Sea Surface Temperature at Buouy M01 in 2055 in Scenario RCP45")
