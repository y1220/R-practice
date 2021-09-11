library(shiny)
library(ggplot2)
library(babynames)
library(tidyverse)

# generate top 20 popuplar names
tab <- table(a<-babynames$name)
df <- as.data.frame(tab)
names(df) <- c("name","times")
df$rank <- rank(-df$times,ties.method="min")
df <- df[order(df$rank,decreasing = F),]
top_trendy_names <- sort(df$name[1:20])

ui <- fluidPage(
sidebarLayout(
  sidebarPanel(
    selectInput('name', 'Select Name', top_trendy_names$name)
  ),
  mainPanel(
    # MODIFY CODE BLOCK BELOW: Wrap in a tabsetPanel
    tabsetPanel(
      # MODIFY CODE BELOW: Wrap in a tabPanel providing an appropriate label
      tabPanel('year',
               plotly::plotlyOutput('plot_trendy_names'),
      ),
      # MODIFY CODE BELOW: Wrap in a tabPanel providing an appropriate label
      tabPanel('name',
               DT::DTOutput('table_trendy_names')
      )
    )
    
    
    
  )
)
)
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

