# Lesson 2 - Inputs
# Objectives:
# 1. Learn how to add many types of inputs to your Shiny app

library(shiny)

ui <- fluidPage(
  titlePanel("Shiny Inputs"),
  sidebarLayout(
    sidebarPanel(selectInput(inputId = "choice",
                             label = "Choose a number",
                             choices = c(1,2,3)),
                 textInput("text", "Text Input"),
                 passwordInput("password", "Password Input"),
                 textAreaInput("textarea", "Text Area:"),
                 numericInput("numeric", "Numeric Input", value=1),
                 sliderInput("slider", "Slider Input", value=c(1,2), min=0, max=5),
                 dateInput("date", "Choose a date"),
                 dateRangeInput("date_range", "Choose a date range"),
                 checkboxInput("checkbox", "Check me", value=TRUE),
                 fileInput("file_upload", "Upload a file"),
                 actionButton("action", "Action Button", class = "btn-danger")),
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
