reqBiomass <- function (fuel, qty, units) {
        if (fuel == "LPG") {
                ifelse (units == "tons/day", op <- qty*12000/1100, 
                        ifelse (units == "kL/day", op <- qty * 0.54 * 12000/1100,
                                op <- qty*(12000/1100)/1000
                        )
                )
        }        
        if (fuel == "Diesel") {
                ifelse (units == "tons/day", op <- qty *10700/1100, 
                        ifelse (units == "kL/day", op <- qty * 0.83 * 10700/1100,
                                op <- qty*(10700/1100)/1000
                        )
                )
        }
        if (fuel == "Furnace Oil") {
                ifelse (units == "tons/day", op <- qty *9900/1100, 
                        ifelse (units == "kL/day", op <- qty * 0.97 * 9900/1100,
                                op <- qty*(9900/1100)/1000
                        )
                )
        }
        if (fuel == "Propane") {
                ifelse (units == "tons/day", op <- qty *12025/1100, 
                        ifelse (units == "kL/day", op <- qty * 0.493 * 12025/1100,
                                op <- qty*(12025/1100)/1000
                        )
                )
        }
        paste (round (op, digits = 2))
}

plantCapacity <- function (fuel, qty, units) {
        if (fuel == "LPG") {
                ifelse (units == "tons/day", op <- qty*12000/1100, 
                        ifelse (units == "kL/day", op <- qty * 0.54 * 12000/1100,
                                op <- qty*(12000/1100)/1000
                        )
                )
        }        
        if (fuel == "Diesel") {
                ifelse (units == "tons/day", op <- qty *10700/1100, 
                        ifelse (units == "kL/day", op <- qty * 0.83 * 10700/1100,
                                op <- qty*(10700/1100)/1000
                        )
                )
        }
        if (fuel == "Furnace Oil") {
                ifelse (units == "tons/day", op <- qty *9900/1100, 
                        ifelse (units == "kL/day", op <- qty * 0.97 * 9900/1100,
                                op <- qty*(9900/1100)/1000
                        )
                )
        }
        if (fuel == "Propane") {
                ifelse (units == "tons/day", op <- qty *12025/1100, 
                        ifelse (units == "kL/day", op <- qty * 0.493 * 12025/1100,
                                op <- qty*(12025/1100)/1000
                        )
                )
        }
        op1 <- (op *1000* 1100/3900)/(0.7*24)
        paste (round (op1, digits = 2))
}
        

shinyServer(function(input, output) {
        output$text1 <- renderText ({
                paste("You have selected the fuel - ", input$fuel)                
        })
        output$text2 <- renderText ({
                paste("Your fuel consumption is - ", input$qty, input$units)                
        })
        output$text3 <- renderText ({
                paste("Equivalent producer gas required to replace your", input$fuel,
                      "-", reqBiomass (input$fuel, input$qty, input$units), "tons/day")                
        })
        output$text4 <- renderText ({
                paste("Required producer gas plant size - ",
                      plantCapacity (input$fuel, input$qty, input$units), "kg/hr")              
        })
        
})
