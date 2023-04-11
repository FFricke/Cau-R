library(FactoMineR)

diagramm_pb_207(pb, mclust)
diagramm_pb_208(pb, mclust)

scatter(pb, "As", "Sb", culture_id)

grid.arrange(diagramm_pb_207mod(pb, mclust), diagramm_pb_208mod(pb, mclust)) 

diagramm_pb_207208(pb, mclust)

(cowplot::plot_grid(diagramm_pb_207mod(pb, mclust), diagramm_pb_208mod(pb, mclust), align = "v", axis = "l", ncol = 1, scale = 1))

p.1 <- diagramm_pb_207mod(pb, mclust)
p.2 <- diagramm_pb_208mod(pb, mclust)

grid.newpage()
(plot(rbind(ggplotGrob(p.1), ggplotGrob(p.2), size = "last")))

bar(ca, "mclust", mclust) + facet_grid(rows = vars(culture_id), scales = "free", labeller = labeller(culture_id = culture_id$en))

bar(ca, "mclust", mclust) + facet_grid()


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

bar_facet(ca, "mclust", find_character_id, culture_id)


