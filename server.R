library(shiny)
library(caret)
library(MASS)
data("Boston")

lm1 <- lm(medv~rm+lstat, data = Boston)

predictHousePrice <- function(roomNr, loc){
  newValues <- data.frame("rm"= as.numeric(c(roomNr)), "lstat"= as.numeric(c(loc)))
  price <- predict(lm1, newValues)
  price
}


shinyServer(
  function(input, output) {
    output$oid1_room <- renderPrint({input$id1_room})
    output$oid2_loc <- renderPrint({input$id2_loc})
    #output$oid3_price <- renderPrint("Hallo")
    output$oid3_price <- renderPrint(cat(predictHousePrice(input$id1_room+3, input$id2_loc)[1]))
    
  }
)