library(shiny)

shinyUI(fluidPage(
  headerPanel("More Widgets"),
  
  sidebarPanel(
    selectInput("dataset", "Choose a dataset:", choices=c("rock", "pressure", "cars")),
    numericInput("obs", "Number of observations to view:", 10),
    helpText("Note: while the data view will show only the specified", "number of observations, the summary will still be based", "on the full dataset."),
    
    submitButton("Update View")
  ),
  
  mainPanel(
    h4("Summary"),
    verbatimTextOutput("summary"),
    
    h4("Observations"),
    tableOutput("view")
  )
))
