
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Rice Data"),
  
  #Some helpful information
  helpText("This application creates a plot of your choice for selected rice phenotypes",
           "based on ancestral population or region. Please use the radio box below to",
           "choose a) your type of plot, b) your phenotypes to display, and c) whether",
           "you want to plot by ancestral population or region."),  
  
  #Sidebar with a radio box to input which type of plot will be displayed
  sidebarLayout(
    sidebarPanel(
      radioButtons("plot",
                   "Choose your type of plot:",
                   c("Violin Plot",
                     "Boxplot")),

      radioButtons("traits",
                   "Choose the phenotypes you would like to plot:",
                   c("Protein.content",
                     "Amylose.content",
                     "Seed.volume",
                     "Seed.length",
                     "Plant.height",
                     "Seed.Width")),
      
      radioButtons("split",
                   "How do you want to split the data:",
                   c("popID",
                     "Region")
      )),
  
    # Show a plot of the generated distribution
    mainPanel(plotOutput("Plot")
    )
  )
))