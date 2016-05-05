library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  

  output$Plot <- renderPlot({

   
    pl <- ggplot(data = data.pheno.mds,
                 #Use aes_string so variables are interpreted correctly
                 
                 aes_string(x= input$split, #allows for user to pick popID or region
                            y= input$traits, #allows user to specify trait of interest
                            fill= input$split #colors plots based on pop or region
                 )
    )
    
    if (input$plot == "Violin Plot"){ #determines plot type based on user input with 
      pl + geom_violin()          #boxplot as default
    }
    else{
      pl + geom_boxplot()
    }
  })
})

