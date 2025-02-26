# dashboard header ----
header <- dashboardHeader(

  # title ----
  title = "Fish Creek Watershed Lake Monitoring",
  titleWidth = 400

)

# dashboard sidebar ----
sidebar <- dashboardSidebar(

  # sidebarMenu ----
  sidebarMenu(

    menuItem(text = "Welcome", tabName = "welcome", icon = icon("star")),
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("gauge"))

  ) # END sidebarMenu

) # END dashboardSidebar

# dashboard body ----
body <- dashboardBody(

  # tabItems ----
  tabItems(

    # welcome tabItem ----
    tabItem(tabName = "welcome",

            # left-hand column ----
            column(width = 6,

                   # background info box ----
                   box(width = NULL,
                       includeMarkdown("text/top.md"),
                       tags$img(src = "fish_map.jpg",
                                alt = "photo of map of northern alaska showing fish creek watershed",
                                style = "max-width: 100%;"),
                       tags$h6("Map Source:",
                               tags$a(href = "http://www.fishcreekwatershed.org/",
                                                     "FCWO"),
                               style = "text-align: center;")

                   ) # END backgroudn info box

            ), # END left-hand column

            # right-hand column ----
            column(width = 6,

                   # first fluidRow ----
                   fluidRow(

                     # citation box ----
                     box(width = NULL,

                         "data citation here"

                     ) # END citation box

                   ), # END first fluidRow

                   # second fluidRow ----
                   fluidRow(

                     # disclaimer box ----
                     box(width = NULL,

                         includeMarkdown("text/disclaimer.md")

                     ) # END disclaimer box

                   ) # END second fluidRow

            ) # END right-hand column

    ), # END welcome tabItem

    # dashboard tabItem ----
    tabItem(tabName = "dashboard",

            # fluidRow ----
            fluidRow(

              # input box ----
              box(width = 4,

                  title = tags$strong("Adjust lake parameter ranges:"),

                  # sliderInputs ----
                  sliderInput(inputId = "elevation_slider_input",
                              label = "Elevation (meters above SL)",
                              min = min(lake_data$Elevation),
                              max = max(lake_data$Elevation),
                              value = c(min(lake_data$Elevation),
                                        max(lake_data$Elevation)))

              ), # END input box

              # leaflet box ----
              box(width = 8,

                  title = tags$strong("Monitored lakes within Fish Creek Watershed"),

                  # leaflet output ----
                  leafletOutput(outputId = "lake_map_output") |>
                    withSpinner(type = 1, color = "blue")

              ) # END leaflet box

            ) # END fluidRow

    ) # END dashboard tabItem

  ) # END tabItems

) # END dashboardBody

# combine all into dashboardPage ----
dashboardPage(header, sidebar, body)
