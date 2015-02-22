library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Website of the Year"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    sliderInput("obs", 
                "Number of observations:", 
                min = 1,
                max = 1000, 
                value = 500)
  ),

  # Show a plot of the generated distribution
  mainPanel(
    p("This will take an input from the user and will create random numbers and then plot them on a histogram and a scatterplot.  You will see that the population is normal distribution!"),
    plotOutput("distPlot")
  )
))