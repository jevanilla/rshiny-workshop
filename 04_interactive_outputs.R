# Objectives:
# 1. Learn how to add plot and image outputs to your Shiny app

library(shiny)
library(dplyr)
library(ggplot2)

s <- storms

ui <- fluidPage(
  titlePanel("Interactive Outputs"),
  sidebarLayout(
    sidebarPanel(
      imageOutput("image"),
      numericInput("breaks",
                  "Select a number of breaks",
                  1,100)
    ),
    mainPanel(
      plotOutput("histogram")
    )
  )
)


server <- function(input, output) {
  
  output$histogram <- renderPlot({
    hist(s$wind, breaks=input$)
  })
}

shinyApp(ui,server)

# Exercises
# 1. ?