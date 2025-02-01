#pulling the data from Obis database
Scallop = fetch_obis(scientificname = "Placopecten magellanicus") |>
  print()

#getting a feel for the data
summary(Scallop)
BasisofScallop <- Scallop %>%
  group_by(basisOfRecord)
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

ggplot(ScallopNAremoved)+
  geom_sf(alpha = 0.1,
          size = 0.7)+
  geom_sf(data = coast,
          col = "orange")+
  facet_wrap(~month)

MonthlySpatial <- ggplot(Scallop)+
  geom_sf(alpha = 0.1,
          size = 0.7)+
  geom_sf(data = coast,
          col = "orange")+
  facet_wrap(~month)

ggsave("MonthlySpatial.png", plot = MonthlySpatial, width = 8, height = 8, units = "in", dpi = 300)

Scallop = Scallop %>%
mutate(month = factor(month, levels = month.abb))

#removing all NAs from the eventDate and individualCount
ScallopNAremoved = Scallop %>%
  filter(!is.na(eventDate))%>%
  filter(!is.na(individualCount))
summary(Scallop)

Scallop %>% count(basisOfRecord)
ScallopNAremoved %>% count(basisOfRecord)

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

na_counts <- colSums(is.na(BasisofScallop))

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
obs_noNA = obs %>%
  filter(!is.na(eventDate))%>%
  filter(!is.na(individualCount))
summary(obs_noNA)

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
obs_read = obs_read %>%
  as.Date(eventDate)
Datayear <- ggplot(obs_read, aes(x=year))+
  geom_bar()+
  scale_x_continuous(
    breaks = seq(1960, 2021, by = 5))+
  scale_y_continuous(expand = c(0, 0))+
  labs(x = "Year", y = "Observations Count")+
  theme_classic()

ggsave(filename = "DataYear2.png", plot = Datayear, width = 8, height = 4, units = "in", dpi = 300)

obs_read = obs_read |>
  mutate(month = factor(month, levels = month.abb))

Datamonth <- ggplot(data = obs_read,
       mapping = aes(x = month)) + 
  geom_bar() + 
  geom_text(stat = "count", aes(label = ..count..), vjust = -.5, size = 3) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 2000))+
  theme_classic()+
  labs(x = "Month", y = "Observations Count")

ggsave(filename = "DataMonth2.png", plot = Datamonth, width = 8, height = 4, units = "in", dpi = 300)

obs_noNAyear = obs_noNA |>
  filter(year >= 1960)

obs_NA = obs %>%
  filter(is.na(eventDate))%>%
  filter(is.na(individualCount))
summary(obs_NA)
obs_NA %>% count(basisOfRecord)


db = brickman_database() |>
  filter(scenario == "STATIC", var == "mask")

mask = read_brickman(db, add_depth = FALSE)

plot(mask, breaks = "equal", axes = TRUE, reset = FALSE)
plot(st_geometry(obs_read), pch = ".", add = TRUE)
