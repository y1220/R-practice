library(shiny)
library(ggplot2)
library(babynames)
ui <- fluidPage(
  # CODE BELOW: Build the UI layout keeping the
  #   inputs in the sidebar, outputs on the right, title on the top
  titlePanel("Most Popular Names"),
  sidebarLayout(
    sidebarPanel(
      # CODE BELOW: Add an input to let the user select sex (M / F)
      selectInput('sex', 'Select Sex', choices =c('M','F')),
      # CODE BELOW: Add a slider to let the user select a year (1880 to 2017)
      sliderInput('year', 'Select Year', min=1880, max=2017, value=2000)
    ),
    mainPanel(
      plotOutput('plot')
    )
  )
)
server <- function(input, output, session) {
  output$plot <- renderPlot({
    top_names_by_sex_year <- get_top_names(input$year, input$sex) 
    ggplot(top_names_by_sex_year, aes(x = name, y = n)) +
      geom_col()
  })
}
shinyApp(ui = ui, server = server)
