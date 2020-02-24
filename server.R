#
#
# This is the server logic for the Glitters application. 
#

library(shiny)

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
                                                  clarity = clarityInput))
                ifelse(pred < 0, 0, pred)
            })
            
            
           #output$text1 <- renderText({ paste("hello input is","<font color=\"#FF0000\"><b>", input$n, "</b></font>") })
            
            
            
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
                predmod()
                
                
            })
    
    })
