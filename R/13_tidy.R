# Using Tidy Evaluation with Shiny
# Objectives
# 1. operating on data frames using the dplyr verbs
# 2. making dynamic graphics using ggplot2

suppressPackageStartupMessages({
  library(shiny)
  library(dplyr)
  library(ggplot2)
})

s <- storms
ch <- c("year", "month", "lat", "lon", "wind", "pressure")

ui <- fluidPage(
  titlePanel("Tidy"),
  sidebarLayout(
    sidebarPanel(
      selectInput("x_var", "X Variable", choices=ch, selected="wind"),
      selectInput("y_var", "Y Variable", choices=ch, selected="lat")
    ),
    mainPanel(
      plotOutput("scatter")
    )
  )
)

server <- function(input, output, session) {
  output$scatter <- renderPlot({
    ggplot(s, aes(x=.data$input$x_var]], y=.data[[input$y_var]])) +
      geom_point()
  })
}

shinyApp(ui, server)