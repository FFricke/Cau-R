#Startup----
library(shiny)
library(shinyWidgets)
library(leaflet)

source("startup/start_metal.R")
source("startup/functions_app.R")

#UI----
{
  ui <- fluidPage(
    
    sidebarLayout(
      
      ##Side-Panel----
      {
        sidebarPanel(width = 2, height = 12,
                     
                     noUiSliderInput("range", 
                                     max = max(sites$min),
                                     min = min(sites$max), 
                                     value=c(min(sites$max),max(sites$min)), 
                                     label = "Chronological Range", 
                                     step = 10,
                                     direction = "rtl"),
                     
                     pickerInput("regions",
                                 label = "Regions",
                                 choices = swap(region_id$en),
                                 multiple = TRUE,
                                 selected = unique(ca$region_id),
                                 options = list(
                                   `actions-box` = TRUE)),
                     
                     pickerInput("cultures",
                                 label = "Cultures",
                                 choices = swap(culture_id$en),
                                 multiple = TRUE,
                                 options = list(
                                   `actions-box` = TRUE)),
                     
                     pickerInput("periods",
                                 label = "Periods",
                                 choices = swap(zt_id$en),
                                 multiple = TRUE,
                                 options = list(
                                   `live-search` = TRUE,
                                   `actions-box` = TRUE)),
                     
                     pickerInput("sites",
                                 label = "Sites",
                                 choices = swap(site_id$en),
                                 multiple = TRUE,
                                 options = list(
                                   `live-search` = TRUE,
                                   `actions-box` = TRUE)),
                     
                     
                     pickerInput("mclust",
                                 label = "Cluster",
                                 choices = swap(mclust$en),
                                 multiple = TRUE,
                                 options = list(
                                   `live-search` = TRUE,
                                   `actions-box` = TRUE)),
                     
                     pickerInput("mclust_group",
                                 label = "Cluster-Groups",
                                 choices = swap(mclust_group$en),
                                 multiple = TRUE,
                                 options = list(
                                   `live-search` = TRUE,
                                   `actions-box` = TRUE)),
                     
                     pickerInput("mountains",
                                 label = "Mountain range",
                                 choices = swap(mountain_id$en),
                                 multiple = TRUE,
                                 options = list(
                                   `live-search` = TRUE,
                                   `actions-box` = TRUE)),
                     
                     pickerInput("inputVar",
                                 label = "Variable",
                                 choices = variab),
                     
                     pickerInput("find_character",
                                 label = "Typological Groups",
                                 choices = unique((arrange(ca, find_character)$find_character)),
                                 multiple = TRUE,
                                 options = list(
                                   `actions-box` = TRUE)),
                     map(elements , ~minMaxInput(.x))
                     
        )
      },
  
      #Main Panel----
      {
        mainPanel(width = 10, height = 12,
                navbarPage("Archmetal",
                           ###Map----
                           {
                             tabPanel("Map", leafletOutput("map", width = "100%", height = 900))
                           },
                           
                           ##Scatter-Plots----
                           {
                             navbarMenu("Scatter-Plots",
                                        
                                        tabPanel("Single Plot",
                                                 fluidRow(
                                                   column(12, align = "center",
                                                          plotOutput("c_legend", height = heightLegend)
                                                   )
                                                 ),
                                                 
                                                 fluidRow(
                                                   column(12, align = "center",
                                                          scatterDropdownButton("xc1", "yc1"),
                                                          plotOutput("c1", 
                                                                     height = "100%"
                                                          )
                                                   )
                                                 ),
                                                 designSliders("resols1", "sizes1", 700)
                                                 
                                        ),
                                        
                                        tabPanel("Two Plots",
                                                 
                                                 fluidRow(
                                                   column(12, align = "center",
                                                          plotOutput("f_legend", height = heightLegend))
                                                 ),
                                                 
                                                 fluidRow(
                                                   column(6, align = "center",
                                                          scatterDropdownButton("xf1", "yf1"),
                                                          plotOutput("f1", width = "100%", height = "100%")),
                                                   column(6, align = "center",
                                                          scatterDropdownButton("xf2", "yf2"),
                                                          plotOutput("f2", width = "100%", height = "100%"))
                                                 ),
                                                 
                                                 designSliders("resols2", "sizes2", 700)
                                                 
                                                 
                                        ),
                                        
                                        tabPanel("Four Plots",
                                                 
                                                 fluidRow(
                                                   column(12, align = "center",
                                                          plotOutput("r_legend", height = heightLegend))
                                                 ),
                                                 
                                                 fluidRow(
                                                   column(6, align = "center",
                                                          scatterDropdownButton("xr1", "yr1"),
                                                          plotOutput("r1", width = "100%", height = "100%")),
                                                   column(6, align = "center",
                                                          scatterDropdownButton("xr2", "yr2"),
                                                          plotOutput("r2", width = "100%", height = "100%"))
                                                 ),
                                                 
                                                 fluidRow(
                                                   column(6,  align = "center",
                                                          scatterDropdownButton("xr3", "yr3"),
                                                          plotOutput("r3", width = "100%", height = "100%")),
                                                   column(6,  align = "center",
                                                          scatterDropdownButton("xr4", "yr4"),
                                                          plotOutput("r4", width = "100%", height = "100%"))
                                                 ),
                                                 
                                                 designSliders("resols3", "sizes3", 500)
                                                 
                                                 
                                        )
                                        
                             )
                           },
                           
                           ##Histogramms----
                           {
                             navbarMenu("Histogramms",
                                        
                                        tabPanel("One Plot",
                                                 
                                                 fluidRow(
                                                   column(12,
                                                          histoDropdownButton("bin1.1", "el1.1", "log1.1"),
                                                          plotOutput("hcul1")
                                                   )
                                                 ),
                                                 
                                                 fluidRow(
                                                   column(12,
                                                          plotOutput("hcul_legend", height = heightLegend)
                                                   )
                                                 ),
                                                 
                                                 designSliders("resolh1", "sizeh1", 700)
                                                 
                                        ),
                                        
                                        tabPanel("Two Plots",
                                                 
                                                 fluidRow(
                                                   column(12,
                                                          histoDropdownButton("bin2.1", "el2.1", "log2.1"),
                                                          plotOutput("hfchar1")
                                                   )
                                                 ),
                                                 
                                                 fluidRow(
                                                   column(12,
                                                          histoDropdownButton("bin2.2", "el2.2", "log2.2"),
                                                          plotOutput("hfchar2")
                                                   )
                                                 ),
                                                 
                                                 fluidRow(
                                                   column(12,
                                                          plotOutput("hfchar_legend", height = heightLegend)
                                                   )
                                                 ),
                                                 
                                                 designSliders("resolh2", "sizeh2", 700)
                                                 
                                        ),
                                        
                                        tabPanel("Three Plots",
                                                 
                                                 fluidRow(
                                                   column(12,
                                                          histoDropdownButton("bin3.1", "el3.1", "log3.1"),
                                                          plotOutput("hreg1")
                                                   )
                                                 ),
                                                 
                                                 fluidRow(
                                                   column(12,
                                                          histoDropdownButton("bin3.2", "el3.2", "log3.2"),
                                                          plotOutput("hreg2")
                                                   )
                                                 ),
                                                 fluidRow(
                                                   column(12,
                                                          histoDropdownButton("bin3.3", "el3.3", "log3.3"),
                                                          plotOutput("hreg3")
                                                   )
                                                 ),
                                                 fluidRow(
                                                   column(12,
                                                          plotOutput("hreg_legend", height = heightLegend)
                                                   )
                                                 ),
                                                 designSliders("resolh3", "sizeh3", 700)
                                        )
                                        
                             )
                           },
                           
                           ##Bar-Plots----
                           {
                             navbarMenu("Bar-Plots",
                                        tabPanel("Row-Facet",
                                                 fluidRow(
                                                   column(12, align = "center",
                                                          barDropdownButton("barx", "barrow"),
                                                          plotOutput("bar1", height = "100%"),
                                                          designSliders("resolbar1", "sizebar1", 700)
                                                          ) 
                                                 )
                                                 )
                                        )
                           },
                           
                           ##Pb-Diagramms----
                           {
                             navbarMenu("Pb-Isotope-Diagramms",
                                        tabPanel("Basic Pb-Isotopes",
                                                 fluidRow(
                                                   column(12, align = "center",
                                                          shinydashboard::box(plotOutput("pb_legend", height = heightLegend)))
                                                 ),
                                                 fluidRow(
                                                   column(12,align = "center",
                                                          shinydashboard::box(plotOutput("pbplot"),),
                                                          designSliders("resolpb1", "sizepb1", 700)
                                                          )
                                                 )
                                                 )
                                        )
                           },
                           
                           ##Data----
                           {
                             navbarMenu("Data",
                                        tabPanel("Chemical Analysis",
                                                 dataTableOutput("dataset_ca")),
                                        tabPanel("Sites",
                                                 dataTableOutput("dataset_sites"))
                             )
                           }
                           
                          
                )
        )
      }
    )
  )
}

