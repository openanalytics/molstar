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

    titlePanel("Molstar shiny application"),
    actionButton("button", "Click me"),
    textInput("url_test", "url_test",value = "https://geministorageapp.blob.core.windows.net/pdb-storage/110L.pdb?sp=r&st=2020-07-13T11:23:24Z&se=2020-07-30T19:23:24Z&spr=https&sv=2019-10-10&sr=b&sig=pVY5Bn2ZT7M0yo0UhhH6Jtakwmk8CaaeiOVcl2cE2Ag="),
    mainPanel(
      includeScript("basic-wrapper/index.js"),
      includeCSS("basic-wrapper/molstar.css"),
      includeHTML("basic-wrapper/index.html")
      # extendShinyjs(text = 'basic-wrapper/index.html'),
      # includeScript("viewer/molstar.js"),
      # includeCSS("viewer/molstar.css"),
      # includeHTML("viewer/index.html")
    )

  )

)

