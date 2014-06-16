library(shiny)
shinyUI(pageWithSidebar(
        headerPanel(em("Dear classmate, welcome to this shiny page, here you can calculate your overall efficiency by submitting your grade and time devoted in each course")),
        sidebarPanel(
                h4("For course#1, how much time did you devote and what grade did you finally get in your course?"),
                numericInput('grade', 'Grade (0-100)', 90, min = 0, max = 100, step = 1),
                numericInput('time', 'Time Devoted (hr)', 10, min = 0, max = 100, step = 1),
                h4("For course#2, how much time did you devote and what grade did you finally get in your course?"),
                numericInput('grade2', 'Grade (0-100)', 80, min = 0, max = 100, step = 1),
                numericInput('time2', 'Time Devoted (hr)', 10, min = 0, max = 100, step = 1),
                h4("For course#3, how much time did you devote and what grade did you finally get in your course?"),
                numericInput('grade3', 'Grade (0-100)', 70, min = 0, max = 100, step = 1),
                numericInput('time3', 'Time Devoted (hr)', 10, min = 0, max = 100, step = 1),
                actionButton("goButton", h2("See efficiency"))
                
        ),
        mainPanel(
                h2("Some statistics"),
                h5("Grade for course#1:"),
                verbatimTextOutput("inputValue1"),
                h5("Grade for course#2:"),
                verbatimTextOutput("inputValue2"),
                h5("Grade for course#3:"),
                verbatimTextOutput("inputValue3"),
                h5("Time devoted for course#1:"),
                verbatimTextOutput("inputValue4"),
                h5("Time devoted for course#2:"),
                verbatimTextOutput("inputValue5"),
                h5("Time devoted for course#3:"),
                verbatimTextOutput("inputValue6"),
                
                h2("Overall efficiency"),
                verbatimTextOutput("prediction"),
                textOutput("textt")
        )
))