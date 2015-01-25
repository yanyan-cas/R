library(ggplot2)
library(lattice)
library(caret)
library(class)
library(chemometrics)
training <- read.csv("pml-training.csv")
testing <- read.csv("pml-testing.csv")

proc <- function(x){
        y <- NULL
        a <- NULL
        for(i in 1:length(x))
        {
                a <- summary(x[,i])[7]
                if(is.na(a)==FALSE){
                        if((a>19215)==TRUE){y <- cbind(y,i)}
                }
        }
        return(y)
}


proc2 <- function(x){
        y <- NULL
        b <- NULL
        for(i in 1:length(x))
        {
                b <- summary(x[,i])[1]
                if(names(b)==""){
                        if((b==19216)==TRUE){y <- cbind(y,i)}
                }
        }
        return(y)
}

t <- cbind(proc(training), proc2(training))
work <- training
work <- work[,-t]
inTrain <- work[,c(-1,-2,-3,-4,-5,-6,-7)]


modelFit <- train(classe ~., method="knn", preProcess = c("center", "scale"),
                  data=inTrain, tuneLength = 10, trControl = trainControl(method = "boot"))

modelFit$finalModel

modelFit$results



