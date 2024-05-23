# Lesson 1.2 - Dynamic User Interfaces
# Objectives
# 1. Use `observeEvent()` to dynamically change the input selections in the user interface


library(shiny)
library(ggplot2)
library(dplyr)
library(leaflet)

s <- storms |>
  mutate(date = as.POSIXct(sprintf("%s-%s-%s %s:00", year, month, day, hour))) 

ui <- fluidPage(
  leafletOutput("storm_tracks"),
  selectInput("year", 
              "Choose a year", 
              choices=sort(unique(s$year))),
  selectInput("name",
              "Choose a storm",
              NULL),
  selectInput("status",
              "Select a status",
              NULL)
  
)

server <- function(input, output, session) {
  
  storms <- reactive({
    s |>
      filter(year == input$year)
  })
  
  observeEvent(storms(), {
    choices <- unique(storms()$name)
    updateSelectInput(session = session, "name", choices = choices)
  })
  
  storm <- reactive({
    filter(storms(), name == input$name)
  })
  
  observeEvent(storm(), {
    choices <- unique(storm()$status)
    updateSelectInput(session=session, "status", choices=choices)
  })
  
  storm_status <- reactive({
    filter(storm(), status == input$status)
  })
  

  output$storm_tracks <- renderLeaflet({
    leaflet(data=storm_status()) |> 
      addTiles() |>
      addCircleMarkers(~long, ~lat, popup=~htmltools::htmlEscape(status))
  })
  
}

shinyApp(ui, server)


# Exercises 
# 1. Add another selection to see the different storm categories that the storm exhibited
