#pulling the data from Obis database
Scallop = fetch_obis(scientificname = "Placopecten magellanicus") |>
  print()

#getting a feel for the data
summary(Scallop)

#checking the origin of the data
count(Scallop, basisOfRecord)

#checking the distribution of months
count(Scallop, month)

#basic barplot to check the distribution of counts across month
ggplot(Scallop, aes(x=month))+
  geom_bar()

#basic barplot to check the distribution of counts across years
ggplot(Scallop, aes(x=year))+
  geom_bar()

#plotting spatial data to see a map of scallop observations
coast = read_coastline()

ggplot(Scallop)+
  geom_sf(alpha = 0.1,
          size = 0.7)+
  geom_sf(data = coast,
          col = "orange")+
  facet_wrap(~month)

#removing all NAs from the eventDate and individualCount
Scallop = Scallop %>%
  filter(!is.na(eventDate))%>%
  filter(!is.na(individualCount))
summary(Scallop)

#beginning of C01 Observations assignment
source("setup.R")
SPECIES = "Placopecten magellanicus"

#reading in scallop obs data
obs = read_obis(SPECIES)
obs
summary(obs)
#checking number of rows and columns
dim_start = dim(obs)
dim_start

#checking how each observation was made
obs %>% count(basisOfRecord)

#taking a closer look at each type of observation
human = obs %>%
  filter(basisOfRecord == "HumanObservation") %>%
  slice(1) %>%
  browse_obis()

human2 = obs %>%
  filter(basisOfRecord == "Human observation") %>%
  slice(1) %>%
  browse_obis()

Occurrence = obs %>%
  filter(basisOfRecord == "Occurrence") %>%
  slice(1) %>%
  browse_obis()

Preserved = obs %>%
  filter(basisOfRecord == "PreservedSpecimen") %>%
  slice(1) %>%
  browse_obis()

summary(obs)

#filtering out NAs
obs = obs %>%
  filter(!is.na(eventDate))%>%
  filter(!is.na(individualCount))
summary(obs)

#looking at one particular observation
maxobservations = obs %>%
  filter(individualCount == 12059.00) %>%
  slice(1) %>%
  browse_obis()

#plotting by year
ggplot(obs, aes(x=year))+
  geom_bar()+
  geom_vline(xintercept = c(1982, 2013), linetype = "dashed") + 
  labs(title = "Counts per year")

#filtering to just observations after 1960
obs = obs |>
  filter(year >= 1960)
dim(obs)

#ordering the months
obs = obs |>
  mutate(month = factor(month, levels = month.abb))

ggplot(data = obs,
       mapping = aes(x = month)) + 
  geom_bar() + 
  labs(title = "Counts per month")

#masking data by coastline
db = brickman_database() |>
  filter(scenario == "STATIC", var == "mask")
mask = read_brickman(db, add_depth = FALSE)
mask

#plotting masked geographic data
plot(mask, breaks = "equal", axes = TRUE, reset = FALSE)
plot(st_geometry(obs), pch = ".", add = TRUE)
plot(st_geometry(obs%>%filter(is.na(individualCount))), pch = ".", add = TRUE, col = "yellow")

#applying the mask to the points?
hitOrMiss = extract_brickman(mask, obs)
hitOrMiss
count(hitOrMiss, value)

#filtering out observations that don't fall within the mask
obs = obs |>
  filter(!is.na(hitOrMiss$value))
dim_end = dim(obs)

dropped_records = dim_start[1] - dim_end[1]
dropped_records

#end of assignment C01 