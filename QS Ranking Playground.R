
rm(list = ls())
gc()

usethis::edit_r_environ()
Sys.getenv('my_username')
Sys.getenv('qstat_user')
Sys.getenv('qstat_api')

# Load required libraries
library(httr)
library(jsonlite)


# Define your API key and base URL
api_key <- paste0(Sys.getenv('qstat_api'))
base_url <- "https://quickstats.nass.usda.gov/api/api_GET/"


#another request - this one is for total cattle survey
params <- list(
  key = api_key,
  year__GE = 2025,
  period = "FIRST OF JAN",
  source_desc = "SURVEY",
  state_name = "IOWA",
  commodity_desc = "CATTLE",
  short_desc = "CATTLE, INCL CALVES - INVENTORY",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response <- GET(base_url, query = params)

# Check the status of the API request
if (status_code(response) == 200) {
  # Parse the JSON content
  data <- content(response, "text")
  parsed_data <- fromJSON(data, flatten = TRUE)
  
  # Extract the desired data
  df <- parsed_data$data
  df_clean <- df[((df$county_name != "")&(df$county_name != "OTHER COUNTIES")), ]
  print(df_clean)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df_clean<- NULL
}


df_clean$value1 <- as.numeric(gsub(",", "", df_clean$Value))

df_clean$Rank <- rank(-(df_clean$value1), ties.method = "min") 

df_sorted <- df_clean[order(df_clean$county_name), ]

# Combine the dataframes by stacking them on top of each other


#another request - this one is for total beef cattle survey
params15 <- list(
  key = api_key,
  year__GE = 2025,
  period = "FIRST OF JAN",
  source_desc = "SURVEY",
  state_name = "IOWA",
  commodity_desc = "CATTLE",
  short_desc = "CATTLE, COWS, BEEF - INVENTORY",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response15 <- GET(base_url, query = params15)

# Check the status of the API request
if (status_code(response15) == 200) {
  # Parse the JSON content
  data15 <- content(response15, "text")
  parsed_data15 <- fromJSON(data15, flatten = TRUE)
  
  # Extract the desired data
  df15 <- parsed_data15$data
  df15_clean <- df15[((df15$county_name != "")&(df15$county_name != "OTHER COUNTIES")), ]
  print(df15)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df15<- NULL
}

df15_clean$value1 <- as.numeric(gsub(",", "", df15_clean$Value))

df15_clean$Rank <- rank(-(df15_clean$value1), ties.method = "min") 

df15_sorted <- df15_clean[order(df15_clean$county_name), ]



#another request - this one is for total milk cattle survey
params16 <- list(
  key = api_key,
  year__GE = 2025,
  period = "FIRST OF JAN",
  source_desc = "SURVEY",
  state_name = "IOWA",
  commodity_desc = "CATTLE",
  short_desc = "CATTLE, COWS, MILK - INVENTORY",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response16 <- GET(base_url, query = params16)

# Check the status of the API request
if (status_code(response16) == 200) {
  # Parse the JSON content
  data16 <- content(response16, "text")
  parsed_data16 <- fromJSON(data16, flatten = TRUE)
  
  # Extract the desired data
  df16 <- parsed_data16$data
  df16_clean <- df16[((df16$county_name != "")&(df16$county_name != "OTHER COUNTIES")), ]
  print(df16)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df16<- NULL
}

df16_clean$value1 <- as.numeric(gsub(",", "", df16_clean$Value))

df16_clean$Rank <- rank(-(df16_clean$value1), ties.method = "min") 

df16_sorted <- df16_clean[order(df16_clean$county_name), ]




#another request - this one is for total corn grain production
params20 <- list(
  key = api_key,
  year__GE = 2024,
  period = "YEAR",
  source_desc = "SURVEY",
  state_name = "IOWA",
  commodity_desc = "CORN",
  short_desc = "CORN, GRAIN - PRODUCTION, MEASURED IN BU",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response20 <- GET(base_url, query = params20)

# Check the status of the API request
if (status_code(response20) == 200) {
  # Parse the JSON content
  data20 <- content(response20, "text")
  parsed_data20 <- fromJSON(data20, flatten = TRUE)
  
  # Extract the desired data
  df20 <- parsed_data20$data
  df20_clean <- df20[((df20$county_name != "")&(df20$county_name != "OTHER COUNTIES")), ]
  print(df20)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df20<- NULL
}

df20_clean$value1 <- as.numeric(gsub(",", "", df20_clean$Value))

df20_clean$Rank <- rank(-(df20_clean$value1), ties.method = "min") 

df20_sorted <- df20_clean[order(df20_clean$county_name), ]

