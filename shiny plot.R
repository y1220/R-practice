library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Baby Name Explorer"),
  # CODE BELOW: Add a sidebarLayout, sidebarPanel, and mainPanel
  
  
  
  sidebarLayout(
    sidebarPanel(textInput('name', 'Enter Name', 'David')),
    mainPanel(plotOutput('trend'))
  )
  
)

server <- function(input, output, session) {
  output$trend <- renderPlot({
    ggplot(subset(babynames, name == "David")) +
      geom_line(aes(x = year, y = prop, color = sex))

  })
}
shinyApp(ui = ui, server = server)
?ggplot2
