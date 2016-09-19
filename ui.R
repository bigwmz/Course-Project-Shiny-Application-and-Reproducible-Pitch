#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

library(markdown)

# Define UI for application that draws a histogram
shinyUI(navbarPage("Select the best car for your trip",
                   tabPanel("Table",
                            
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Provide information about your trip and the carachteristics of the car that you want"),
                                numericInput('dis', 'Distance (in miles):', 50, min = 1, max = 1000),
                                numericInput('cost', 'Gasoline Price (per gallon):', 2.41, min = 2, max = 4, step=0.01),
                                numericInput('gas', 'Maximum expenditure on gasoline:', 50, min=1, max=1000),
                                checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
                                
                                sliderInput('hp', 'Gross horsepower', min=50, max=340, value=c(50,340), step=10),
                                checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1))
                              ),
                              
                              
                              mainPanel(
                                dataTableOutput('table')
                                
                                
                              )
                            )
                            
                   ),      
                   tabPanel("About",
                                      mainPanel(
                                        includeMarkdown("D:/Archive/Chenproject/Classes/shiny/Courseproject/UI/index.md")
                                      )
                   )
)
) 
