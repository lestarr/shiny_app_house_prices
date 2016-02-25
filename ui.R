library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Predict the house price"),
  sidebarPanel(
    h3('Your data'),
    numericInput('id1_room', 'Choose the number of bedrooms', 1, min = 1, max = 7, step = 1),
    p("\r\n\r\n"),
    selectInput("id2_loc", "Check the suitable description of the location",
                       c("welthy district" = 2,
                         "upper middle" = 10,
                         "middle" = 20,
                         "poor" = 25
                         ))
    #,
    #submitButton('Submit')
    
  ),
  mainPanel(
    h4('You have chosen number of bedrooms:'),
    verbatimTextOutput("oid1_room"),
    h4('and location:'),
    verbatimTextOutput("oid2_loc"),
    h3('The predicted house price in $ 1000s:'),
    verbatimTextOutput("oid3_price")
    
  )
))