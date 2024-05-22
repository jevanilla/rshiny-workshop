# Challenge 2
#
# Design a shiny app that:
# - Lets the user select a numeric column in the storms table
# - Makes a histogram of the column data using ggplot()
# - Allows the user to choose bin width
# - Print summary statistics about the column (ie min, max, etc.)
# 
# Extra Credit : Let the user filter the data by storm status before computing summary statistics 


library(shiny)
library(ggplot2)

s <- storms
choices <- c("year", "month", "lat", "wind", "pressure")

ui <- fluidPage()

server <- function(input, output, session) {}

shinyApp(ui, server)

# Check your work
