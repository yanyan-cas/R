library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
        
        # Application title
        headerPanel("Predict with decision tree for species in IRIS data set"),

        sidebarPanel(
                numericInput("Sepal.Length", "Sepal.Length", 0.1, min = 0.1, step = 0.1),
                numericInput("Sepal.Width", "Sepal.Width", 0.1, min = 0.1, step = 0.1),
                numericInput("Petal.Length", "Petal.Length", 0.1, min = 0.1, step = 0.1),
                numericInput("Petal.Width", "Petal.Width", 0.1, min = 0.1, step = 0.1),
                actionButton("goButton","Go!")
        ),
        
        
        mainPanel(
                p("The predict category for your submitted data is:"),
                h3(textOutput("Species"))
                
        )
))