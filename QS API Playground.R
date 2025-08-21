
rm(list = ls())
gc()

usethis::edit_r_environ()
Sys.getenv('my_username')
Sys.getenv('qstat_user')
Sys.getenv('qstat_api')

# Load required libraries
library(httr)
library(jsonlite)
library(tibble)

# Define your API key and base URL
api_key <- paste0(Sys.getenv('qstat_api'))
base_url <- "https://quickstats.nass.usda.gov/api/api_GET/"

#global variable for county name
#c_name <<- "ADAIR"
c_name <<- "ADAMS"
#c_name <<- "ALLAMAKEE"
#c_name <<- "APPANOOSE"
#c_name <<- "AUDUBON"
#c_name <<- "BENTON"
#c_name <<- "BLACK HAWK"
#c_name <<- "BOONE"
#c_name <<- "BREMER"
#c_name <<- "BUCHANAN"
#c_name <<- "BUENA VISTA"
#c_name <<- "BUTLER"
#c_name <<- "CALHOUN"
#c_name <<- "CARROLL"
#c_name <<- "CASS"
#c_name <<- "CEDAR"
#c_name <<- "CERRO GORDO"
#c_name <<- "CHEROKEE"
#c_name <<- "CHICKASAW"
#c_name <<- "CLARKE"
#c_name <<- "CLAY"
#c_name <<- "CLAYTON"
#c_name <<- "CLINTON"
#c_name <<- "CRAWFORD"
#c_name <<- "DALLAS"
#c_name <<- "DAVIS"
#c_name <<- "DECATUR"
#c_name <<- "DELAWARE"
#c_name <<- "DES MOINES"
#c_name <<- "DICKINSON"
#c_name <<- "DUBUQUE"
#c_name <<- "EMMET"
#c_name <<- "FAYETTE"
#c_name <<- "FLOYD"
#c_name <<- "FRANKLIN"
#c_name <<- "FREMONT"
#c_name <<- "GREENE"
#c_name <<- "GRUNDY"
#c_name <<- "GUTHRIE"
#c_name <<- "HAMILTON"
#c_name <<- "HANCOCK"
#c_name <<- "HARDIN"
#c_name <<- "HARRISON"
#c_name <<- "HENRY"
#c_name <<- "HOWARD"
#c_name <<- "HUMBOLDT"
#c_name <<- "IDA"
#c_name <<- "IOWA"
#c_name <<- "JACKSON"
#c_name <<- "JASPER"
#c_name <<- "JEFFERSON"
#c_name <<- "JOHNSON"
#c_name <<- "JONES"
#c_name <<- "KEOKUK"
#c_name <<- "KOSSUTH"
#c_name <<- "LEE"
#c_name <<- "LINN"
#c_name <<- "LOUISA"
#c_name <<- "LUCAS"
#c_name <<- "LYON"
#c_name <<- "MADISON"
#c_name <<- "MAHASKA"
#c_name <<- "MARION"
#c_name <<- "MARSHALL"
#c_name <<- "MILLS"
#c_name <<- "MITCHELL"
#c_name <<- "MONONA"
#c_name <<- "MONROE"
#c_name <<- "MONTGOMERY"
#c_name <<- "MUSCATINE"
#c_name <<- "O BRIEN"
#c_name <<- "OSCEOLA"
#c_name <<- "PAGE"
#c_name <<- "PALO ALTO"
#c_name <<- "PLYMOUTH"
#c_name <<- "POCAHONTAS"
#c_name <<- "POLK"
#c_name <<- "POTTAWATTAMIE"
#c_name <<- "POWESHIEK"
#c_name <<- "RINGGOLD"
#c_name <<- "SAC"
#c_name <<- "SCOTT"
#c_name <<- "SHELBY"
#c_name <<- "SIOUX"
#c_name <<- "STORY"
#c_name <<- "TAMA"
#c_name <<- "TAYLOR"
#c_name <<- "UNION"
#c_name <<- "VAN BUREN"
#c_name <<- "WAPELLO"
#c_name <<- "WARREN"
#c_name <<- "WASHINGTON"
#c_name <<- "WAYNE"
#c_name <<- "WEBSTER"
#c_name <<- "WINNEBAGO"
#c_name <<- "WINNESHIEK"
#c_name <<- "WOODBURY"
#c_name <<- "WORTH"
#c_name <<- "WRIGHT"



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
  df1$all_cattle_rank <- ""
  df1$beef_cows_rank <- ""
  df1$milk_cows_rank <- ""
  df1$corn_prod_rank <- ""
  df1$soy_prod_rank <- ""
  print(df1)
} else {
  print(paste("Error:", status_code(response))) # Print error if request fails
  df1 <- tibble(
    asd_desc = character(),
    prodn_practice_desc = character(),
    congr_district_code = character(),
    county_code = character(),
    freq_desc = character(),
    year = character(),
    state_fips_code = character(),
    agg_level_desc = character(),
    sector_desc = character(),
    util_practice_desc = character(),
    reference_period_desc = character(),
    domaincat_desc = character(),
    short_desc = character(),
    watershed_code = character(),
    source_desc = character(),
    end_code = character(),
    state_name = character(),
    commodity_desc = character(),
    location_desc = character(),
    zip_5 = character(),
    county_ansi = character(),
    country_code = character(),
    region_desc = character(),
    state_ansi = character(),
    Value = character(),
    watershed_desc = character(),
    class_desc = character(),
    county_name = character(),
    'CV (%)' = character(),
    country_name = character(),
    load_time = character(),
    state_alpha = character(),
    statisticcat_desc = character(),
    asd_code = character(),
    begin_code = character(),
    unit_desc = character(),
    week_ending = character(),
    domain_desc = character(),
    group_desc = character(),
    all_cattle_rank = character(),
    beef_cows_rank = character(),
    milk_cows_rank = character(),
    corn_prod_rank = character(),
    soy_prod_rank = character()
    
  )
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
  df2 <- tibble(
    asd_desc = character(),
    prodn_practice_desc = character(),
    congr_district_code = character(),
    county_code = character(),
    freq_desc = character(),
    year = character(),
    state_fips_code = character(),
    agg_level_desc = character(),
    sector_desc = character(),
    util_practice_desc = character(),
    reference_period_desc = character(),
    domaincat_desc = character(),
    short_desc = character(),
    watershed_code = character(),
    source_desc = character(),
    end_code = character(),
    state_name = character(),
    commodity_desc = character(),
    location_desc = character(),
    zip_5 = character(),
    county_ansi = character(),
    country_code = character(),
    region_desc = character(),
    state_ansi = character(),
    Value = character(),
    watershed_desc = character(),
    class_desc = character(),
    county_name = character(),
    'CV (%)' = character(),
    country_name = character(),
    load_time = character(),
    state_alpha = character(),
    statisticcat_desc = character(),
    asd_code = character(),
    begin_code = character(),
    unit_desc = character(),
    week_ending = character(),
    domain_desc = character(),
    group_desc = character(),
    all_cattle_rank = character(),
    beef_cows_rank = character(),
    milk_cows_rank = character(),
    corn_prod_rank = character(),
    soy_prod_rank = character()
    
  )
}
df2$all_cattle_rank <- ""
df2$beef_cows_rank <- ""
df2$milk_cows_rank <- ""
df2$corn_prod_rank <- ""
df2$soy_prod_rank <- ""

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
  df3 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}
