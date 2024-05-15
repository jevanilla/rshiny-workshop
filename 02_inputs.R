

library(shiny)

ui <- fluidPage(
  titlePanel("Shiny Inputs"),
  sidebarLayout(
    sidebarPanel(selectInput(inputId = "choice",
                             label = "Choose a number",
                             choices = c(1,2,3)),
                 dateInput("date",
                           label = "Choose a date")),
    mainPanel(textOutput("number"),
              textOutput("date"))
  )
)


server <- function(input, output) {
  output$number <- renderText({
    input$choice
  })
  
  output$date <- renderText({
    paste("The date is:", format(as.Date(input$date), format="%Y-%m-%d"),sep=" ")
  })
}


shinyApp(ui = ui, server = server)



# Exercises

# 1. Add another input using one of the following: textInput(), checkboxInput() or radioButtons()
# 2. Format your output by building up a statement with paste()
