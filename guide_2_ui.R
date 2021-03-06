library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Sliders"),
  
  sidebarPanel(
    sliderInput("integer", "Integer:", min=0, max=1, value=0.5, step=0.1),
    
    sliderInput("decimal", "Decimal:", min = 0, max = 1, value = 0.5, step= 0.1),
    
    sliderInput("range", "Range:", min=1, max=1000, value=c(200, 500)),
    
    sliderInput("format", "Custom Format:", min=0, max=10000, value=0, step=2500, pre="$", post="0", sep=",", animate=TRUE),
    
    sliderInput("animation", "Looping Animation: ", 1, 2000, 1, step=10, animate=animationOptions(interval=300, loop=T))
  ),
  
  mainPanel(
    tableOutput("values")
  )
))
