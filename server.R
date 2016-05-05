library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  

  output$boxPlot <- renderPlot({
    
    # set up the plot
    pl <- ggplot(data = data.pheno.mds),
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 
                 aes_string(x= input$population,
                            y= input$trait,
                            fill= input$population
                 )
    )
    
    if (input$graph == "violin"){
      pl + geom_violin()
    }
    else{
      pl + geom_boxplot()
    }
  })
})

