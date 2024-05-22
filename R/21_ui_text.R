# Lesson 2.1 - User Interface Text using HTML
# Objectives
# 1. Try out the built in HTML tag wrapper functions


library(shiny)


ui <- fluidPage(
  h1("Header 1"),
  hr(),
  br(),
  p(strong("bold")),
  br(),
  p(em("italic")),
  em("italic"),
  p("italic"),
  p(code("code")),
  a(href="", "link"),
  HTML("<p>Raw html</p>")
)

server = function(input, output, session) {}

shinyApp(ui, server)