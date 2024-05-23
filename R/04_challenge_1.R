# Challenge 1
#
# Design a shiny app that:
# - makes a scatter plot using plot() and the storms dataset 
# - allows the user to choose the variables for the x and y axis
# - only lets the user select the variables: "year", "month", "lat", "wind", "pressure"
# - makes the default values x = "wind" and y = "lat"
#
# Extra credit - Update the display names in the input selections to ("Year", "Month", "Latitude", "Wind", "Pressure")


library(shiny)
library(dplyr)

s <- storms

ui <- fluidPage(
  # Select variable for x-axis
  selectInput("x_var", "X Variable", choices=c("Year" = "year", "Month" = "month", "Latitude" = "lat", "Wind" = "wind", "Pressure" = "pressure"), selected="wind"),

  # Select variable for y-axis
  selectInput("y_var", "Y Variable", choices=c("Year" = "year", "Month" = "month", "Latitude" = "lat", "Wind" = "wind", "Pressure" = "pressure"), selected="lat"),
  
  # Show the user the plot
  plotOutput("plot")
)

server <- function(input, output) {
  
  # Define the plot in the server
  output$plot <- renderPlot({
    plot(x=s[[input$x_var]], y=s[[input$y_var]])
  })
}

shinyApp(ui, server)