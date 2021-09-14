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
                dateRangeInput("date_range", "Choose a date range:", "1920-01-01", "1950-01-01"),
                # CODE BELOW: Add an action button named show_about
                actionButton('show_about', 'About')
  ),
  tags$style(type = "text/css", "html, body {width:100%;height:100%} #controls{background-color:white;padding:20px;}")

  )
server <- function(input, output, session) {
  # CODE BELOW: Use observeEvent to display a modal dialog
  # with the help text stored in text_about.
  text_about <- "This data was compiled by Mother Jones, nonprofit founded in 1976. Originally covering cases from 1982-2012, this database has since been expanded numerous times to remain current."
  observeEvent(input$show_about, {    showModal(modalDialog(text_about, title = 'About'))  })
  
  output$map <- leaflet::renderLeaflet({
    leaflet() %>% 
      addTiles() %>%
      setView( -98.58, 39.82, zoom = 5) %>% 
      addTiles()
  })
}

shinyApp(ui, server)
