library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Miles Per Gallon"),
  
  sidebarPanel(
    # input$variable is selectInput type
    selectInput("variable", "Variable:", list("Cylinders" = "cyl", "Transmission" = "am", "Gears" = "gear")),
    
    # input$outliers is checkboxInput type
    checkboxInput("outliers", "Show outliers", FALSE)
    
  ),
  
  mainPanel(
    h3(textOutput("caption")),
    # output$mpgPlot should be a plot type
    plotOutput("mpgPlot"),
    dataTableOutput('mytable')
  )
  
))
