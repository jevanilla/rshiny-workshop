# Lesson 0.2 - Outputs
# Objectives:
# 1. Learn how to add many types of outputs to your Shiny app

suppressPackageStartupMessages({
  library(shiny)
  library(dplyr)
  library(ggplot2)

  library(DT) # for rendering data tables and outputting them
})

# Adding an environment variable that anything in the app can see
s <- storms 

ui <- fluidPage(
  textOutput("text"), 
  verbatimTextOutput("print"), 
  verbatimTextOutput("summary"), 
  tableOutput("table"),
  DTOutput("dtable"),
  plotOutput("plot1"),
  plotOutput("plot2"),
  imageOutput("image")
)

server <- function(input, output) {
  
  output$text <- renderText("Text") # similar to cat()
  
  output$print <- renderPrint("Text 2") # similar to print()
  
  output$summary <- renderPrint(summary(s)) 
  
  output$table <- renderTable(head(s)) #for static tables
  
  output$dtable <- DT::renderDT(s) # for dynamic tables
  
  output$plot1 <- renderPlot(plot(s$lat, s$wind))
  
  output$plot2 <- renderPlot({
    ggplot(s, aes(x=lat, y=wind, alpha=0.3)) +
      geom_point()
  })
  
  output$image <- renderImage({
    list(src = "www/coa-sealjpg.jpg", # /www must live in the same level as your app.R (or ui.R and server.R) file
         contentType = 'image/jpg',
         width = 150,
         height = 150,
         alt = "This is image alternate text")},
    deleteFile=FALSE) # if TRUE the image will be deleted when the app is run
}

shinyApp(ui = ui, server = server)


# Exercises
# 1. Adjust the height and width of the base R plot to make it a square instead of rectangular
# 2. Move the COA logo image to the top of the app
