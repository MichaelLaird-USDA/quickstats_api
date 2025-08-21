
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
params_rank <- list(
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
response_rank <- GET(base_url, query = params_rank)

# Check the status of the API request
if (status_code(response_rank) == 200) {
  # Parse the JSON content
  qs_data_rank <- content(response_rank, "text")
  parsed_data_rank <- fromJSON(qs_data_rank, flatten = TRUE)
  
  # Extract the desired data
  df_rank <- parsed_data_rank$data
  df_clean_rank <- df_rank[((df_rank$county_name != "")&(df_rank$county_name != "OTHER COUNTIES")), ]
  print(df_clean_rank)
} else {
  print(paste("Error:", status_code(response_rank))) # Print error if request fails
  df_clean_rank<- NULL
}


df_clean_rank$value1 <- as.numeric(gsub(",", "", df_clean_rank$Value))

df_clean_rank$all_cattle_rank <- rank(-(df_clean_rank$value1), ties.method = "min") 

all_cattle_rank <- df_clean_rank[order(df_clean_rank$county_name), ]

# Combine the dataframes by stacking them on top of each other


#another request - this one is for total beef cattle survey
params15_rank <- list(
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
response15_rank <- GET(base_url, query = params15_rank)

# Check the status of the API request
if (status_code(response15_rank) == 200) {
  # Parse the JSON content
  qs_data15_rank <- content(response15_rank, "text")
  parsed_data15_rank <- fromJSON(qs_data15_rank, flatten = TRUE)
  
  # Extract the desired data
  df15_rank <- parsed_data15_rank$data
  df15_clean_rank <- df15_rank[((df15_rank$county_name != "")&(df15_rank$county_name != "OTHER COUNTIES")), ]
  print(df15_rank)
} else {
  print(paste("Error:", status_code(response15_rank))) # Print error if request fails
  df15_rank<- NULL
}

df15_clean_rank$value1 <- as.numeric(gsub(",", "", df15_clean_rank$Value))

df15_clean_rank$beef_cows_rank <- rank(-(df15_clean_rank$value1), ties.method = "min") 

beef_cows_rank<- df15_clean_rank[order(df15_clean_rank$county_name), ]

write.csv(beef_cows_rank, file = "J:/IA_COUNTIES.csv", row.names = FALSE)


#another request - this one is for total milk cattle survey
params16_rank <- list(
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
response16_rank <- GET(base_url, query = params16_rank)

# Check the status of the API request
if (status_code(response16_rank) == 200) {
  # Parse the JSON content
  qs_data16_rank <- content(response16_rank, "text")
  parsed_data16_rank <- fromJSON(qs_data16_rank, flatten = TRUE)
  
  # Extract the desired data
  df16_rank <- parsed_data16_rank$data
  df16_clean_rank <- df16_rank[((df16_rank$county_name != "")&(df16_rank$county_name != "OTHER COUNTIES")), ]
  print(df16_rank)
} else {
  print(paste("Error:", status_code(response16_rank))) # Print error if request fails
  df16_rank<- NULL
}

df16_clean_rank$value1 <- as.numeric(gsub(",", "", df16_clean_rank$Value))

df16_clean_rank$milk_cows_rank <- rank(-(df16_clean_rank$value1), ties.method = "min") 

milk_cows_rank <- df16_clean_rank[order(df16_clean_rank$county_name), ]




#another request - this one is for total corn grain production
params20_rank <- list(
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
response20_rank <- GET(base_url, query = params20_rank)

# Check the status of the API request
if (status_code(response20_rank) == 200) {
  # Parse the JSON content
  qs_data20_rank <- content(response20_rank, "text")
  parsed_data20_rank <- fromJSON(qs_data20_rank, flatten = TRUE)
  
  # Extract the desired data
  df20_rank <- parsed_data20_rank$data
  df20_clean_rank <- df20_rank[((df20_rank$county_name != "")&(df20_rank$county_name != "OTHER COUNTIES")), ]
  print(df20_rank)
} else {
  print(paste("Error:", status_code(response20_rank))) # Print error if request fails
  df20_rank<- NULL
}

df20_clean_rank$value1 <- as.numeric(gsub(",", "", df20_clean_rank$Value))

df20_clean_rank$corn_prod_rank <- rank(-(df20_clean_rank$value1), ties.method = "min") 

corn_prod_rank <- df20_clean_rank[order(df20_clean_rank$county_name), ]


#another request - this one is for total SOYBEANS grain production
params24_rank <- list(
  key = api_key,
  year__GE = 2024,
  period = "YEAR",
  source_desc = "SURVEY",
  state_name = "IOWA",
  commodity_desc = "SOYBEANS",
  short_desc = "SOYBEANS - PRODUCTION, MEASURED IN BU",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response24_rank <- GET(base_url, query = params24_rank)

# Check the status of the API request
if (status_code(response24_rank) == 200) {
  # Parse the JSON content
  qs_data24_rank <- content(response24_rank, "text")
  parsed_data24_rank <- fromJSON(qs_data24_rank, flatten = TRUE)
  
  # Extract the desired data
  df24_rank <- parsed_data24_rank$data
  df24_clean_rank <- df24_rank[((df24_rank$county_name != "")&(df24_rank$county_name != "OTHER COUNTIES")), ]
  print(df24)
} else {
  print(paste("Error:", status_code(response24_rank))) # Print error if request fails
  df24_rank<- NULL
}


df24_clean_rank$value1 <- as.numeric(gsub(",", "", df24_clean_rank$Value))

df24_clean_rank$soy_prod_rank <- rank(-(df24_clean_rank$value1), ties.method = "min") 

soy_prod_rank <- df24_clean_rank[order(df24_clean_rank$county_name), ]
