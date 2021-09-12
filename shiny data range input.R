library(shiny)
ui <- fluidPage(
  # CODE BELOW: Add a title
  titlePanel("UFO Sightings"),
 
  sidebarLayout(
    sidebarPanel(
      # CODE BELOW: One input to select a U.S. state
      
      selectInput('state', 'Choose a U.S. state:', choices=unique(usa_ufo_sightings)),
      
      # And one input to select a range of dates
      #selectInput('date', 'Choose a date range:',choices=datarange1),
      dateRangeInput("daterange1", "Date range:",
                     start = "2001-01-01",
                     end   = "2010-12-31")
    ),
    mainPanel()
  )
)

server <- function(input, output) {
  usa_ufo_sightings <- c('TX','HI','TN')
}

shinyApp(ui, server)
