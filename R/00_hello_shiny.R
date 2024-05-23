# Lesson 0.0 - Hello Shiny
# Objectives
# 1. Launch your first shiny app with just the basics


# always need to load shiny and any other dependencies
library(shiny)

# will contain the layout of your app
ui <- fluidPage()

# will contain any actions to carry out inside your app
# will run nonstop in the background
server <- function(input, output) {}

# pulls it all together
shinyApp(ui = ui, server = server)

# Exercises
# 1. Run the app by clicking "Run App" in the upper right corner of the source pane
# 2. Run the application line by line
# 3. Print the ui and server objects in the console. What do you notice that's different between the two?
# 4. Try changing the app to run in the viewer instead of a new window
