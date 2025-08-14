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
  state_name = "IOWA",
  commodity_desc = "LAND IN FARMS",
  statisticcat_desc = "AREA OPERATED",
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
  farm_land_data <- parsed_data$data
  print(farm_land_data)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
}