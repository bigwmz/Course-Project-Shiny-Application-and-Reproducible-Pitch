#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

library(markdown)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Show the cars that correspond to the filters
  output$table <- renderDataTable({
    
    hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1)
    data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg, 
                      GasolineExpenditure = input$dis/mpg*input$cost,Horsepower = hp
    )
    data <- filter(data, GasolineExpenditure <= input$gas,
                   Horsepower %in% hp_seq)
    
    data <- arrange(data, GasolineExpenditure)
    data
  }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30))
  
  #  output$about <- renderUI({
  #    rmarkdown::run("D:/Archive/Chen_project/Classes/shiny/about.Rmd")
  #    inclRmd("D:/Archive/Chen_project/Classes/shiny/about.Rmd")
  #  })
})
