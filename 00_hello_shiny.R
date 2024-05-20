# Lesson 0 - Hello Shiny
# Objectives
# 1. Launch your first shiny app with just the basics


# always need to load shiny and any other dependencies
library(shiny)

# will contain the layout of your app
ui <- fluidPage()

# will contain any actions to carry out inside your app
# will run nonstop in the background
server <- function(input,output) {}

# pulls it all together
shinyApp(ui = ui, server = server)

# Exercises
# 1. Run the application
# 2. Modify the text that's displayed