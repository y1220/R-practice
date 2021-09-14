library(shiny)
library(leaflet)
library(shinythemes)
ui <- bootstrapPage(
  theme = shinythemes::shinytheme('simplex'),
  leaflet::leafletOutput('map', height = '100%', width = '100%'),
  absolutePanel(top = 10, right = 10, id = 'controls',
                # CODE BELOW: Add slider input named nb_fatalities
                sliderInput('nb_fatalities',"Choose a number of fatality", value=10, min=1, max=40),
                # CODE BELOW: Add date range input named date_range
                dateRangeInput("date_range", "Choose a date range:", "1920-01-01", "1950-01-01")
  ),
  tags$style(type = "text/css", "html, body {width:100%;height:100%} #controls{background-color:white;padding:20px;}")

  )
server <- function(input, output, session) {
  output$map <- leaflet::renderLeaflet({
    leaflet() %>% 
      addTiles() %>%
      setView( -98.58, 39.82, zoom = 5) %>% 
      addTiles()
  })
}

shinyApp(ui, server)
