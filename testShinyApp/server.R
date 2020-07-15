# Title     : TODO
# Objective : TODO
# Created by: smarien
# Created on: 14/07/2020
shinyServer(
  function(input, output, session) {
    observeEvent(input$col, {
      js$pageCol(input$col)
    })
  }
)
