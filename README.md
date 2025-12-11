# Hokkaidō Island Final Project — MA615 Fall 2025

This repository contains the final project for MA615, focusing on the island of **Hokkaidō, Japan**.

## Folder Structure

```
Hokkaido-Project/
├── data/
├── report/
├── presentation/
├── website/
├── functions/
└── README.md
```

## Deliverables

- **Quarto Report**: `report/Hokkaido_Report.qmd`
- **Presentation**: `presentation/Hokkaido_Presentation.qmd`
- **Shiny App**: `website/app.R`
- **Cleaning and Plot Functions**: `functions/cleaning.R`, `functions/plots.R`

## Topics Covered

- Long-term population trends in Hokkaidō
- Climate change and warming patterns
- Earthquake activity and magnitude distribution
- Statistical modeling of temperature trends
- Geographic visualization and interactive exploration

## How to Run

1. Open the project folder in RStudio.
2. To render the report, open `report/Hokkaido_Report.qmd` and click **Render**.
3. To run the Shiny app, set the working directory to `website/` and run `app.R`.

Required packages include: `dplyr`, `readr`, `ggplot2`, `sf`, `leaflet`, and `lubridate`.
