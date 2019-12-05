library(shiny)
library(plotly)

# generate the dataset

mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

# generate fibonacci table
len <- 100
fib <- numeric(len)
fib[1] <- 1
fib[2] <- 1
for (i in 3:len) {
  fib[i] <- fib[i-1] + fib[i-2]
}

# Define server logic to plot various variables against mpg ----
server <- function(input, output) {
  
  # Compute the formula text ----
  # This is in a reactive expression since it is shared by the
  # output$caption and output$mpgPlot functions
  formulaText <- reactive({
    paste("test ~", input$variable)
  })
  
  
  # Return the formula text for printing as a caption ----
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against mpg ----
  # and only exclude outliers if requested
  
  output$disp <- renderPlot({
    plot(mpgData$mpg, mpgData$disp)
  })
  
  
  output$fibPlot <- renderPlotly({
    plot_ly(x = c(1:100), y=fib, type="scatter", autosize = T, height = 800)
  })
  
  output$polarPlot <- renderPlotly({
    plot_ly(
      type = 'scatterpolar',
      r = c(1:input$n),
      theta = c(1:input$n)*180/pi,
      mode = 'markers',
      autosize = T, height = 800,
      line = list(
        color = 'peru'
      )
    )
  })
  
  output$normalPlot <- renderPlotly({
    plot_ly(x = ~rnorm(input$n, input$mean, input$std), type = "histogram", autosize = T, height = 800) 
  })
}