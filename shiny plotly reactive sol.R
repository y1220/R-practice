library(shiny)
library(ggplot2)
library(tidyverse)
library(plotly)

ui <- fluidPage(
  titlePanel('Explore Cuisines'),
  sidebarLayout(
    sidebarPanel(
      selectInput('cuisine', 'Select Cuisine', unique(recipes$cuisine)),
      sliderInput('nb_ingredients', 'Select No. of Ingredients', 5, 100, 10),
    ),
    mainPanel(
      tabsetPanel(
        # CODE BELOW: Add a plotly output named "plot_top_ingredients"
        tabPanel('Plot', plotly::plotlyOutput('plot_top_ingredients')),
        tabPanel('Table', DT::DTOutput('dt_top_ingredients'))
      )
    )
  )
)
server <- function(input, output, session) {
  # CODE BELOW: Add a reactive expression named `rval_top_ingredients` that
  # filters `recipes_enriched` for the selected cuisine and top ingredients
  # based on the tf_idf value.
  rval_top_ingredients <- reactive({
    recipes_enriched %>% 
      filter(cuisine == input$cuisine) %>% 
      arrange(desc(tf_idf)) %>% 
      head(input$nb_ingredients)
  })
  # CODE BELOW: Render a horizontal bar plot of top ingredients and 
  # the tf_idf of recipes they get used in, and assign it to an output named 
  # `plot_top_ingredients` 
  output$plot_top_ingredients <- plotly::renderPlotly({
    rval_top_ingredients() %>%
      ggplot(aes(x = ingredient, y = tf_idf)) +
      geom_col() +
      coord_flip()
  })
  
  output$dt_top_ingredients <- DT::renderDT({
    recipes %>% 
      filter(cuisine == input$cuisine) %>% 
      count(ingredient, name = 'nb_recipes') %>% 
      arrange(desc(nb_recipes)) %>% 
      head(input$nb_ingredients)
  })
}
shinyApp(ui, server)