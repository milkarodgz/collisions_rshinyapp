#ui.R

shinyUI(dashboardPage(
  dashboardHeader(title = "NYC Collisions"),
  dashboardSidebar(
    sidebarUserPanel("Menu"),
    sidebarMenu(
      menuItem("Home"),
      menuItem("Map", tabName = "Map", icon = icon("map-marker-alt")),
      menuItem("Accidents",tabName = "accidents",icon = icon("car-crash")),
      menuItem("Data", tabName = "data", icon = icon("road")),
      menuItem("github", tabName = "Github", icon("file-code-o"), href = "https://github.com/milkarodgz")
      )),
  dashboardBody(
    tags$head(tags$style(
      HTML(
        '
        /* logo */
        .skin-blue .main-header .logo {
        background-color: rgb(255,255,255); color:        rgb(0,144,197);
        font-weight: bold;font-size: 24px;text-align: Right;
        }
        
        /* logo when hovered */
        .skin-blue .main-header .logo:hover {
        background-color: rgb(255,255,255);
        }
        
        /* navbar (rest of the header) */
        .skin-blue .main-header .navbar {
        background-color: rgb(255,255,255);
        }
        
        /* main sidebar */
        .skin-blue .main-sidebar {
        background-color: rgb(7, 7, 7);;
        }
        
        /* active selected tab in the sidebarmenu */
        .skin-blue .main-sidebar .sidebar .sidebar-menu .active a{
        background-color: #696969);
        color: rgb(86, 136, 183);font-weight: bold;font-size: 18px;
        }
        
        /* other links in the sidebarmenu */
        .skin-blue .main-sidebar .sidebar .sidebar-menu a{
        background-color: rgb(44, 48, 48);
        color: rgb(255,255,255);font-weight: bold;
        }
        
        /* other links in the sidebarmenu when hovered */
        .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover{
        background-color: rgb(232,245,251);color: rgb(0,144,197);font-weight: bold;
        }
        
        /* toggle button color  */
        .skin-blue .main-header .navbar .sidebar-toggle{
        background-color: rgb(255,255,255);color:rgb(0,144,197);
        }
        
        /* toggle button when hovered  */
        .skin-blue .main-header .navbar .sidebar-toggle:hover{
        background-color: rgb(0,144,197);color:rgb(0,0,0);
        }
        '
      )
      )),
    tabItems(
      tabItem(tabName = "Map",
        fluidRow(
          selectInput("borough", "Choose a borough:", choices = unique(df1$BOROUGH)),
          textOutput("result")
        ),
        fluidRow(
          infoBoxOutput(outputId = "maxBox"),
          infoBoxOutput(outputId = "minBox")
        ),
        
      
        fluidRow(leafletOutput(outputId = "mymap", height = 1000)
        )),
      
      tabItem(tabName = "accidents",
        fluidRow(leafletOutput(outputId ="zmap", height = 1000))
           
         ),
        
      
      tabItem(tabName = "data",
              fluidPage(h1("NYC Collisions 2015-2018", align="center"),
                        br(),
              fluidRow(column(width = 4, selectizeInput('ZIP.CODE', label = "zip code", choices=unique(df1$ZIP.CODE)),
                        column(width=4, uiOutput("dynamic_widget"))),
                       br(),
                       fluidRow(column(width=4, uiOutput("TOTAL.INJURED")),
                                column(width=4, uiOutput("TOTAL.FATALITIES"))),
                       fluidRow(box(DT::dataTableOutput(outputId = "table"), width=12))
                       
              )))
                              
              
              )))
    )
   