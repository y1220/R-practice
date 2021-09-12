library(shiny)
library(ggplot2)
library(babynames)
library(tidyverse)

# MODIFY this app (built in the previous exercise)
ui <- fluidPage(
  titlePanel("Most Popular Names"),
  sidebarLayout(
    sidebarPanel(
      selectInput('sex', 'Select Sex', c("M", "F")),
      sliderInput('year', 'Select Year', min = 1880, max = 2017, value = 1900)
    ),
    mainPanel(
      tabsetPanel(        
        tabPanel('Plot',                  
                 plotOutput('plot')
        ),        
        tabPanel('Table',                 
                 tableOutput('table')   
        )
      )
    )
  )
)

server <- function(input, output, session) {
  get_top_names <- function(y,s){
    get_top_names <- babynames %>% 
      filter(year == y) %>% 
      filter(sex == s) %>% 
      top_n(10, prop)
  }
  output$plot <- renderPlot({
    top_names_by_sex_year <- get_top_names(input$year, input$sex) 
    ggplot(top_names_by_sex_year, aes(x = name, y = prop)) +
      geom_col()
  })
  output$table <- renderTable({
    get_top_names(input$year, input$sex) 
  })
}

shinyApp(ui = ui, server = server)
