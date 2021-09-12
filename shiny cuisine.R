library(shiny)
library(ggplot2)
ui <- fluidPage(
  titlePanel('Explore Cuisines'),
  sidebarLayout(
    sidebarPanel(
      # CODE BELOW: Add an input named "cuisine" to select a cuisine
      selectInput("cuisine", "Select Cuisine", unique(recipes$cuisine)),
      # CODE BELOW: Add an input named "nb_ingredients" to select # of ingredients
      sliderInput("nb_ingredients", "Select No. of Ingredients", value= 10, min= 1, max= 100)
    ),
    mainPanel(
      # CODE BELOW: Add a DT output named "dt_top_ingredients"
      DT::DTOutput('dt_top_ingredients')
    )
  )
)
server <- function(input, output, session) {
  # CODE BELOW: Render the top ingredients in a chosen cuisine as 
  # an interactive data table and assign it to output object `dt_top_ingredients`
  dt_top_ingredients <- function(){
    dt_top_ingredients <- recipes %>% 
      filter(cuisine == input$cuisine) %>% 
      count(ingredient, name = input$nb_ingredients) %>% 
      arrange(desc(nb_recipes)) %>% 
      head(10)
  }
  
  output$dt_top_ingredients <- DT::renderDT({
    dt_top_ingredients()
  })
  
  
  
  
  
  
  
}
shinyApp(ui, server)