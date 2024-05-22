# Setup file for the workshop: "Introduction to Developing Interactive Shiny Applications in R"

# Run the following two lines to make sure you have updated versions of all of the packages

packages <- c("shiny", "dplyr", "ggplot2", "DT", "leaflet", "bslib")

for (package in packages) {
  install.packages(package)
}
