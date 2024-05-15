

library(shiny)
library(ggplot2)
library(dplyr)
library(leaflet)

s <- storms |>
  mutate(date = as.POSIXct(sprintf("%s-%s-%s %s:00", year, month, day, hour))) #creating a date column that is casted as dttm data type

ui <- fluidPage(
  titlePanel("Reactivity"),
  sidebarLayout(
    sidebarPanel(
      selectInput("storm_choice",
                  "Choose a storm",
                  choices=sort(unique(s$name)),
                  selected="Hugo") #setting the default value when the app is loaded
    ),
    mainPanel(
      plotOutput("wind_plot"),
      leafletOutput("storm_track")
    )
  )
)


server <- function(input, output) {
  
  #the reactive expression
  stormdata <- reactive({
    s |> 
      filter(name == input$storm_choice) |>
      arrange(date)
  })
  
  output$wind_plot <- renderPlot({
    ggplot(stormdata(), aes(x=date)) + #call the reactive expression like a function where you want it to change
      geom_line(aes(y=wind)) #+
      #geom_line(aes(y=pressure), linetype="dashed") 
  })
  
  output$storm_track <- renderLeaflet({
    leaflet(data=stormdata()) |>
      addTiles() |>
      addCircleMarkers(~long, ~lat)
  })
  
}

shinyApp(ui, server)

## Exercises 
## 1. Plot all of the storms for one year

