if (!require(shiny)) { install.packages("shiny") }
if (!require(readxl)) { install.packages("readxl") }

library(readxl)
library(shiny)

fluidPage(
  titlePanel("Excel File Loader"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Choose Excel File",
                accept = c(".xlsx", ".xls"))
    ),
    mainPanel(
      tableOutput("contents")
    )
  )
)