#
# This is the user-interface definition for the Glitters application which predicts the price of a diamond 
# given some details about it.
#
#

library(shiny)

# Define UI for application that predicts diamond prices
shinyUI(fluidPage(

    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "appstyles.css")
    ),
    
    # Application title
    titlePanel("Glitters Diamond Brokerage - GlitterApp"),

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
          
            
            div("GlitterApp provides you with the minimum price for which the Glitters Diamond Brokerage company will
              purchase your diamonds. Simply follow the instructions provided below to get a price.", class="alert alert-info"),

            tags$ul(
                class="list-group",
                tagList(
                  tags$li("You have entered:", class="list-group-item active"),    
                  tags$li(
                      div(class="item",
                        div(
                            class="item-left",
                            h4("CARATS", class="item-head"),
                            p(class="item-note", "Use the slider to select the weight of your diamond. The minimum value accepted is 0.2 and the maximum is 5.01."),
                        ), 
                        div(
                            class="item-right",
                            div(class="item-value-head", "Your Selection:"),
                            textOutput("carat")
                        ), 
                      ),
                      class="list-group-item"),
                  tags$li(
                      div(class="item",
                          div(
                              class="item-left",
                              h4("CUT ", class="item-head"),
                              p(class="item-note", "Select the cut of the diamond which can be Ideal, Premium, Very Good, Good or Fair."),
                          ), 
                          div(
                              class="item-right",
                              div(class="item-value-head", "Your Selection:"),
                              textOutput("cut")
                          ), 
                      ),
                      class="list-group-item"),
                  tags$li(
                      div(class="item",
                          div(
                              class="item-left",
                              h4("COLOUR", class="item-head"),
                              p(class="item-note", "Select the colour of your diamond which can take values from D (best) to J (worst)."),
                          ), 
                          div(
                              class="item-right",
                              div(class="item-value-head", "Your Selection:"),
                              textOutput("colour")
                          ), 
                      ),
                      class="list-group-item"),
                  tags$li(
                      div(class="item",
                          div(
                              class="item-left",
                              h4("CLARITY", class="item-head"),
                              p(class="item-note", "Select clarity which can be one of the following: IF (internally flawless - BEST), VVS1 (very, very slightly included),
                                                    VVS2, VS1 (very slightly included), VS2, SI1 (slightly included), SI2, I1 (included - WORST))"),
                          ), 
                          div(
                              class="item-right",
                              div(class="item-value-head", "Your Selection:"),
                              textOutput("clarity")
                          ), 
                      ),
                      class="list-group-item"),
                )
            ),
            
            div(h3("Minimum Price we will pay: $"), textOutput("predPrice"),  class="alert alert-success results")
            
        )
    )
))
