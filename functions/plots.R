library(ggplot2)

plot_pop_trend <- function(pop) {
  ggplot(pop, aes(year, population)) +
    geom_line() +
    labs(title = "Population of Hokkaidō", x = "Year", y = "Population") +
    theme_minimal()
}

plot_aging <- function(pop) {
  ggplot(pop, aes(year, pct_over65)) +
    geom_line() +
    labs(title = "Share of Population Age 65+", x = "Year", y = "%") +
    theme_minimal()
}

plot_climate_trend <- function(climate) {
  ggplot(climate, aes(year, mean_temp)) +
    geom_line() +
    geom_smooth(se = FALSE) +
    labs(title = "Average Temperature in Hokkaidō", x = "Year", y = "Mean Temp (°C)") +
    theme_minimal()
}