df3$all_cattle_rank <- ""
df3$beef_cows_rank <- ""
df3$milk_cows_rank <- ""
df3$corn_prod_rank <- ""
df3$soy_prod_rank <- ""

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
  df4 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}

df4$all_cattle_rank <- ""
df4$beef_cows_rank <- ""
df4$milk_cows_rank <- ""
df4$corn_prod_rank <- ""
df4$soy_prod_rank <- ""

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
  df5 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}
df5$all_cattle_rank <- ""
df5$beef_cows_rank <- ""
df5$milk_cows_rank <- ""
df5$corn_prod_rank <- ""
df5$soy_prod_rank <- ""

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
  df6 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}

df6$all_cattle_rank <- ""
df6$beef_cows_rank <- ""
df6$milk_cows_rank <- ""
df6$corn_prod_rank <- ""
df6$soy_prod_rank <- ""


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
  df7 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}

df7$all_cattle_rank <- ""
df7$beef_cows_rank <- ""
df7$milk_cows_rank <- ""
df7$corn_prod_rank <- ""
df7$soy_prod_rank <- ""

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
  df8 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}
df8$all_cattle_rank <- ""
df8$beef_cows_rank <- ""
df8$milk_cows_rank <- ""
df8$corn_prod_rank <- ""
df8$soy_prod_rank <- ""

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
  df9 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}
