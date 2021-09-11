library(shiny)
library(ggplot2)
library(babynames)
library(tidyverse)
library(plotly)

# generate top 20 popuplar names
tab <- table(a<-babynames$name)
df <- as.data.frame(tab)
names(df) <- c("name","times")
df$rank <- rank(-df$times,ties.method="min")
df <- df[order(df$rank,decreasing = F),]
top_trendy_names <- sort(df$name[1:20])

ui <- fluidPage(
  selectInput('name', 'Select Name', top_trendy_names),
  # selectInput('name', 'Select Name', top_trendy_names$name),
  # CODE BELOW: Add a plotly output named 'plot_trendy_names'
  plotly::plotlyOutput('plot_trendy_names')
)
server <- function(input, output, session){
  # Function to plot trends in a name
  plot_trends <- function(){
    babynames %>% 
      filter(name == input$name) %>% 
      ggplot(aes(x = year, y = n)) +
      geom_col()
  }
  # CODE BELOW: Render a plotly output named 'plot_trendy_names'
  output$plot_trendy_names <- plotly::renderPlotly({
    plot_trends()
  })
  
}
shinyApp(ui = ui, server = server)
