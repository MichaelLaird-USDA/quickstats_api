
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
  df_clean <- df[df$county_name != "", ]
  print(df_clean)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df_clean<- NULL
}


df_clean$value1 <- as.numeric(gsub(",", "", df_clean$Value))

df_clean$Rank <- rank(-(df_clean$value1), ties.method = "min") 

df_sorted <- df_clean[order(df_clean$county_name), ]

# Combine the dataframes by stacking them on top of each other

