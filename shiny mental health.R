library(shiny)
library(ggplot2)
library(dplyr)
# missing mental health survey data
ui <- fluidPage(
  # CODE BELOW: Add an appropriate title
  titlePanel("2014 Mental Health in Tech Survey"),
  sidebarPanel(
    # CODE BELOW: Add a checkboxGroupInput   
    checkboxGroupInput(
      inputId = "mental_health_consequence",
      label = "Do you think that discussing a mental health issue with your employer would have negative consequences?", 
      choices = unique(mental_health_survey$mental_health_consequence),
      selected = "Maybe"
    ),
    
    # CODE BELOW: Add a pickerInput
    pickerInput(
      inputId = "mental_vs_physical",
      label = "Do you feel that your employer takes mental health as seriously as physical health?",
      choices = unique(mental_health_survey$mental_health_consequence),
      multiple = TRUE
    )
    
    
    
    
    
  ),
  mainPanel(
    # CODE BELOW: Display the output
    plotOutput('plot')
  )
)

server <- function(input, output, session) {
  # CODE BELOW: Build a histogram of the age of respondents
  # Filtered by the two inputs
  output$plot <- renderPlot({
    ggplot(mental_health_survey, aes(x = Age, y = count)) +
      geom_histogram()
  })
  
  
  
  
  
  
  
}

shinyApp(ui, server)