# Lesson 0.3 - Basic Reactivity
# Objectives:
# 1. Learn how to make inputs change outputs in a Shiny app


library(shiny)

ui <- fluidPage(
  textInput("name", "What's your name?"),
  textOutput("greeting")
)

server <- function(input, output, session) {
  output$greeting <- renderText({
    paste0("Hello ", input$name, "! ")
  })
}

shinyApp(ui, server)

# Exercise
# Ask the user for their favorite number then tell them what it is in the greeting