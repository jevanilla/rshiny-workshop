

library(shiny)

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
             titlePanel("Fluid Row Columns"),
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

shinyApp(ui = ui, server = server)

