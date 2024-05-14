
# always need to load shiny and any other dependencies

library(shiny)

# will contain the layout of your app
ui <- fluidPage(
  "Hello shiny!"
)

# will contain any actions to carry out inside your app
# will run nonstop in the background
server <- function(input,output) {}

# pulls it all together
shinyApp(ui = ui, server = server)

# Excercises
# 1. Run the application
# 2. Modify the text that's displayed