ui <- fluidPage(
  
  selectInput('greeting', 'Select greeting', c('Hello','Bonjour')), 
  
  textInput("name", "Enter your name", 'Kaelen'),
  textOutput("name")
)

server <- function(input, output, session) {
  
  output$name <- renderText({
    paste(input$greeting,", ", input$name)
  })
}

shinyApp(ui = ui, server = server)