df9$all_cattle_rank <- ""
df9$beef_cows_rank <- ""
df9$milk_cows_rank <- ""
df9$corn_prod_rank <- ""
df9$soy_prod_rank <- ""


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
  df10 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}

df10$all_cattle_rank <- ""
df10$beef_cows_rank <- ""
df10$milk_cows_rank <- ""
df10$corn_prod_rank <- ""
df10$soy_prod_rank <- ""

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
  df11 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}
df11$all_cattle_rank <- ""
df11$beef_cows_rank <- ""
df11$milk_cows_rank <- ""
df11$corn_prod_rank <- ""
df11$soy_prod_rank <- ""

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
  df12 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}
df12$all_cattle_rank <- ""
df12$beef_cows_rank <- ""
df12$milk_cows_rank <- ""
df12$corn_prod_rank <- ""
df12$soy_prod_rank <- ""
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
  df13 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}
df13$all_cattle_rank <- ""
df13$beef_cows_rank <- ""
df13$milk_cows_rank <- ""
df13$corn_prod_rank <- ""
df13$soy_prod_rank <- ""


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
  df14 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}

df14$all_cattle_rank <- ""
df14$beef_cows_rank <- ""
df14$milk_cows_rank <- ""
df14$corn_prod_rank <- ""
df14$soy_prod_rank <- ""

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
  df15 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}

df15$all_cattle_rank <- ""
df15$beef_cows_rank <- ""
df15$milk_cows_rank <- ""
df15$corn_prod_rank <- ""
df15$soy_prod_rank <- ""


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
  df16 <- tibble(
    asd_desc = character(),
    prodn_practice_desc = character(),
    congr_district_code = character(),
    county_code = character(),
    freq_desc = character(),
    year = character(),
    state_fips_code = character(),
    agg_level_desc = character(),
    sector_desc = character(),
    util_practice_desc = character(),
    reference_period_desc = character(),
    domaincat_desc = character(),
    short_desc = character(),
    watershed_code = character(),
    source_desc = character(),
    end_code = character(),
    state_name = character(),
    commodity_desc = character(),
    location_desc = character(),
    zip_5 = character(),
    county_ansi = character(),
    country_code = character(),
    region_desc = character(),
    state_ansi = character(),
    Value = character(),
    watershed_desc = character(),
    class_desc = character(),
    county_name = character(),
    'CV (%)' = character(),
    country_name = character(),
    load_time = character(),
    state_alpha = character(),
    statisticcat_desc = character(),
    asd_code = character(),
    begin_code = character(),
    unit_desc = character(),
    week_ending = character(),
    domain_desc = character(),
    group_desc = character(),
    all_cattle_rank = character(),
    beef_cows_rank = character(),
    milk_cows_rank = character(),
    corn_prod_rank = character(),
    soy_prod_rank = character()
    
  )
  
}
df16$all_cattle_rank <- ""
df16$beef_cows_rank <- ""
df16$milk_cows_rank <- ""
df16$corn_prod_rank <- ""
df16$soy_prod_rank <- ""



# Create an empty tibble with specified columns




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
  df17 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}
df17$all_cattle_rank <- ""
df17$beef_cows_rank <- ""
df17$milk_cows_rank <- ""
df17$corn_prod_rank <- ""
df17$soy_prod_rank <- ""

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
  df18 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}
df18$all_cattle_rank <- ""
df18$beef_cows_rank <- ""
df18$milk_cows_rank <- ""
df18$corn_prod_rank <- ""
df18$soy_prod_rank <- ""

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
  df19 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}
df19$all_cattle_rank <- ""
df19$beef_cows_rank <- ""
df19$milk_cows_rank <- ""
df19$corn_prod_rank <- ""
df19$soy_prod_rank <- ""

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
  df20 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}
df20$all_cattle_rank <- ""
df20$beef_cows_rank <- ""
df20$milk_cows_rank <- ""
df20$corn_prod_rank <- ""
df20$soy_prod_rank <- ""

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
  df21 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}
