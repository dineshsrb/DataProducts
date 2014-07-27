shinyUI(fluidPage(
        titlePanel ("Replacement of fossil fuels - Find out the requirement for alternate renewable producer gas*"),                
        sidebarLayout(
                sidebarPanel (h4("Enter your FUEL details"),
                br(),
                helpText("*Producer gas is a mixture of flammable gases (principally carbon monoxide and hydrogen) 
                         and nonflammable gases (mainly nitrogen and carbon dioxide) made by the 
                         partial combustion of renewable carbonaceous substances like wood, 
                         coconut shell etc"),
                helpText("It is used to replace fossil fuels like LPG, Disel, Furnace oil, Propane etc"),
                br(),
                selectInput("fuel", 
                        label = "Please select your fossil fuel",
                        choices = list("LPG", "Diesel",
                                       "Furnace Oil", "Propane"),
                        selected = NULL
                        ),
                br(),
                numericInput ("qty",
                              label = "Your daily fuel consumption quantity",
                              value = "1",
                              min = NA , max = NA, step = NA
                              ),
                br(),
                radioButtons("units",
                             label = "Choose your units (or) convert to anyone 
                             of the given units below",
                             choices = c("tons/day", "kL/day", "kg/ day"),
                             selected = NULL
                             ),
                br(),
                helpText("Note: Output is updated automatically once you change the
                         inputs"),
                br()
                ),
                
                mainPanel (
                        helpText(h4("This app can be used by any biomass energy companies or 
                                 Industrial consumers who wish to replace their fossil fuels 
                                 like LPG, Diesel, Furnace oil etc., with renewable prodoucer gas")),
                        br(),
                        h4("Your required quantity of gas and gasifier plant size"),
                        br(),
                        verbatimTextOutput("text1"),
                        br(),
                        verbatimTextOutput("text2"),
                        br(),
                        h5(textOutput("text3")),
                        br(),
                        h5(textOutput("text4")),
                        br(),                                                
                        br(),
                        helpText("Note: The output values are indicative only,
                                 the values are subjected to change")
        )
)
)
)
