#govchat prompt
#can an R shiny app be created that queries the USDA NASS quickstats database using API,
#where I have drop down options for source_desc, year, state_name, county_name, commodity_desc, short_desc, and domaincat_desc

# Required Libraries
library(shiny)
library(httr)
library(jsonlite)

# UI
ui <- fluidPage(
  titlePanel("USDA NASS Quick Stats API Query"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("api_key", "Enter API Key:", value = ""),
      selectInput("source_desc", "Select Source:", choices = NULL),
      selectInput("year", "Select Year:", choices = NULL),
      selectInput("state_name", "Select State:", choices = NULL),
      selectInput("county_name", "Select County:", choices = NULL),
      selectInput("commodity_desc", "Select Commodity:", choices = NULL),
      selectInput("short_desc", "Select Short Description:", choices = NULL),
      selectInput("domaincat_desc", "Select Domain Category:", choices = NULL),
      actionButton("query_button", "Query Data")
    ),
    
    mainPanel(
      tableOutput("results")
    )
  )
)

# Server
server <- function(input, output, session) {
  
  observe({
    # Load dropdown choices dynamically based on API fields
    if (input$api_key != "") {
      params <- c("source_desc", "year", "state_name", "county_name", "commodity_desc", "short_desc", "domaincat_desc")
      
      # Dynamically get available options for each parameter
      for (param in params) {
        url <- "https://quickstats.nass.usda.gov/api/get_param_values/"
        response <- GET(url, query = list(param = param, key = input$api_key))
        choices <- sort(fromJSON(content(response, as = "text"))[[param]])
        updateSelectInput(session, param, choices = c("", choices))
      }
    }
  })
  
  # Query data when button is clicked
  observeEvent(input$query_button, {
    
    req(input$api_key, input$source_desc, input$year, input$state_name, input$county_name, input$commodity_desc, input$short_desc, input$domaincat_desc)
    
    # Define the query parameters
    query_params <- list(
      source_desc = input$source_desc,
      year = input$year,
      state_name = input$state_name,
      county_name = input$county_name,
      commodity_desc = input$commodity_desc,
      short_desc = input$short_desc,
      domaincat_desc = input$domaincat_desc,
      format = "json",
      key = input$api_key
    )
    
    # Make the API request
    response <- GET("https://quickstats.nass.usda.gov/api/api_GET/", query = query_params)
    
    # Check if the request was successful
    if (http_status(response)$category == "Success") {
      # Parse the JSON content
      data <- content(response, "text")
      json_data <- fromJSON(data, flatten = TRUE)
      
      # Convert to dataframe
      df <- as.data.frame(json_data$data)
      
      # Show the dataframe on the main panel
      output$results <- renderTable({
        head(df) # Display the first few rows of the dataframe
      })
    } else {
      # Display error message
      output$results <- renderText({
        paste("Error:", http_status(response)$message)
      })
    }
  })
}

# Run the application 
shinyApp(ui = ui, server = server)