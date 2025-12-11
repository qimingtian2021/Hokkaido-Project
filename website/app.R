library(shiny)
library(dplyr)
library(readr)
library(ggplot2)
library(leaflet)

pop <- read_csv("../data/hokkaido_population.csv")
climate <- read_csv("../data/hokkaido_climate.csv")
eq <- read_csv("../data/earthquakes_japan.csv")

ui <- fluidPage(
  titlePanel("Hokkaidō Interactive Explorer"),
  tabsetPanel(

    tabPanel("Population",
             sliderInput("yr", "Select years:",
                         min(pop$year), max(pop$year),
                         value = c(1970, max(pop$year))),
             plotOutput("popPlot")
    ),

    tabPanel("Climate",
             selectInput("tempType", "Temperature:",
                         choices = c("mean_temp", "max_temp", "min_temp"),
                         selected = "mean_temp"),
             checkboxInput("trend", "Add trend line", TRUE),
             plotOutput("climatePlot")
    ),

    tabPanel("Earthquakes",
             sliderInput("mag", "Minimum magnitude:", 3, 7, 4),
             leafletOutput("eqMap"),
             tableOutput("eqTable")
    )
  )
)

server <- function(input, output, session) {

  output$popPlot <- renderPlot({
    pop |>
      filter(year >= input$yr[1], year <= input$yr[2]) |>
      ggplot(aes(year, population)) +
      geom_line() +
      labs(x = "Year", y = "Population",
           title = "Hokkaidō Population") +
      theme_minimal()
  })

  output$climatePlot <- renderPlot({
    col <- input$tempType
    g <- ggplot(climate, aes(year, .data[[col]])) +
      geom_line() +
      labs(x = "Year", y = "Temperature (°C)",
           title = "Hokkaidō Temperature Trend") +
      theme_minimal()
    if (input$trend) {
      g <- g + geom_smooth(se = FALSE)
    }
    g
  })

  output$eqMap <- renderLeaflet({
    eq_filtered <- eq |>
      filter(mag >= input$mag)

    leaflet(eq_filtered) |>
      addTiles() |>
      addCircleMarkers(~longitude, ~latitude,
                       radius = ~mag,
                       fillOpacity = 0.6)
  })

  output$eqTable <- renderTable({
    eq |>
      filter(mag >= input$mag) |>
      arrange(desc(mag)) |>
      head(20)
  })
}

shinyApp(ui, server)
