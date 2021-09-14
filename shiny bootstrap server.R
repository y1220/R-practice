library(shiny)
library(leaflet)
library(shinythemes)
server <- function(input, output, session) {
  dates <- c("02/27/92", "02/27/92", "01/14/92", "02/28/92", "02/01/92", "03/05/2020")
  as.Date(dates, "%m/%d/%y")
  
  mass_shootings <- data.frame(
    case = c("Odessa-Midland shooting spree","Odessa-Midland shooting spree","Odessa-Midland shooting spree","Odessa-Midland shooting spree","Odessa-Midland shooting spree","Odessa-Midland shooting spree"), 
    location=c("Odessa, Texas", "Dayton, Ohio", "El Paso, Texas", 
               "Gilroy, California", "Virginia Beach, Virginia", "Aurora, Illinois" ), 
    date = dates, 
    summary = c("Seth A. Ator, 36, fired at police officers who stopped him for a traffic violation, and then went on a driving rampage in the Odessa-Midland region, where he also shot a postal worker and stole her vehicle. He was shot dead by law enforcement responding to the rampage. Ator had been fired from a job just prior to the attack (though per the FBI he had shown up to that job \"already enraged\"). He had a criminal record and \"a long history of mental problems and making racist comments,\" according to a family friend who spoke to the media.", "Seth A. Ator, 36, fired at police officers who stopped him for a traffic violation, and then went on a driving rampage in the Odessa-Midland region, where he also shot a postal worker and stole her vehicle. He was shot dead by law enforcement responding to the rampage. Ator had been fired from a job just prior to the attack (though per the FBI he had shown up to that job \"already enraged\"). He had a criminal record and \"a long history of mental problems and making racist comments,\" according to a family friend who spoke to the media.", "Seth A. Ator, 36, fired at police officers who stopped him for a traffic violation, and then went on a driving rampage in the Odessa-Midland region, where he also shot a postal worker and stole her vehicle. He was shot dead by law enforcement responding to the rampage. Ator had been fired from a job just prior to the attack (though per the FBI he had shown up to that job \"already enraged\"). He had a criminal record and \"a long history of mental problems and making racist comments,\" according to a family friend who spoke to the media.", "Seth A. Ator, 36, fired at police officers who stopped him for a traffic violation, and then went on a driving rampage in the Odessa-Midland region, where he also shot a postal worker and stole her vehicle. He was shot dead by law enforcement responding to the rampage. Ator had been fired from a job just prior to the attack (though per the FBI he had shown up to that job \"already enraged\"). He had a criminal record and \"a long history of mental problems and making racist comments,\" according to a family friend who spoke to the media.", "Seth A. Ator, 36, fired at police officers who stopped him for a traffic violation, and then went on a driving rampage in the Odessa-Midland region, where he also shot a postal worker and stole her vehicle. He was shot dead by law enforcement responding to the rampage. Ator had been fired from a job just prior to the attack (though per the FBI he had shown up to that job \"already enraged\"). He had a criminal record and \"a long history of mental problems and making racist comments,\" according to a family friend who spoke to the media.","Seth A. Ator, 36, fired at police officers who stopped him for a traffic violation, and then went on a driving rampage in the Odessa-Midland region, where he also shot a postal worker and stole her vehicle. He was shot dead by law enforcement responding to the rampage. Ator had been fired from a job just prior to the attack (though per the FBI he had shown up to that job \"already enraged\"). He had a criminal record and \"a long history of mental problems and making racist comments,\" according to a family friend who spoke to the media."),
    fatalities = c(7,9,22,3,12,5),
    injured = c(25,27,26,12,4,6),
    total_victims = c(32,36,48,15,16,11),
    location_1 = c("Other","Other","Workplace","Other","Workplace","Workplace")
  )
  
  rval_mass_shootings <- reactive({
    # MODIFY CODE BELOW: Filter mass_shootings on nb_fatalities and 
    # selected date_range.
    mass_shootings %>%
      filter(
        fatalities >= input$nb_fatalities,
        data >= input$date_range[1],
        data <= input$date_range[2]
      )

  })
  output$map <- leaflet::renderLeaflet({
    rval_mass_shootings() %>%
      leaflet() %>% 
      addTiles() %>%
      setView( -98.58, 39.82, zoom = 5) %>% 
      addTiles() %>% 
      addCircleMarkers(
        # CODE BELOW: Add parameters popup and radius and map them
        # to the summary and fatalities columns
        popup = ~ summary,
        radius = ~ fatalities,
        fillColor = 'red', color = 'red', weight = 1
      )
  })
}
ui <- bootstrapPage(
  theme = shinythemes::shinytheme('simplex'),
  leaflet::leafletOutput('map', height = '100%', width = '100%'),
  absolutePanel(top = 10, right = 10, id = 'controls',
                sliderInput('nb_fatalities', 'Minimum Fatalities', 1, 40, 10),
                dateRangeInput('date_range', 'Select Date', "2010-01-01", "2019-12-01")
  ),
  tags$style(type = "text/css", "html, body {width:100%;height:100%}     
    #controls{background-color:white;padding:20px;}"))

shinyApp(ui, server)
