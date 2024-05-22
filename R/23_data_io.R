# Lesson 2.3 - Data IO
# Objectives
# 1. Learn how to let users upload or download data to your app


library(shiny)
library(dplyr)

s <- head(storms)

ui <- fluidPage(
  fileInput("upload", "Upload file here"),
  downloadButton("download", "Download file")
)

server = function(input, output, session) {
  
  output$download <- downloadHandler(
    filename = function() {"example_download.csv"}, 
    content = function(file) {write.csv(s, file)}
  )
}

shinyApp(ui, server)