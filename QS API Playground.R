
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

# Define the parameters for the API request - this one is for census acres operated
params <- list(
  key = api_key,
  year__GE = 2022,
  source_desc = "CENSUS",
  state_name = "IOWA",
  county_name = c_name,
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
  df1<- NULL
}

#another request - this one is for census number of operations 
params2 <- list(
  key = api_key,
  year__GE = 2022,
  source_desc = "CENSUS",
  state_name = "IOWA",
county_name = c_name,
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
  df2<- NULL
}


#another request - this one is for avg acres/operation
params3 <- list(
  key = api_key,
  year__GE = 2022,
  source_desc = "CENSUS",
  state_name = "IOWA",
county_name = c_name,
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
  df3<- NULL
}


#another request - this one is for avg operator age
params4 <- list(
  key = api_key,
  year__GE = 2022,
  source_desc = "CENSUS",
  state_name = "IOWA",
county_name = c_name,
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
  df4<- NULL
}



#another request - this one is for num males
params5 <- list(
  key = api_key,
  year__GE = 2022,
  source_desc = "CENSUS",
  state_name = "IOWA",
county_name = c_name,
  commodity_desc = "PRODUCERS",
  short_desc = "PRODUCERS, MALE - NUMBER OF PRODUCERS",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response5 <- GET(base_url, query = params5)

# Check the status of the API request
if (status_code(response5) == 200) {
  # Parse the JSON content
  data5 <- content(response5, "text")
  parsed_data5 <- fromJSON(data5, flatten = TRUE)
  
  # Extract the desired data
  df5 <- parsed_data5$data
  print(df5)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df5<- NULL
}


#another request - this one is for num females
params6 <- list(
  key = api_key,
  year__GE = 2022,
  source_desc = "CENSUS",
  state_name = "IOWA",
county_name = c_name,
  commodity_desc = "PRODUCERS",
  short_desc = "PRODUCERS, FEMALE - NUMBER OF PRODUCERS",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response6 <- GET(base_url, query = params6)

# Check the status of the API request
if (status_code(response6) == 200) {
  # Parse the JSON content
  data6 <- content(response6, "text")
  parsed_data6 <- fromJSON(data6, flatten = TRUE)
  
  # Extract the desired data
  df6 <- parsed_data6$data
  print(df6)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df6<- NULL
}




#another request - this one is for hay
params7 <- list(
  key = api_key,
  year__GE = 2022,
  source_desc = "CENSUS",
  state_name = "IOWA",
county_name = c_name,
  commodity_desc = "HAY",
  short_desc = "HAY - PRODUCTION, MEASURED IN TONS",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response7 <- GET(base_url, query = params7)

# Check the status of the API request
if (status_code(response7) == 200) {
  # Parse the JSON content
  data7 <- content(response7, "text")
  parsed_data7 <- fromJSON(data7, flatten = TRUE)
  
  # Extract the desired data
  df7 <- parsed_data7$data
  print(df7)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df7<- NULL
}



#another request - this one is for total vos all products
params8 <- list(
  key = api_key,
  year__GE = 2022,
  source_desc = "CENSUS",
  state_name = "IOWA",
county_name = c_name,
  commodity_desc = "COMMODITY TOTALS",
  short_desc = "COMMODITY TOTALS - SALES, MEASURED IN $",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response8 <- GET(base_url, query = params8)

# Check the status of the API request
if (status_code(response8) == 200) {
  # Parse the JSON content
  data8 <- content(response8, "text")
  parsed_data8 <- fromJSON(data8, flatten = TRUE)
  
  # Extract the desired data
  df8 <- parsed_data8$data
  print(df8)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df8<- NULL
}


#another request - this one is for total vos all crops
params9 <- list(
  key = api_key,
  year__GE = 2022,
  source_desc = "CENSUS",
  state_name = "IOWA",
county_name = c_name,
  commodity_desc = "CROP TOTALS",
  short_desc = "CROP TOTALS - SALES, MEASURED IN $",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response9 <- GET(base_url, query = params9)

# Check the status of the API request
if (status_code(response9) == 200) {
  # Parse the JSON content
  data9 <- content(response9, "text")
  parsed_data9 <- fromJSON(data9, flatten = TRUE)
  
  # Extract the desired data
  df9 <- parsed_data9$data
  print(df9)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df9<- NULL
}



#another request - this one is for total vos all livestock
params10 <- list(
  key = api_key,
  year__GE = 2022,
  source_desc = "CENSUS",
  state_name = "IOWA",
county_name = c_name,
  commodity_desc = "ANIMAL TOTALS",
  short_desc = "ANIMAL TOTALS, INCL PRODUCTS - SALES, MEASURED IN $",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response10 <- GET(base_url, query = params10)

# Check the status of the API request
if (status_code(response10) == 200) {
  # Parse the JSON content
  data10 <- content(response10, "text")
  parsed_data10 <- fromJSON(data10, flatten = TRUE)
  
  # Extract the desired data
  df10 <- parsed_data10$data
  print(df10)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df10<- NULL
}



#another request - this one is for total prod expenses
params11 <- list(
  key = api_key,
  year__GE = 2022,
  source_desc = "CENSUS",
  state_name = "IOWA",
county_name = c_name,
  commodity_desc = "EXPENSE TOTALS",
  short_desc = "EXPENSE TOTALS, OPERATING - EXPENSE, MEASURED IN $",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response11 <- GET(base_url, query = params11)

# Check the status of the API request
if (status_code(response11) == 200) {
  # Parse the JSON content
  data11 <- content(response11, "text")
  parsed_data11 <- fromJSON(data11, flatten = TRUE)
  
  # Extract the desired data
  df11 <- parsed_data11$data
  print(df11)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df11<- NULL
}


#another request - this one is for total hog inv
params12 <- list(
  key = api_key,
  year__GE = 2022,
  source_desc = "CENSUS",
  state_name = "IOWA",
county_name = c_name,
  commodity_desc = "HOGS",
  short_desc = "HOGS - INVENTORY",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response12 <- GET(base_url, query = params12)

# Check the status of the API request
if (status_code(response12) == 200) {
  # Parse the JSON content
  data12 <- content(response12, "text")
  parsed_data12 <- fromJSON(data12, flatten = TRUE)
  
  # Extract the desired data
  df12 <- parsed_data12$data
  print(df12)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df12<- NULL
}

#another request - this one is for total layer inv
params13 <- list(
  key = api_key,
  year__GE = 2022,
  source_desc = "CENSUS",
  state_name = "IOWA",
county_name = c_name,
  commodity_desc = "CHICKENS",
  short_desc = "CHICKENS, LAYERS - INVENTORY",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response13 <- GET(base_url, query = params13)

# Check the status of the API request
if (status_code(response13) == 200) {
  # Parse the JSON content
  data13 <- content(response13, "text")
  parsed_data13 <- fromJSON(data13, flatten = TRUE)
  
  # Extract the desired data
  df13 <- parsed_data13$data
  print(df13)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df13<- NULL
}



#another request - this one is for total cattle survey
params14 <- list(
  key = api_key,
  year__GE = 2025,
  period = "FIRST OF JAN",
  source_desc = "SURVEY",
  state_name = "IOWA",
  county_name = c_name,
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
  print(df14)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df14<- NULL
}



#another request - this one is for total beef cattle survey
params15 <- list(
  key = api_key,
  year__GE = 2025,
  period = "FIRST OF JAN",
  source_desc = "SURVEY",
  state_name = "IOWA",
  county_name = c_name,
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
  print(df15)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df15<- NULL
}




#another request - this one is for total milk cattle survey
params16 <- list(
  key = api_key,
  year__GE = 2025,
  period = "FIRST OF JAN",
  source_desc = "SURVEY",
  state_name = "IOWA",
  county_name = c_name,
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
  print(df16)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df16<- NULL
}



#another request - this one is for total corn planted
params17 <- list(
  key = api_key,
  year__GE = 2024,
  period = "YEAR",
  source_desc = "SURVEY",
  state_name = "IOWA",
  county_name = c_name,
  commodity_desc = "CORN",
  short_desc = "CORN - ACRES PLANTED",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response17 <- GET(base_url, query = params17)

# Check the status of the API request
if (status_code(response17) == 200) {
  # Parse the JSON content
  data17 <- content(response17, "text")
  parsed_data17 <- fromJSON(data17, flatten = TRUE)
  
  # Extract the desired data
  df17 <- parsed_data17$data
  print(df17)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df17<- NULL
}

#another request - this one is for total corn harvested
params18 <- list(
  key = api_key,
  year__GE = 2024,
  period = "YEAR",
  source_desc = "SURVEY",
  state_name = "IOWA",
  county_name = c_name,
  commodity_desc = "CORN",
  short_desc = "CORN, GRAIN - ACRES HARVESTED",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response18 <- GET(base_url, query = params18)

# Check the status of the API request
if (status_code(response18) == 200) {
  # Parse the JSON content
  data18 <- content(response18, "text")
  parsed_data18 <- fromJSON(data18, flatten = TRUE)
  
  # Extract the desired data
  df18 <- parsed_data18$data
  print(df18)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df18<- NULL
}


#another request - this one is for total corn grain yield
params19 <- list(
  key = api_key,
  year__GE = 2024,
  period = "YEAR",
  source_desc = "SURVEY",
  state_name = "IOWA",
  county_name = c_name,
  commodity_desc = "CORN",
  short_desc = "CORN, GRAIN - YIELD, MEASURED IN BU / ACRE",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response19 <- GET(base_url, query = params19)

# Check the status of the API request
if (status_code(response19) == 200) {
  # Parse the JSON content
  data19 <- content(response19, "text")
  parsed_data19 <- fromJSON(data19, flatten = TRUE)
  
  # Extract the desired data
  df19 <- parsed_data19$data
  print(df19)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df19<- NULL
}


#another request - this one is for total corn grain production
params20 <- list(
  key = api_key,
  year__GE = 2024,
  period = "YEAR",
  source_desc = "SURVEY",
  state_name = "IOWA",
  county_name = c_name,
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
  print(df20)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df20<- NULL
}


#another request - this one is for total soy planted
params21 <- list(
  key = api_key,
  year__GE = 2024,
  period = "YEAR",
  source_desc = "SURVEY",
  state_name = "IOWA",
  county_name = c_name,
  commodity_desc = "SOYBEANS",
  short_desc = "SOYBEANS - ACRES PLANTED",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response21 <- GET(base_url, query = params21)

# Check the status of the API request
if (status_code(response21) == 200) {
  # Parse the JSON content
  data21 <- content(response21, "text")
  parsed_data21 <- fromJSON(data21, flatten = TRUE)
  
  # Extract the desired data
  df21 <- parsed_data21$data
  print(df21)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df21<- NULL
}

#another request - this one is for total SOYBEANS harvested
params22 <- list(
  key = api_key,
  year__GE = 2024,
  period = "YEAR",
  source_desc = "SURVEY",
  state_name = "IOWA",
  county_name = c_name,
  commodity_desc = "SOYBEANS",
  short_desc = "SOYBEANS - ACRES HARVESTED",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response22 <- GET(base_url, query = params22)

# Check the status of the API request
if (status_code(response22) == 200) {
  # Parse the JSON content
  data22 <- content(response22, "text")
  parsed_data22 <- fromJSON(data22, flatten = TRUE)
  
  # Extract the desired data
  df22 <- parsed_data22$data
  print(df22)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df22<- NULL
}


#another request - this one is for total SOYBEANS yield
params23 <- list(
  key = api_key,
  year__GE = 2024,
  period = "YEAR",
  source_desc = "SURVEY",
  state_name = "IOWA",
  county_name = c_name,
  commodity_desc = "SOYBEANS",
  short_desc = "SOYBEANS - YIELD, MEASURED IN BU / ACRE",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response23 <- GET(base_url, query = params23)

# Check the status of the API request
if (status_code(response23) == 200) {
  # Parse the JSON content
  data23 <- content(response23, "text")
  parsed_data23 <- fromJSON(data23, flatten = TRUE)
  
  # Extract the desired data
  df23 <- parsed_data23$data
  print(df23)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df23<- NULL
}


#another request - this one is for total SOYBEANS grain production
params24 <- list(
  key = api_key,
  year__GE = 2024,
  period = "YEAR",
  source_desc = "SURVEY",
  state_name = "IOWA",
  county_name = c_name,
  commodity_desc = "SOYBEANS",
  short_desc = "SOYBEANS - PRODUCTION, MEASURED IN BU",
  domaincat_desc = "NOT SPECIFIED",
  format = "json"
)
# Make the API request
response24 <- GET(base_url, query = params24)

# Check the status of the API request
if (status_code(response24) == 200) {
  # Parse the JSON content
  data24 <- content(response24, "text")
  parsed_data24 <- fromJSON(data24, flatten = TRUE)
  
  # Extract the desired data
  df24 <- parsed_data24$data
  print(df24)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df24<- NULL
}


# Combine the dataframes by stacking them on top of each other


combined_df <- rbind(df1, df2, df3, df4, df5, df6, df7, df8, df9, df10, df11, df12, df13, df14, df15, df16, df17, df18, df19, df20, df21, df22, df23, df24)
selected_columns <- combined_df[, c("year", "source_desc", "state_name", "county_name", "short_desc", "Value")]
assign(c_name, selected_columns)


