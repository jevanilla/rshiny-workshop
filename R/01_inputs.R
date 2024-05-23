# Lesson 0.1 - Inputs
# Objectives:
# 1. Learn how to add many types of inputs to your Shiny app

library(shiny)

ui <- fluidPage(
  selectInput(inputId = "choice",
              label = "Choose a number",
              choices = c(1,2,3)),
  textInput("text", "Text Input", placeholder="write something here"),
  passwordInput("password", "Password Input"),
  textAreaInput("textarea", "Text Area:"),
  numericInput("numeric", "Numeric Input", value=10, step=10),
  sliderInput("slider", "Slider Input", value=c(2,3), min=0, max=5),
  dateInput("date", "Choose a date"),
  dateRangeInput("date_range", "Choose a date range"),
  checkboxInput("checkbox", "Check me", value=TRUE),
  fileInput("file_upload", "Upload a file"),
  actionButton("action", "Action Button")
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)


# Exercises

# 1. Give the user a hint inside the text input box that says "write something here"
# 2. Change the slider input to let the user select a range of values rather than a single one
# 3. Update the numeric input to increase by increments of 10 using the arrows in the box
