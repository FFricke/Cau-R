
#Functions----
{
  desginLegend <- function()
  {
    guides(color=guide_legend(title=NULL, nrow=3, byrow=TRUE), shape=guide_legend(title=NULL, nrow=3, byrow=TRUE), fill=guide_legend(title=NULL, nrow=3, byrow=TRUE))
  }
  
##Basic Diagramms----
  {
    scatter <- function(data, x, y, var)
    {
      ggplot(
        data = data, aes(x = .data[[x]], y = .data[[y]])) +
        geom_point(
          aes(color={{var}}, shape={{var}})) +
        coord_fixed(ratio = 1) + 
        theme_bw() +
        theme(legend.position = "top", legend.direction = "horizontal") +
        desginLegend() +
        scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
        scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force)
    }
    
    scatter_dlog <- function(data, x, y, var)
    {
      ggplot(
        data = data, aes(x = .data[[x]], y = .data[[y]])) +
        geom_point(
          aes(color={{var}}, shape={{var}})) +
        coord_fixed(ratio = 1) + 
        theme_bw() +
        theme(legend.position = "top", legend.direction = "horizontal") +
        desginLegend() +
        scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
        scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force) +
        scale_x_log10() + scale_y_log10()
    }
    
    histo <- function(data, x, var, bin)
    {
      ggplot(
        data = data, aes(x = .data[[x]])) +
        geom_histogram(binwidth = bin,
                       aes(fill={{var}})) + 
        theme_bw() +
        theme(legend.position = "bottom", legend.direction = "horizontal") +
        desginLegend() +
        scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
    }
    
    histo_log <- function(data, x, var, bin)
    {
      ggplot(
        data = data, aes(x = .data[[x]])) +
        geom_histogram(binwidth = bin,
                       aes(fill={{var}})) +
        scale_x_log10() + 
        theme_bw() +
        theme(legend.position = "none") +
        desginLegend() +
        scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
    }
    
    histo_log_fac <- function(data, x, var, bin, fac)
    {
      ggplot(
        data = data, aes(x = .data[[x]])) +
        geom_histogram(binwidth = bin,
                       aes(fill={{var}})) +
        scale_x_log10() + 
        theme_bw() +
        theme(legend.position = "none") +
        desginLegend() +
        scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force) +
        facet_grid(rows = vars({{fac}}), scales = "free", labeller = labeller(.rows = c(fac$en)))
    }
    
    histo_fac <- function(data, x, var, bin, fac)
    {
      ggplot(
        data = data, aes(x = .data[[x]])) +
        geom_histogram(binwidth = bin,
                       aes(fill={{var}})) +
        theme_bw() +
        theme(legend.position = "none") +
        desginLegend() +
        scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force) +
        facet_grid(rows = vars({{fac}}), scales = "free", labeller = labeller(.rows = c(fac$en)))
    }
    
    box_log <- function(data, x, var)
    {
      ggplot(
        data = data, aes(x = .data[[x]])) +
        geom_boxplot(
          aes(fill={{var}})) +
        scale_x_log10() + 
        theme_bw() +
        guides(fill=guide_legend(title=NULL))+
        scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
    }
    
    box <- function(data, x, var)
    {
      ggplot(
        data = data, aes(x = .data[[x]])) +
        geom_boxplot(
          aes(fill={{var}})) +
        theme_bw() +
        guides(fill=guide_legend(title=NULL))+
        scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
    }
    
    bar <- function(data, x, var)
    {
      ggplot(
        data = data, aes(.data[[x]])) +
        geom_bar(aes(fill={{var}})) + 
        theme_bw() +
        theme(legend.position = "none", strip.text.y = element_text(angle = 0)) +
        desginLegend() +
        scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force) + 
        scale_x_discrete(labels = c(var$en))
    }
    
    bar_facet <- function(data, x, var, fac)
    {
      ggplot(
        data = data, aes(.data[[x]])) +
        geom_bar(aes(fill={{var}})) + 
        theme_bw() +
        theme(legend.position = "none", strip.text.y = element_text(angle = 0)) +
        desginLegend() +
        scale_fill_manual(values = c(var$col), limits = force) + 
        scale_x_discrete(labels = c(get(x)$en)) +
        facet_grid(rows = vars({{fac}}), scales = "free", labeller = labeller(.rows = c(fac$en)))
    }
    
    ##Pb-isotope-diagramms----
    {
      diagramm_pb_207 <- function(data, var)
      {
        ggplot(data=data,  aes(x=pb206_204, y=pb207_204)) +
          geom_point(
            aes(color={{var}}, shape={{var}})) +
          coord_fixed(ratio = 1) +
          xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[207],Pb[204]))) + 
          theme_bw() +
          desginLegend() +
          scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
          scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force)
      }
      
      diagramm_pb_208 <- function(data, var)
      {
        ggplot(data=data, aes(x=pb206_204, y=pb208_204)) +
          geom_point(
            aes(color={{var}}, shape={{var}})) +
          coord_fixed(ratio = 1) +
          xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[208],Pb[204]))) + 
          theme_bw() + 
          desginLegend() +
          scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
          scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force)
      }
    }
    
    ##Pb-isotope-diagramms----
    {
      diagramm_pb_207mod <- function(dataPb, varPb, dataOre, varOre)
      {
          ggplot(data=NULL,  aes(x=pb206_204, y=pb207_204)) +
          stat_bin_hex(data = dataOre,
                       aes(fill={{varOre}})) +
          scale_fill_manual(values = c(varOre$col), labels = c(varOre$en), limits = force) +
          new_scale_fill() +
            geom_point(data = dataPb,
              aes(fill={{varPb}}, shape={{varPb}})) +
          scale_fill_manual(values = c(varPb$col), labels = c(varPb$en), limits = force) +
          scale_shape_manual(values = c(varPb$shape), labels = c(varPb$en), limits = force) +
            xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[207],Pb[204]))) + 
            theme_bw() +
            theme(axis.text.x = element_blank(),
                  axis.ticks.x = element_blank(),
                  axis.title.x = element_blank(),
                  plot.margin = unit(c(5.5, 5.5, 0, 5.5), "pt")
                  ) +
          coord_fixed(ratio = 1) + 
            desginLegend()
      }
      
      diagramm_pb_208mod <- function(dataPb, varPb, dataOre, varOre)
      {
        ggplot(data=NULL,  aes(x=pb206_204, y=pb208_204)) +
          stat_bin_hex(data = dataOre,
                       aes(fill={{varOre}})) +
          scale_fill_manual(values = c(varOre$col), labels = c(varOre$en), limits = force) +
          new_scale_fill() +
          geom_point(data = dataPb,
                     aes(fill={{varPb}}, shape={{varPb}})) +
          scale_fill_manual(values = c(varPb$col), labels = c(varPb$en), limits = force) +
          scale_shape_manual(values = c(varPb$shape), labels = c(varPb$en), limits = force) +
          xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[207],Pb[204]))) + 
          theme_bw() +
          theme(plot.margin = unit(c(5.5, 5.5, 0, 5.5), "pt")) +
          coord_fixed(ratio = 1) + 
          desginLegend()
      }
    }
    
    
    ##Admixture-diagramm----
    {
      ##1/Pb-isotope-diagramm----
      
      diagramm_1_pb_206 <- function(data, x, var)
      {
        ggplot(
          data = data, aes(x=1/{{x}}, y=pb206_204)) +
          geom_point(
            aes(color={{var}}, shape={{var}})) +
          scale_x_log10() +
          ylab(expression(frac(Pb[206],Pb[204]))) + 
          theme_bw() +
          desginLegend() +
          scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
          scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force)
      }
      
      diagramm_1_pb_207 <- function(data, x, var)
      {
        ggplot(
          data = data, aes(x=1/{{x}}, y=pb207_204)) +
          geom_point(
            aes(color={{var}}, shape={{var}})) +
          scale_x_log10() +
          ylab(expression(frac(Pb[207],Pb[204]))) + 
          theme_bw() +
          desginLegend() +
          scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
          scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force)
      }
      
      diagramm_1_pb_208 <- function(data, x, var)
      {
        ggplot(
          data = data, aes(x=1/{{x}}, y=pb208_204)) +
          geom_point(
            aes(color={{var}}, shape={{var}})) +
          scale_x_log10() +
          ylab(expression(frac(Pb[208],Pb[204]))) + 
          theme_bw() +
          desginLegend() +
          scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
          scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force)
      }
      
      ##x/Pb-isotope-diagramms----
      
      diagramm_el_pb_206 <- function(data, x, var)
      {
        ggplot(
          data = data, aes(x={{x}}/Pb, y=pb206_204)) +
          geom_point(size = 2,
                     aes(color={{var}}, shape={{var}}, shape={{var}})) +
          scale_x_log10() +
          ylab(expression(frac(Pb[206],Pb[204]))) + 
          theme_bw() +
          desginLegend() +
          scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
          scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force)
      }
      
      diagramm_el_pb_207 <- function(data, x, var)
      {
        ggplot(
          data = data, aes(x={{x}}/Pb, y=pb207_204)) +
          geom_point(size = 2,
                     aes(color={{var}}, shape={{var}})) +
          scale_x_log10() +
          ylab(expression(frac(Pb[207],Pb[204]))) + 
          theme_bw() +
          desginLegend() +
          scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
          scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force)
      }
      
      diagramm_el_pb_208 <- function(data, x, var)
      {
        ggplot(
          data = data, aes(x={{x}}/Pb, y=pb208_204)) +
          geom_point(size = 2,
                     aes(color={{var}}, shape={{var}})) +
          scale_x_log10() +
          ylab(expression(frac(Pb[208],Pb[204]))) + 
          theme_bw() +
          desginLegend() +
          scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
          scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force)
      }
    }
    
    
    
    }

  ##UI-elements ----
  {
    histoDropdownButton <- function(inputId1, inputId2, inputId3)
    {dropdownButton(
      
      noUiSliderInput(inputId1,
                      max = 1,
                      min = 0.1,
                      value = 0.1,
                      step = 0.1,
                      label = "Diagramm Binwidth"),
      
      selectInput(inputId2,
                  label = "Element",
                  choices = names(ca[elements])
      ),
      selectInput(inputId3,
                  label = "Scale",
                  choices = c(
                    "normal" = "contx",
                    "logarithmic" = "logx"
                  )
      ),
      circle = TRUE, 
      width = "300px",
      size = "sm",
      
      tooltip = tooltipOptions(title = "Click to see inputs !")
    )}
    
    scatterDropdownButton <- function(inputIdx, inputIdy)
    {dropdownButton(
      
      selectInput(inputIdx,
                  label = "Element",
                  choices = names(ca[elements])
      ),
      
      selectInput(inputIdy,
                  label = "Element",
                  choices = names(ca[elements])
      ),
      
      circle = TRUE, 
      width = "300px",
      size = "sm",
      
      tooltip = tooltipOptions(title = "Click to see inputs !")
    )}
    
    barDropdownButton <- function(inputIdx, inputIdy)
    {dropdownButton(
      
      selectInput(inputIdx,
                  label = "x-Axis",
                  choices = variab
      ),
      
      selectInput(inputIdy,
                  label = "Rows",
                  choices = variab
      ),
      
      circle = TRUE, 
      width = "300px",
      size = "sm",
      
      tooltip = tooltipOptions(title = "Click to see inputs !")
    )}
    
    
    
    designSliders <- function(inputId1, inputId2, number)
    {
      fluidRow(
        column(6,
               noUiSliderInput(inputId1,
                               max = 250,
                               min = 35,
                               value = 100,
                               step = 5,
                               label = "Diagramm Resulution")
        ),
        column(6,
               noUiSliderInput(inputId2,
                               max = 1000,
                               min = 200,
                               value = number,
                               step = 10,
                               label = "Diagramm Size")
        )
      )
    }
    
    elementSlider <- function(InputId)
    {
      sliderTextInput(InputId,
                      choices = c(0.001, 0.01, 0.1, 1, 10, 100),
                      label = InputId,
                      grid = TRUE,
                      selected = c(0.001, 100))
    }
    swap <- function(data)
    {
      setNames(names(data),data)
    }
    
    minMaxInput <- function(inputId)
    {
      splitLayout(cellWidths = c("10%", "45%", "45%"), print(inputId), numericInput(paste0(inputId, 1), label=NULL, value = 0.001), numericInput(paste0(inputId, 2), label=NULL, value = 100))
      
    }
    
  }
  

}
