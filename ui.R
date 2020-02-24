#
# This is the user-interface definition for the Glitters application which predicts the price of a diamond 
# given some details about it.
#
#

library(shiny)

# Define UI for application that predicts diamond prices
shinyUI(fluidPage(

    # Application title
    titlePanel("Glitters Diamond Brokerage GlitterApp"),

    # Sidebar with a inputs
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderCarat", "How much carats?", min = 0.2, max = 5.01, value = 2.6),
            selectInput("selectCut", "Select cut of diamond:", c("Ideal", "Premium", "Very Good", "Good", "Fair")),
            selectInput("selectColour", "Select colour of diamond:", c("D", "E", "F", "G", "H", "I", "J")),
            selectInput("selectClarity", "Select Clarity of diamond:", c("IF", "VVS1", "VVS2", "VS1", "VS2",
                                                                        "SI1", "SI2", "I1")),
            submitButton("Submit")
        ),

        # Show inputs and predicted price
        mainPanel(
            
            br(),
            p("GlitterApp provides you with the minimum price for which the Glitters Diamond Brokerage company will
              purchase your diamonds. Simply follow the instructions provided below to get a price."),
            
            
            p("In the form on the left of this page, enter the following:"),
            p("CARAT: Use the slider to select the weight of your diamond. The minimum value accepted is 0.2 and the maximum is 5.01"),
            p("CUT: Select the cut of the diamond which can be Ideal, Premium, Very Good, Good or Fair"),        
            p("COLOUR: Select the colour of your diamond which can take values from D (best) to J (worst)"),
            p("CLARITY: Select one of the following:"), 
            p("Click Submit"),br(),
            
            strong("You have entered:"), br(),
            h4("CARATS: "), textOutput("carat"),
            h4("CUT: "), textOutput("cut"),
            h4("COLOUR: "), textOutput("colour"),
            h4("CLARITY: "), textOutput("clarity"),
            span(h3("Minimum Price we will pay: "), textOutput("predPrice"), style = "color:blue")
            
        )
    )
))
