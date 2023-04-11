expl_ca <- c("As", "Sb", "Ni", "Ag", "Bi", "Zn", "Pb")

expl_ca_2 <- c("Sb", "Ni", "Ag", "Bi", "Zn", "Pb")


histo_al_1 <- map(expl_ca_2, ~(histo_log(clust_al_1, .x, clust_te, 0.125) + facet_grid(rows = vars(clust_te))))
plot_grid(plotlist = histo_al_1)

histo_al_2 <- map(expl_ca_2, ~(histo_log(clust_al_2, .x, clust_te, 0.125) + facet_grid(rows = vars(clust_te))))
plot_grid(plotlist = histo_al_2)

histo_al_3 <- map(expl_ca_2, ~(histo_log(clust_al_3, .x, clust_te, 0.125) + facet_grid(rows = vars(clust_te))))
plot_grid(plotlist = histo_al_3)

histo_al_4 <- map(expl_ca_2, ~(histo_log(clust_al_4, .x, clust_te, 0.125) + facet_grid(rows = vars(clust_te))))
plot_grid(plotlist = histo_al_4)

histo_al_5 <- map(expl_ca_2, ~(histo_log(clust_al_5, .x, clust_te, 0.125) + facet_grid(rows = vars(clust_te))))
plot_grid(plotlist = histo_al_5)


plot_cult_al_1 <- map(expl_cult, ~bar(filter(clust_al, clust_leg=="1", culture_id==.x), "clust_e", culture_id)) 
plot_grid(plotlist = plot_cult_al_1)

plot_cult_al_2 <- map(expl_cult, ~bar(filter(clust_al, clust_leg=="2", culture_id==.x), "clust_e", culture_id)) 
plot_grid(plotlist = plot_cult_al_2)

plot_cult_al_3 <- map(unique(filter(clust_al, clust_leg=="3")$culture_id), ~bar(filter(clust_al, clust_leg=="3", culture_id==.x), "clust_e", culture_id)) 
plot_grid(plotlist = plot_cult_al_3)

plot_cult_al_4 <- map(unique(filter(clust_al, clust_leg=="4")$culture_id), ~bar(filter(clust_al, clust_leg=="4", culture_id==.x), "clust_e", culture_id)) 
plot_grid(plotlist = plot_cult_al_4)

plot_cult_al_5 <- map(unique(filter(clust_al, clust_leg=="5")$culture_id), ~bar(filter(clust_al, clust_leg=="5", culture_id==.x), "clust_e", culture_id)) 
plot_grid(plotlist = plot_cult_al_5)

#Diagramme zu clust_disc ----
ggplot(clust_al_disc, 
       aes(x = Ag, y = Sb, colour=clust_leg)) +
  geom_point() + 
  geom_label_repel(aes(label = clust_e)) +
  scale_x_log10() + scale_y_log10()

ggplot(clust_al_disc, 
       aes(x = Ag, y = Ni, colour=clust_leg)) +
  geom_point() + 
  geom_label_repel(aes(label = clust_e)) +
  scale_x_log10() + scale_y_log10()

ggplot(clust_al_disc, 
       aes(x = Sb, y = Ni, colour=clust_leg)) +
  geom_point() + 
  geom_label_repel(aes(label = clust_e)) +
  scale_x_log10() + scale_y_log10()
