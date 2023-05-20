#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

list_features <- c("meat","diary","fish","vegetables")
# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("meal planneR"),
    hr(),
    br(),
    tabsetPanel(
            tabPanel("Generate recipes",
                     sidebarLayout(
                    sidebarPanel(
                            sliderInput("meal_no",
                                        "Number of meals to generate:",
                                        min = 1,
                                        max = 10,
                                        value = 5),
                            checkboxGroupInput("m_feat","Features for dishes:",
                                               list_features)
                            
                    ),
                    
                    # Show a plot of the generated distribution
                    mainPanel(
                            plotOutput("distPlot")
                    )
            )),
            tabPanel("Input your recipes",
                     fluidRow(
                             "Click this URL to input your new recipes:",
                             uiOutput("form_link")
                     ),
                     fluidRow(
                             
                     ))
    )

    # Sidebar with a slider input for number of bins 
    
)

# Define server logic required to draw a histogram
server <- function(input, output) {
        form_url <- a("Recipe Input",href="https://forms.gle/nQtqd5W1TwCw1ZDYA")

    output$form_link <- renderUI({
            tagList("URL Link",form_url)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
