clean_pop <- function(df) {
  df |>
    dplyr::mutate(
      year = as.integer(year),
      population = as.numeric(population),
      pct_over65 = as.numeric(pct_over65)
    ) |>
    dplyr::arrange(year)
}

clean_climate <- function(df) {
  df |>
    dplyr::mutate(
      year = as.integer(year),
      month = as.integer(month),
      mean_temp = as.numeric(mean_temp),
      max_temp = as.numeric(max_temp),
      min_temp = as.numeric(min_temp)
    ) |>
    dplyr::arrange(year, month)
}

clean_eq <- function(df) {
  df |>
    dplyr::mutate(
      year = as.integer(year),
      date = as.Date(date),
      latitude = as.numeric(latitude),
      longitude = as.numeric(longitude),
      mag = as.numeric(mag)
    ) |>
    dplyr::arrange(date)
}
