# Lesson 0.3 - Basic Reactivity
# Objectives:
# 1. Learn how to make inputs change outputs in a Shiny app


library(shiny)

ui <- fluidPage(
  textInput("name", "What's your name?"),
  textInput("favnum", "what's your favorite number"),
  textOutput("greeting")
)

server <- function(input, output, session) {
  output$greeting <- renderText({
    paste0("Hello ", input$name, "! ", "your favorite number is: ", input$favnum)
  })
}

shinyApp(ui, server)

# Exercise
# Ask the user for their favorite number then tell them what it is in the greeting "Your favorite number is: "