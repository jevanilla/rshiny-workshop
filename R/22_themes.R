# Lesson 2.2 - Themes
# Objectives
# 1. Learn how to change the theme of your app


library(shiny)
library(bslib)

ui <- fluidPage(
  theme = bs_theme(bootswatch = "quartz"),
  titlePanel("Navbar Page"),
  a(href="https://bootswatch.com/", "Check out the themes here"),
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

server = function(input, output, session) {}

shinyApp(ui, server)

# Exercises 
# Browse for themes and try a few out
# Check out the help page for bs_theme() for how to customize your own