# Title     : TODO
# Objective : TODO
# Created by: smarien
# Created on: 14/07/2020
library(shiny)
library(shinyjs)
# jsCode <- "shinyjs.pageCol = function(params){console.log(params)}"

shinyUI(

  fluidPage(
    useShinyjs(),

    titlePanel("Molstar shiny application example!"),
    actionButton("button", "Click me"),
    textInput("text", "Text"),
    selectInput("col", "Colour:",
                c("white", "yellow", "red", "blue", "purple")),
    mainPanel(
      includeScript("basic-wrapper/index.js"),
      includeCSS("basic-wrapper/molstar.css"),
      includeHTML("basic-wrapper/index.html"),
      # extendShinyjs(text = 'basic-wrapper/index.html'),
      # includeScript("viewer/molstar.js"),
      # includeCSS("viewer/molstar.css"),
      # includeHTML("viewer/index.html")
    )

  )

)

