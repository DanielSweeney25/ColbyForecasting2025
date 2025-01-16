
read_observations = function(scientificname = "Mola mola",
                             minimum_year = 1970, 
                             ...){
  
  #' Read raw OBIS data and then filter it
  #' 
  #' @param scientificname chr, the name of the species to read
  #' @param minimum_year num, the earliest year of observation to accept or 
  #'   set to NULL to skip
  #' @param ... other arguments passed to `read_obis()`
  #' @return a filtered table of observations
  
  # Happy coding!
  
  # read in the raw data
  x = read_obis(scientificname, ...)
  
  # if the user provided a non-NULL filter by year
  if (!is.null(minimum_year)){
    x = x |>
      filter(year >= minimum_year)
  }
  
  return(x)
}

read_obs = function(scientificname = "Placopecten magellanicus",
                             minimum_year = 1960,
                    clean_individual_count = TRUE,
                             ...){
  
  #' Read raw OBIS data and then filter it
  #' 
  #' @param scientificname chr, the name of the species to read
  #' @param minimum_year num, the earliest year of observation to accept or 
  #'   set to NULL to skip
  #' @param clean_individual_count logical, if true remove missing individual counts
  #' @param ... other arguments passed to `read_obis()`
  #' @return a filtered table of observations
  
  # Happy coding!
  
  # read in the raw data
  x = read_obis(scientificname, ...)%>%
    filter(!is.na(eventDate))
  
  # if the user provided a non-NULL filter by year
  if (!is.null(minimum_year)){
    x = x |>
      filter(year >= minimum_year)
  }
  if (clean_individual_count){
    x = x |>
      filter(!is.na(individualCount))
  }
  return(x)
}