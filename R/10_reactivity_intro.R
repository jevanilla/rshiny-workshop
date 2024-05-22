# Lesson 1.0 - Reactivity Intro
# Objectives
# 1. Introduction to reactive expressions


library(shiny)
library(dplyr)

s <- storms

ui <- fluidPage(
  selectInput("year", "Choose a year", choices = unique(s$year)),
  textOutput("n_storms"),
  textOutput("max_wind")
)

server <- function(input, output) {
  
  output$n_storms <- renderText({
    y <- s |>
      filter(year == input$year)
    
    paste("In", input$year, "there were", length(unique(y$name)), "storms", sep=" ")
  })
  
}

shinyApp(ui, server)


# Exercises
# 1. Write another statement to tell the user the maximum wind speed recorded during that year.