df21$all_cattle_rank <- ""
df21$beef_cows_rank <- ""
df21$milk_cows_rank <- ""
df21$corn_prod_rank <- ""
df21$soy_prod_rank <- ""

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
  df22 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}
df22$all_cattle_rank <- ""
df22$beef_cows_rank <- ""
df22$milk_cows_rank <- ""
df22$corn_prod_rank <- ""
df22$soy_prod_rank <- ""

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
  df23 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}
df23$all_cattle_rank <- ""
df23$beef_cows_rank <- ""
df23$milk_cows_rank <- ""
df23$corn_prod_rank <- ""
df23$soy_prod_rank <- ""

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
  df24 <- tibble(     asd_desc = character(),     prodn_practice_desc = character(),     congr_district_code = character(),     county_code = character(),     freq_desc = character(),     year = character(),     state_fips_code = character(),     agg_level_desc = character(),     sector_desc = character(),     util_practice_desc = character(),     reference_period_desc = character(),     domaincat_desc = character(),     short_desc = character(),     watershed_code = character(),     source_desc = character(),     end_code = character(),     state_name = character(),     commodity_desc = character(),     location_desc = character(),     zip_5 = character(),     county_ansi = character(),     country_code = character(),     region_desc = character(),     state_ansi = character(),     Value = character(),     watershed_desc = character(),     class_desc = character(),     county_name = character(),     'CV (%)' = character(),     country_name = character(),     load_time = character(),     state_alpha = character(),     statisticcat_desc = character(),     asd_code = character(),     begin_code = character(),     unit_desc = character(),     week_ending = character(),     domain_desc = character(),     group_desc = character(),     all_cattle_rank = character(),     beef_cows_rank = character(),     milk_cows_rank = character(),     corn_prod_rank = character(),     soy_prod_rank = character()        )
}

df24$all_cattle_rank <- ""
df24$beef_cows_rank <- ""
df24$milk_cows_rank <- ""
df24$corn_prod_rank <- ""
df24$soy_prod_rank <- ""


#bring in ranks

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

# Combine the dataframes by stacking them on top of each other


df14 <- subset(df14, select = -all_cattle_rank)
df15 <- subset(df15, select = -beef_cows_rank)
df16 <- subset(df16, select = -milk_cows_rank)
df20 <- subset(df20, select = -corn_prod_rank)
df24 <- subset(df24, select = -soy_prod_rank)

df14_ranked <- merge(df14, df_clean_rank[, c("year", "source_desc", "state_name", "county_name", "short_desc", "all_cattle_rank")], by = c("year", "source_desc", "state_name", "county_name", "short_desc"), all.x = TRUE)
df15_ranked <- merge(df15, df15_clean_rank[, c("year", "source_desc", "state_name", "county_name", "short_desc", "beef_cows_rank")], by = c("year", "source_desc", "state_name", "county_name", "short_desc"), all.x = TRUE)
df16_ranked <- merge(df16, df16_clean_rank[, c("year", "source_desc", "state_name", "county_name", "short_desc", "milk_cows_rank")], by = c("year", "source_desc", "state_name", "county_name", "short_desc"), all.x = TRUE)
df20_ranked <- merge(df20, df20_clean_rank[, c("year", "source_desc", "state_name", "county_name", "short_desc", "corn_prod_rank")], by = c("year", "source_desc", "state_name", "county_name", "short_desc"), all.x = TRUE)
df24_ranked <- merge(df24, df24_clean_rank[, c("year", "source_desc", "state_name", "county_name", "short_desc", "soy_prod_rank")], by = c("year", "source_desc", "state_name", "county_name", "short_desc"), all.x = TRUE)


combined_df <- rbind(df1, df2, df3, df4, df5, df6, df7, df8, df9, df10, df11, df12, df13, df14_ranked, df15_ranked, df16_ranked, df17, df18, df19, df20_ranked, df21, df22, df23, df24_ranked)
selected_columns <- combined_df[, c("year", "source_desc", "state_name", "county_name", "short_desc", "Value", "all_cattle_rank", "beef_cows_rank", "milk_cows_rank", "corn_prod_rank", "soy_prod_rank")]

assign(c_name, selected_columns)
write.csv(selected_columns, file = paste0("J:/",c_name,".csv"), row.names = FALSE)