#Server ----

server <- function(input, output, session) {
  
  #Dataset-Filters----
  {  
    dataset_sites <- reactive(filter(sites, 
                                     (
                                       (min>= input$range[1] & max <= input$range[2]) &
                                         (
                                             (culture_id %in% c(input$cultures)) |
                                             (region_id %in% c(input$regions)) |
                                             (site_id %in% c(input$sites)) |
                                             (zt_id %in% c(input$periods)) 
                                         ) &
                                         (
                                             (Sn1>= input$Sn1 & Sn2 <= input$Sn2) &
                                             (Pb1>= input$Pb1 & Pb2 <= input$Pb2) &
                                             (Zn1>= input$Zn1 & Zn2 <= input$Zn2) &
                                             (Bi1>= input$Bi1 & Bi2 <= input$Bi2) &
                                             (Ag1>= input$Ag1 & Ag2 <= input$Ag2) &
                                             (Sb1>= input$Sb1 & Sb2 <= input$Sb2) &
                                             (As1>= input$As1 & As2 <= input$As2) &
                                             (Fe1>= input$Fe1 & Fe2 <= input$Fe2) &
                                             (Ni1>= input$Ni1 & Ni2 <= input$Ni2) &
                                             (Co1>= input$Co1 & Co2 <= input$Co2) &
                                             (Au1>= input$Au1 & Au2 <= input$Au2)
                                         )
                                     )
                                    )
                            )
    
    dataset_ca  <- reactive(filter(ca, 
                                   (
                                     (min>= input$range[1] & max <= input$range[2]) &
                                       (
                                         (culture_id %in% c(input$cultures)) |
                                           (region_id %in% c(input$regions)) |
                                           (site_id %in% c(input$sites)) |
                                           (find_character %in% c(input$find_character)) |
                                           (zt_id %in% c(input$periods))|
                                           (mclust %in% c(input$mclust)) |
                                           (mclust_group %in% c(input$mclust_group))
                                       ) &
                                       (
                                         (Sn>= input$Sn1 & Sn <= input$Sn2) &
                                           (Pb>= input$Pb1 & Pb <= input$Pb2) &
                                           (Zn>= input$Zn1 & Zn <= input$Zn2) &
                                           (Bi>= input$Bi1 & Bi <= input$Bi2) &
                                           (Ag>= input$Ag1 & Ag <= input$Ag2) &
                                           (Sb>= input$Sb1 & Sb <= input$Sb2) &
                                           (As>= input$As1 & As <= input$As2) &
                                           (Fe>= input$Fe1 & Fe <= input$Fe2) &
                                           (Ni>= input$Ni1 & Ni <= input$Ni2) &
                                           (Co>= input$Co1 & Co <= input$Co2) &
                                           (Au>= input$Au1 & Au <= input$Au2)
                                       )
                                   )
                                  )
                          )
    dataset_pb <- reactive(filter(pb,
                                  (min>= input$range[1] & max <= input$range[2]) &
                                    (
                                      (culture_id %in% c(input$cultures)) |
                                        (region_id %in% c(input$regions)) |
                                        (site_id %in% c(input$sites)) |
                                        (find_character %in% c(input$find_character)) |
                                        (zt_id %in% c(input$periods))|
                                        (mclust %in% c(input$mclust)) |
                                        (mclust_group %in% c(input$mclust_group))
                                    )
                                  )
                           )
    dataset_ore <- reactive(filter(ore,
                                   mountain_id %in% c(input$mountains)
                                   )
                            )
  }
  
  
  #Plot-Reactives----
  {
    ##Scatter-Plots----
    {
      c1 <- reactive({scatter_dlog(dataset_ca(), input$xc1, input$yc1, get(input$inputVar))})
      c_legend <- reactive({cowplot::get_legend(c1())})
      
      f1 <- reactive({scatter_dlog(dataset_ca(), input$xf1, input$yf1, get(input$inputVar))})
      f2 <- reactive({scatter_dlog(dataset_ca(), input$xf2, input$yf2, get(input$inputVar))})
      f_legend <- reactive({cowplot::get_legend(f1())})
      
      r1 <- reactive({scatter_dlog(dataset_ca(), input$xr1, input$yr1, get(input$inputVar))})
      r2 <- reactive({scatter_dlog(dataset_ca(), input$xr2, input$yr2, get(input$inputVar))})
      r3 <- reactive({scatter_dlog(dataset_ca(), input$xr3, input$yr3, get(input$inputVar))})
      r4 <- reactive({scatter_dlog(dataset_ca(), input$xr4, input$yr4, get(input$inputVar))})
      r_legend <- reactive({cowplot::get_legend(r1())})
    }
    
    #Histogramms----
    {
      hcul1 <- reactive({histo(dataset_ca(), input$el1.1, get(input$inputVar), input$bin1.1) + get(input$log1.1)})
      hcul_legend <- reactive({cowplot::get_legend(hcul1())})
      
      hfchar1 <- reactive({histo(dataset_ca(), input$el2.1, get(input$inputVar), input$bin2.1) + get(input$log2.1)})
      hfchar2 <- reactive({histo(dataset_ca(), input$el2.2, get(input$inputVar), input$bin2.2) + get(input$log2.2)})
      hfchar_legend <- reactive({cowplot::get_legend(hfchar1())})
      
      hreg1 <- reactive({histo(dataset_ca(), input$el3.1, get(input$inputVar), input$bin3.1) + get(input$log3.1)})
      hreg2 <- reactive({histo(dataset_ca(), input$el3.2, get(input$inputVar), input$bin3.2) + get(input$log3.2)})
      hreg3 <- reactive({histo(dataset_ca(), input$el3.3, get(input$inputVar), input$bin3.2) + get(input$log3.3)})
      hreg_legend <- reactive({cowplot::get_legend(hreg1())})
    }
    
    #Bar-Plots----
    {
      bar1 <- reactive({bar_facet(dataset_ca(), input$barx, get(input$inputVar), get(input$barrow))})
    }
    
    #Pb-Diagramms----
    {
      pb1 <- reactive({diagramm_pb_207mod(dataset_pb(), get(input$inputVar), dataset_ore(), mountain_id)})
      pb2 <- reactive({diagramm_pb_208mod(dataset_pb(), get(input$inputVar), dataset_ore(), mountain_id)})
      pbplot <- reactive({ggpubr::ggarrange(pb1() + theme(legend.position = "none"), pb2() + theme(legend.position = "none"), 
                                            ncol = 1, nrow = 2, align = "v")
      })
      pb_legend <- reactive({cowplot::get_legend(pb1())})
    }

    

  }
  
  #Plot-Rendering----
  {  
    ##Map----
    {
      output$map <- renderLeaflet({
        leaflet(dataset_sites()) %>%
          addProviderTiles(providers$Esri.WorldShadedRelief,
                           options = providerTileOptions(noWrap = TRUE)) %>%
          addCircleMarkers(fillColor = dataset_sites()$col, color = "black", opacity = 1, fillOpacity = 1, radius = 4, weight = 1)
      })
    }
    #Scatter-Plots----
    {
      observeEvent(c(input$resols1, input$sizes1), 
                   {output$c1 <- renderPlot(expr={c1() + theme(legend.position="none")},
                                            res = input$resols1, height = input$sizes1, width = input$sizes1)})
      observeEvent(input$resols1,{output$c_legend <- renderPlot(grid::grid.draw(c_legend()), res = input$resols1)})
      
      
      observeEvent(c(input$resols2, input$sizes2), 
                   {output$f1 <- renderPlot(expr={f1() + theme(legend.position="none")},
                                            res = input$resols2, height = input$sizes2, width = input$sizes2)})
      observeEvent(c(input$resols2, input$sizes2), 
                   {output$f2 <- renderPlot(expr={f2() + theme(legend.position="none")}, 
                                            res = input$resols2, height = input$sizes2, width = input$sizes2)})
      observeEvent(input$resols2, {output$f_legend <- renderPlot(grid::grid.draw(f_legend()), res = input$resols2)})
      
      
      observeEvent(c(input$resols3, input$sizes3), 
                   {output$r1 <- renderPlot(expr={r1() + theme(legend.position="none")}, 
                                            res = input$resols3, height = input$sizes3, width = input$sizes3)})
      observeEvent(c(input$resols3, input$sizes3), 
                   {output$r2 <- renderPlot(expr={r2() + theme(legend.position="none")},
                                            res = input$resols3, height = input$sizes3, width = input$sizes3)})
      observeEvent(c(input$resols3, input$sizes3), 
                   {output$r3 <- renderPlot(expr={r3() + theme(legend.position="none")}, 
                                            res = input$resols3, height = input$sizes3, width = input$sizes3)})
      observeEvent(c(input$resols3, input$sizes3), 
                   {output$r4 <- renderPlot(expr={r4() + theme(legend.position="none")},
                                            res = input$resols3, height = input$sizes3, width = input$sizes3)})
      observeEvent(input$resols3,{output$r_legend <- renderPlot(grid::grid.draw(r_legend()), res = input$resols3)})
    }
    
    #Histogramms----
    {
      observeEvent(input$resolh1, 
                   {output$hcul1 <- renderPlot(expr={hcul1() + theme(legend.position="none")}, res = input$resolh1)})
      observeEvent(input$resolh1,
                   {output$hcul_legend <- renderPlot(grid::grid.draw(hcul_legend()), res = input$resolh1)})
      
      observeEvent(input$resolh2, 
                   {output$hfchar1 <- renderPlot(expr={hfchar1() + theme(legend.position="none")}, res = input$resolh2)})
      observeEvent(input$resolh2, 
                   {output$hfchar2 <- renderPlot(expr={hfchar2() + theme(legend.position="none")}, res = input$resolh2)})
      observeEvent(input$resolh2,
                   {output$hfchar_legend <- renderPlot(grid::grid.draw(hfchar_legend()), res = input$resolh2)})
      
      observeEvent(input$resolh3, 
                   {output$hreg1 <- renderPlot(expr={hreg1() + theme(legend.position="none")}, res = input$resolh3)})
      observeEvent(input$resolh3, 
                   {output$hreg2 <- renderPlot(expr={hreg2() + theme(legend.position="none")}, res = input$resolh3)})
      observeEvent(input$resolh3, 
                   {output$hreg3 <- renderPlot(expr={hreg3() + theme(legend.position="none")}, res = input$resolh3)})
      observeEvent(input$resolh3,
                   {output$hreg_legend <- renderPlot(grid::grid.draw(hreg_legend()), res = input$resolh3)})
    }
    
    ##Bar-Plot----
    
    observeEvent(input$sizebar1,
      {output$bar1 <- renderPlot(expr={bar1()}, height = input$sizebar1)})
    
    ##Pb-Diagramms----
    {
      observeEvent(c(input$resolpb1, input$sizepb1), 
                   {output$pbplot <- renderPlot(expr={pbplot()},
                                                res = input$resolpb1, height = input$sizepb1, width = input$sizepb1)})
      
      observeEvent(input$resolpb1, {output$pb_legend <- renderPlot(grid::grid.draw(pb_legend()), res = input$resolpb1)})
    }
    #Data----
    {
      output$dataset_ca <- renderDataTable(
        select(dataset_ca(), ca_id, find_id, site, culture, region, find_character, Sn, Pb, Zn, Bi, Ag, Sb, As, Fe, Ni, Co, Au))
      output$dataset_sites <- renderDataTable(
        select(dataset_sites(), site_id, site, culture, zt, region))
    }

  }
}

shinyApp(ui, server)




