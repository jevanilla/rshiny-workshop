# Challenge 2
#
# Design a shiny app that:
# - Lets the user select a numeric column in the storms table
# - Makes a histogram of the column data using ggplot() geom_histogram()
# - Allows the user to choose bin width
# - Print summary statistics about the column (ie min, max, etc.)
# 
# Extra Credit : Let the user filter the data by storm status before computing summary statistics 


library(shiny)
library(ggplot2)
library(dplyr)

s <- storms
choices <- c("year", "month", "lat", "wind", "pressure")

ui <- fluidPage(
  selectInput("col", "Choose a column", choices=choices),
  selectInput("status", "Choose a status", choices=unique(s$status)),
  numericInput("bins", "Pick a bin width", value=1),
  verbatimTextOutput("col_summary"),
  plotOutput("hist")
)

server <- function(input, output, session) {
  
  stormdata <- reactive({
    filter(s, status == input$status)
  })
  
  output$hist <- renderPlot({
    ggplot(stormdata(), aes(.data[[input$col]])) +
      geom_histogram(binwidth = input$bins)
  })
  
  output$col_summary <- renderPrint({
    summary(stormdata()[[input$col]])
  })
}

shinyApp(ui, server)

# Check your work
