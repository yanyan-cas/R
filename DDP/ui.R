library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
        
        # Application title
        headerPanel("Predict with decision tree for species in IRIS data set"),

        sidebarPanel(
                numericInput("Sepal.Length", "Sepal.Length", 5.1, min = 0.1, step = 0.1),
                numericInput("Sepal.Width", "Sepal.Width", 3.5, min = 0.1, step = 0.1),
                numericInput("Petal.Length", "Petal.Length", 1.4, min = 0.1, step = 0.1),
                numericInput("Petal.Width", "Petal.Width", 0.2, min = 0.1, step = 0.1),
                submitButton('Submit')
        ),
        
        
        mainPanel(
                p("The predict category for your submitted data is:"),
                h3(textOutput("Species"))
                
        )
))