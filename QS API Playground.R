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

# Define the parameters for the API request
params <- list(
  key = api_key,
  year__GE = 2022,
  source_desc = "CENSUS",
  state_name = "IOWA",
  county_name = "ADAIR",
  commodity_desc = "FARM OPERATIONS",
  short_desc = "FARM OPERATIONS - ACRES OPERATED",
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
  df1 <- parsed_data$data
  print(df1)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
}

#another request
params2 <- list(
  key = api_key,
  year__GE = 2022,
  source_desc = "CENSUS",
  state_name = "IOWA",
  county_name = "ADAIR",
  commodity_desc = "FARM OPERATIONS",
  short_desc = "FARM OPERATIONS - NUMBER OF OPERATIONS",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response2 <- GET(base_url, query = params2)

# Check the status of the API request
if (status_code(response2) == 200) {
  # Parse the JSON content
  data2 <- content(response2, "text")
  parsed_data2 <- fromJSON(data2, flatten = TRUE)
  
  # Extract the desired data
  df2 <- parsed_data2$data
  print(df2)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
}


#another request
params3 <- list(
  key = api_key,
  year__GE = 2022,
  source_desc = "CENSUS",
  state_name = "IOWA",
  county_name = "ADAIR",
  commodity_desc = "FARM OPERATIONS",
  short_desc = "FARM OPERATIONS - AREA OPERATED, MEASURED IN ACRES / OPERATION",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response3 <- GET(base_url, query = params3)

# Check the status of the API request
if (status_code(response3) == 200) {
  # Parse the JSON content
  data3 <- content(response3, "text")
  parsed_data3 <- fromJSON(data3, flatten = TRUE)
  
  # Extract the desired data
  df3 <- parsed_data3$data
  print(df3)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
}


#another request
params4 <- list(
  key = api_key,
  year__GE = 2022,
  source_desc = "CENSUS",
  state_name = "IOWA",
  county_name = "ADAIR",
  commodity_desc = "PRODUCERS",
  short_desc = "PRODUCERS - AGE, AVG, MEASURED IN YEARS",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response4 <- GET(base_url, query = params4)

# Check the status of the API request
if (status_code(response4) == 200) {
  # Parse the JSON content
  data4 <- content(response4, "text")
  parsed_data4 <- fromJSON(data4, flatten = TRUE)
  
  # Extract the desired data
  df4 <- parsed_data4$data
  print(df4)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
}

# Combine the two dataframes by stacking them on top of each other


combined_df <- rbind(df1, df2, df3, df4)
selected_columns <- combined_df[, c("year", "state_name", "county_name", "short_desc", "Value")]
