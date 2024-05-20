# Lesson 3 - Outputs
# Objectives:
# 1. Learn how to add many types of outputs to your Shiny app

suppressPackageStartupMessages({
  library(shiny)
  library(dplyr)
  library(ggplot2)
  library(plotly)
  
  library(DT) # for rendering data tables and outputting them
})


# Adding a global variable that anything in the app can see
s <- storms 

ss <- s |>
  group_by(name) |>
  summarise(wind = max(wind),
            pressure = min(pressure),
            lat = mean(lat))

ui <- fluidPage(
  titlePanel("3 - Outputs"),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      textOutput("text"),
      verbatimTextOutput("print"),
      verbatimTextOutput("summary"),
      tableOutput("table"),
      DTOutput("dtable"),
      plotOutput("plot1"),
      plotOutput("plot2"),
      plotlyOutput("plot3"),
      imageOutput("image")
    )
  )
)


server <- function(input, output) {
  
  output$text <- renderText("Text")
  
  output$print <- renderPrint("Text 2")
  
  output$summary <- renderPrint(summary(s))
  
  output$table <- renderTable(head(s))
  
  output$dtable <- DT::renderDT(s)
  
  output$plot1 <- renderPlot(plot(s$lat, s$wind))
  
  output$plot2 <- renderPlot({
    ggplot(s, aes(x=lat, y=wind, alpha=0.3)) +
      geom_point()
  })
  
  output$plot3 <- renderPlotly({
    plot_ly(data=s, 
            x=~lat, 
            y=~wind, 
            type="scatter",
            mode="markers",
            text=~paste("Name:", name, "<br>", 
                        "Year:", year, "<br>", 
                        "Month:", month, "<br>", 
                        "Hour:", hour, "<br>", 
                        "Status:", status)) 
  })
  
  output$image <- renderImage({
    list(src = "www/coa-sealjpg.jpg",
         contentType = 'image/jpg',
         width = 150,
         height = 150,
         alt = "This is image alternate text")},
    deleteFile=FALSE)
}

shinyApp(ui = ui, server = server)


# Exercises
# 1. Adjust the height and width of the base R plot
# 2. Move the COA logo image to the top of the main panel
