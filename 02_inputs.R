

library(shiny)

ui <- fluidPage(
  titlePanel("Shiny Inputs"),
  sidebarLayout(
    sidebarPanel(selectInput(inputId = "choice",
                             label = "Choose a number",
                             choices = c(1,2,3))),
    mainPanel(textOutput("number"))
  )
)


server <- function(input, output) {
  output$number <- renderText({
    input$choice
  })
}


shinyApp(ui = ui, server = server)
