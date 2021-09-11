library(shiny)
library(ggplot2)
library(babynames)
library(tidyverse)
ui <- fluidPage(
  # MODIFY CODE BELOW: Wrap in a sidebarLayout
  sidebarLayout(
    sidebarPanel(
      # MODIFY CODE BELOW: Wrap in a sidebarPanel
      selectInput('name', 'Select Name', top_trendy_names$name),
    ),
    mainPanel(
      # MODIFY CODE BELOW: Wrap in a mainPanel
      plotly::plotlyOutput('plot_trendy_names'),
      DT::DTOutput('table_trendy_names')
    )
  )
  
  
)
# DO NOT MODIFY
server <- function(input, output, session){
  # Function to plot trends in a name
  plot_trends <- function(){
    babynames %>% 
      filter(name == input$name) %>% 
      ggplot(aes(x = year, y = n)) +
      geom_col()
  }
  output$plot_trendy_names <- plotly::renderPlotly({
    plot_trends()
  })
  
  output$table_trendy_names <- DT::renderDT({
    babynames %>% 
      filter(name == input$name)
  })
}
shinyApp(ui = ui, server = server)
