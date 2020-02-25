#
# This is the server logic for the Glitters application. 
#

library(shiny)
library(ggplot2)

# Define server logic required to predict diamond price
    shinyServer(function(input, output) {
    
            # Fit model
            mod = lm(price ~ carat + cut + color + clarity, data = diamonds)
            
            # Predict based on inputs
            predmod = reactive({
                caratInput = input$sliderCarat
                cutInput = input$selectCut
                colourInput = input$selectColour
                clarityInput = input$selectClarity
                pred = predict(mod, newdata = data.frame(carat = caratInput, cut = cutInput, color = colourInput,
                                                  clarity = clarityInput)) * 0.75
                ifelse(pred < 0, 0, pred)
            })
            
            output$carat = renderText({
                input$sliderCarat
            })
            
            output$cut = renderText({
                input$selectCut
            })
            
            output$colour = renderText({
                input$selectColour
            })
            
            output$clarity = renderText({
                input$selectClarity
            })
            
            
            output$predPrice = renderText({
                prettyNum(predmod(), big.mark=",")
            })   
    
    })
