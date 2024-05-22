# Lesson 6 - Dynamic User Interfaces
# Objectives
# 1. Use `observeEvent()` to dynamically change the input selections in the user interface


library(shiny)
library(ggplot2)
library(dplyr)
library(leaflet)

s <- storms |>
  mutate(date = as.POSIXct(sprintf("%s-%s-%s %s:00", year, month, day, hour))) 

ui <- fluidPage(
  titlePanel("Reactivity"),
  sidebarLayout(
    sidebarPanel(
      selectInput("year", "Choose a year", choices=sort(unique(s$year))),
      selectInput("storm_choice",
                  "Choose a storm",
                  #choices=sort(unique(s$name)),
                  "storm_year_choices",
                  selected="Hugo"),
      textOutput("foo")
    ),
    mainPanel(
      leafletOutput("storm_tracks")
    )
  )
)


server <- function(input, output, session) {
  
  stormdata <- reactive({
    s |> 
      filter(name == input$storm_choice &
             year == input$year) |>
      arrange(date)
  })
  
  observeEvent(input$year,{
    
    x <- s |> 
      filter(year == input$year)
    
    updateSelectInput(session,
                      "storm_choice",
                      label="Choose a storm",
                      choices=unique(x$name))
  })
  
  
  
  output$foo <- renderText({
    t <- stormdata()
    
    paste(length(t))
  })

  output$storm_tracks <- renderLeaflet({
    leaflet(data=stormdata()) |> 
      addTiles() |>
      addCircleMarkers(~long, ~lat, popup=~htmltools::htmlEscape(status))
  })
  
}

shinyApp(ui, server)
