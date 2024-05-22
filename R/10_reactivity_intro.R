



library(shiny)

ui <- fluidPage(
  numericInput("a", "Number 1", value=1),
  numericInput("b", "Number 2", value=1),
  textOutput("sum")
)

server <- function(input, output) {
  output$sum <- renderText({
    input$a + input$b
  })
}

shinyApp(ui, server)