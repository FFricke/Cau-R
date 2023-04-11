diagramm_ca <- function(data, x, y, variable)
{
  ggplot(
    data = data, aes(x={{x}}, y={{y}})) +
    geom_point(shape=21,
               aes(fill={{variable}})) +
    scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1) + 
    theme_bw() + 
    guides(fill=guide_legend(title=NULL)) +
    scale_fill_manual(values = c(variable$col), labels = c(variable$en), limits = force)
}

diagramm_ca(data=ca, x = As, y = Ni, variable = region_id)

diagramm_ca(data=filter(ca, culture=="Kura-Arax" | culture=="Maykop"), x = As, y = Ni, variable = region_id)