library(shinythemes)
# library(shinyWidgets)

fluidPage(theme = shinytheme("readable"),
  tags$head(tags$style(HTML(' 
  
  body {
  background-color: #ece8e8 },
  form .well {
  background-color: #ffffffeb
  }                          
                            '))),
  headerPanel('Mood tools!'),
  sidebarPanel(
    tags$b('Configuration panel'),
    br(),
    br(),
    tags$span('Here are some introductions. The idea here is a mood journal. You can play with things below. Stuff!!'),
    hr(),
    textInput("mood_sheet_name", "Your journal name (in Drive)", "mood_journal"),
    actionButton("go", "Load data"),
    hr(),
    tags$b('Override mood variable?'),
    actionButton("avg", "Yes, use mean"),
    hr(),
    selectInput("walk_nature_indicator", "Walk & Nature Indicator:",
                c("Overall mood" = "Mood",
                  "High mood" = "High",
                  "Low mood" = "Low")),
    hr()
    # ,
    # dateRangeInput("daterange1", "Date range:",
    #                start = "2019-04-01",
    #                end   = Sys.Date() + 1)
  ),
  mainPanel(
    br(),
    h4('Changes in mood over time (overall, high, and low per day)'),
    plotOutput('big_mood_plot', click='user_click', brush = 'user_brush', hover = 'user_hover'),
    br(),
    p(htmlOutput("info")),
    
    hr(),
    h4('Correlation matrix for mood data'),
    plotOutput('a_new_plot'),
    br(),
    h4('Mood distribution by walk and nature experiences'),
    plotOutput('walk_and_nature'),
    br(),
    # hr(),
    # 
    # br(),
    # h4('Gratitude words...!'),
    # plotOutput('gratitude_plot'),
    br()
  )
)

