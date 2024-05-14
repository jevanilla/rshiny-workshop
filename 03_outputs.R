# Objectives:
# 1. Learn how to add plot and image outputs to your Shiny app

library(shiny)
library(dplyr)

library(ggplot2)
library(plotly)

# Adding a global variable that anything in the app can see

s <- storms 

ss <- s |>
  group_by(name) |>
  summarise(wind = max(wind),
            pressure = min(pressure),
            lat = mean(lat))

ui <- fluidPage(
  titlePanel("Outputs"),
  sidebarLayout(
    sidebarPanel(
      imageOutput("image")
    ),
    mainPanel(
      plotOutput("plot1"),
      plotOutput("plot2"),
      plotlyOutput("plot3"),
      tableOutput("table"),
      dataTableOutput("dtable")
    )
  )
)


server <- function(input, output) {
  
  output$plot1 <- renderPlot({
    plot(s$lat, s$wind)
  })
  
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
            text=~paste("Name:", name, "<br>", "Year:", year, "<br>", "Month:", month, "<br>", "Hour:", hour, "<br>", "Status:", status)) 
  })
  
  output$table <- renderTable({
    head(s)
  })
  
  output$dtable <- renderDataTable({
    s
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


# Excercises
# 1. Add another plot
# Move the COA logo image to the top of the main panel
