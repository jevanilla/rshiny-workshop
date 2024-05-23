# Lesson 2.0 - Layouts
# Objectives
# 1. Learn how to define the layout of your app in the user interface

suppressPackageStartupMessages({
  library(shiny)
})

ui <- fluidPage(
  titlePanel("Hello shiny!"),
  sidebarLayout(
    sidebarPanel("sidebar"),
    mainPanel("main panel")
  )
)

# column widths can be between 1-12
ui2 <- fluidPage(
  titlePanel("Fluid Row Columns Layout!"),
  fluidRow(
    column(width = 3, "top column 1"),
    column(width = 6, "top column 2", offset=2)
  ),
  fluidRow(
    column(width=12, "bottom column")
  )
)

ui3 <- fluidPage(
  titlePanel("Navbar Page"),
  tabsetPanel(
    tabPanel("Layout 1",
             titlePanel("Sidebar"),
             sidebarLayout(
               sidebarPanel("sidebar"),
               mainPanel("main panel")
             )),
    tabPanel("Layout 2",
             titlePanel("Fluid Rows with Columns"),
             fluidRow(
               column(width = 3, "top column 1"),
               column(width = 6, "top column 2", offset=2)
             ),
             fluidRow(
               column(width=12, "bottom column")
             ))
  )
)

server <- function(input,output) {}

shinyApp(ui = ui3, server = server)

# Exercises:
# 1. Add a column to the fluidRow layout


