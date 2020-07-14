# Title     : TODO
# Objective : TODO
# Created by: smarien
# Created on: 14/07/2020
library(shiny)
shinyUI(

    fluidPage(
      titlePanel("Molstar shiny application example!"),
      mainPanel(
      includeScript("proteopedia-wrapper/index.js"),
      includeCSS("proteopedia-wrapper/molstar.css"),
      includeHTML("proteopedia-wrapper/index.html")
      )

    )

)

