library(shiny)
library(plotly)

# Define UI for miles per gallon app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("RShiny webapp tools"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      h3(textOutput("test")),
      
      sliderInput("n", "n", value = 200, min = 1, max = 1000),
      sliderInput("mean", "Mean", value = 0, min = 0, max = 100),
      sliderInput("std", "Standard Deviation", value = 1, min = 0, max = 100),
  
      
      # Input: Selector for variable to plot against mpg ----
      selectInput("variable", "Variable:",
                  c("test1" = "test1",
                    "test2" = "test2"))
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Formatted text for caption ----
      h3(textOutput("caption")),
      
      tabsetPanel(type = "tabs",
                  tabPanel("normalPlot", plotlyOutput("normalPlot")),
                  tabPanel("FibPlot", plotlyOutput("fibPlot")),
                  tabPanel("polarPlot", plotlyOutput("polarPlot")),
                  tabPanel("Plotdisp", plotOutput("disp"))
      )
    )
  )
)



