
rm(list = ls())
gc()

usethis::edit_r_environ()
Sys.getenv('my_username')
Sys.getenv('qstat_user')
Sys.getenv('qstat_api')

# Load required libraries
library(httr)
library(jsonlite)

#global variable for county name
c_name <<- "ALLAMAKEE"


# Define your API key and base URL
api_key <- paste0(Sys.getenv('qstat_api'))
base_url <- "https://quickstats.nass.usda.gov/api/api_GET/"


#another request - this one is for total cattle survey
params14 <- list(
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
response14 <- GET(base_url, query = params14)

# Check the status of the API request
if (status_code(response14) == 200) {
  # Parse the JSON content
  data14 <- content(response14, "text")
  parsed_data14 <- fromJSON(data14, flatten = TRUE)
  
  # Extract the desired data
  df14 <- parsed_data14$data
  df14_clean <- df14[df14$county_name != "", ]
  print(df14_clean)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df14_clean<- NULL
}

ranked <- rank(-data, ties.method = "average")

df14_clean$rank <- rank(-(df14_clean$Value))
df_sorted <- df14_clean[order(df14_clean$county_name), ]

# Combine the dataframes by stacking them on top of each other


combined_df <- rbind(df1, df2, df3, df4, df5, df6, df7, df8, df9, df10, df11, df12, df13, df14, df15, df16, df17, df18, df19, df20, df21, df22, df23, df24)
selected_columns <- combined_df[, c("year", "source_desc", "state_name", "county_name", "short_desc", "Value")]
assign(c_name, selected_columns)


