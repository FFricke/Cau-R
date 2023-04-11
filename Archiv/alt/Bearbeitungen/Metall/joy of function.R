ca_clust_leg$culture_id <- replace_na(ca_clust_leg$culture_id, "1000")
ca_clust_leg$find_character_id <- replace_na(ca_clust_leg$find_character_id, "1000")

filter_ca <- filter(ca_clust_leg, culture_id!="1000" & culture!="Meshoko")
expl <- unique(filter_ca$culture_id)
expl <- set_names(expl)
As_plots <- map(expl, ~ histo(filter(filter_ca, culture_id==.x), "As", culture_id, 0.5))
plot_grid(plotlist = As_plots)
As_plots <- map(expl, ~ histo_log(filter(filter_ca, culture_id==.x), "As", var = culture_id, 0.25))
plot_grid(plotlist = As_plots)


filter_ca <- filter(ca_clust_leg)
expl <- unique(filter_ca$find_character_id)
expl <- set_names(expl)
all_plots <- map(expl, ~hist_log(filter(filter_ca, find_character_id==.x), "As", var = find_character_id))
plot_grid(plotlist = all_plots)

histo(ca_clust_leg, x="As", var="clust_leg", bin = 0.5)


histo(clust, "As", clust_leg, 0.125) 
histo_log(clust, "Ni", clust_leg, 0.125) 
histo_log(clust, "Sb", clust_leg, 0.125) 
scatter(clust, "As", "Ni", clust_leg)
scatter(clust, "As", "Sb", clust_leg)

clust %>%
  group_by(clust_leg) %>%
summarise(median(As), min(As), max(As), median(Sb), min(Sb), max(Sb),median(Ni), min(Ni), max(Ni))

