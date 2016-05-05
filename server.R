library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  

  output$boxPlot <- renderPlot({

   
    pl <- ggplot(data = data.pheno.mds,
                 #Use aes_string so variables are interpreted correctly
                 
                 aes_string(x= input$population, #allows for user to pick popID or region
                            y= input$trait, #allows user to specify trait of interest
                            fill= input$population #colors plots based on pop or region
                 )
    )
    
    if (input$plot == "violin"){ #determines plot type based on user input with 
      pl + geom_violin()          #boxplot as default
    }
    else{
      pl + geom_boxplot()
    }
  })
})

