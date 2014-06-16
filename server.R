library(shiny)
library(ggplot2)
library(UsingR)
shinyServer(
        function(input, output) {
                output$inputValue1 <- renderPrint({input$grade})
                output$inputValue2 <- renderPrint({input$grade2})
                output$inputValue3 <- renderPrint({input$grade3})
                output$inputValue4 <- renderPrint({input$time})
                output$inputValue5 <- renderPrint({input$time2})
                output$inputValue6 <- renderPrint({input$time3})
                
                output$prediction <- renderPrint({
                        if(!input$goButton==0){
                        x <- c(input$grade,input$grade2,input$grade3)
                        y <- c(input$time,input$time2,input$time3)
                        
                        paste("For every extra 1 hour devoted to your subject, you gain addtional",
                              summary(lm(x~y))$coef[2],"grades on average!",sep=" ")}
                })
                
        }
)