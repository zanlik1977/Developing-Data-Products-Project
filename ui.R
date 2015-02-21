library(shiny)

# Define UI for application that draws a 3D plot
shinyUI(fluidPage(
  
  # Application title
  titlePanel(h5("Show Local Galaxies this many")),
  
  # Sidebars with a slider input 
  sidebarLayout(
    sidebarPanel(
      sliderInput("mass_ratio",
                  "times smaller than our own:",
                  min = 1,
                  max = 500,
                  step = 50,
                  value = 100),
    
      sliderInput("zoom",
                  "Zoom in:",
                  min = 1,
                  max = 10,
                  step = 1,
                  value = 5),
      
      sliderInput("rotate",
                  "Rotate:",
                  min = -80,
                  max = 80,
                  step = 5,
                  value = 45)
      ),
    
    # Show a plot of the generated distribution
    mainPanel(
 #     tabsetPanel(type = "tabs", 
  #        tabPanel("Our Cosmic Neighborhood",
  #                 plotOutput("DPlot")),
  #        tabPanel("Documentation", 
  #                 includeHTML("html/include.html"))

      plotOutput("DPlot")
      
     
    )
  )
))