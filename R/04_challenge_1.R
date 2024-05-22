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

s <- storms

ui <- fluidPage(
  # Select variable for x-axis

  # Select variable for y-axis

  # Show the user the plot
  
)

server <- function(input, output) {
  
  # Define the plot in the server
  
}

shinyApp(ui, server)