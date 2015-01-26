library(shiny)
library(caret)
library(lattice)
library(ggplot2)
library(rpart)
data(iris)
model <- train(Species ~., method = "rpart", data= iris)

category <- NULL

category <- function(a,b,c,d){
        x <- iris[1,]
        x$Sepal.Length <-a
        x$Sepal.Width <- b
        x$Petal.Length <- c
        x$Petal.Width<- d
        return(as.character(predict(model, newdata = x)))
}

shinyServer(
        function(input, output) {
        output$Species <- renderText({
                input$goButton
                isolate(category(input$Sepal.Length,input$Sepal.Width, input$Petal.Length, input$Petal.Width))})
}
)