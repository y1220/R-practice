library(shiny)
library(ggplot2)
library(tidyverse)
library(rsconnect)

library(openxlsx)
# excel = read.xlsx("test1.xlsx", sheetIndex= 1)
excel = read.xlsx("fetched3.xlsx")
excel
ui <- fluidPage(
  titlePanel("Job type and value correlation"),
  # Add select input named "job_type" to choose among listed type of job
  selectInput(
    'job_type', 
    'Select job type', 
    selected = '管理的職業', 
    choices = c('管理的職業', '専門的・技術的職業', '販売', '教育', 'サービス職業')
  ),
  # Add plot output to display correlation of job and value
  plotOutput('value_tendency')
)



server <- function(input, output, session){
  # Render plot of value scores depends on each job type
  output$value_tendency <- renderPlot({
    # Fetch data from excel
    results <- excel %>% 
      # Filter for the selected job type
      filter(job_type == input$job_type) 
      #filter(job_satisfaction > 1) 
     
    # Plot each score
    ggplot(results, aes(x = value, y = score)) +
      geom_col(fill = "#263e63")
  })
}

shinyApp(ui = ui, server = server)