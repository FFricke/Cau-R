#Definition explorativer Variablen ----
leg_expl <- c("As", "Sb", "Ni")
te_expl <- c("As", "Sb", "Ni", "Ag")

#Cluster Legierungen ----
##Boxplots##
leg_box <- map(leg_expl, ~(box(ca, .x, clust_leg) + xlim(0, 10)))
plot_grid(plotlist = leg_box)

##Histogramme##
leg_histo_log <- map(te_expl, ~(histo_log(ca, .x, clust_leg, 0.05) + facet_grid(rows = vars(clust_leg))))
plot_grid(plotlist = leg_histo_log)

leg_histo <- map(te_expl, ~(histo(ca, .x, clust_leg, 0.05) + facet_grid(rows = vars(clust_leg))))
plot_grid(plotlist = leg_histo)

##Scatterplots##
scat_leg_1 <- scatter_dlog(ca, "As", "Sb", clust_leg)
scat_leg_2 <- scatter_dlog(ca, "As", "Ni", clust_leg)
scat_leg_3 <- scatter_dlog(ca, "Ag", "Bi", clust_leg)
scat_leg_4 <- scatter_dlog(ca, "Ag", "Ni", clust_leg)
scat_leg <- list(scat_leg_1, scat_leg_2, scat_leg_3, scat_leg_4)
plot_grid(plotlist= scat_leg)

#Cluster 1 ----
##Boxplots##
box_cl_1 <- map(te_expl, ~box_log(clust_1, .x, clust_te))
plot_grid(plotlist = box_cl_1)

##Histogramme##
histo_cl_1 <- map(te_expl, ~(histo_log(clust_1, .x, clust_te, 0.125) + facet_grid(rows = vars(clust_te))))
plot_grid(plotlist = histo_cl_1)
##Scatter-Plots##
scat_cl_1_1 <- scatter_dlog(clust_1, "As", "Sb", clust_te)
scat_cl_1_2 <- scatter_dlog(clust_1, "As", "Ni", clust_te)
scat_cl_1_3 <- scatter_dlog(clust_1, "Ag", "Bi", clust_te)
scat_cl_1_4 <- scatter_dlog(clust_1, "Ag", "Ni", clust_te)
scat_cl_1 <- list(scat_cl_1_1, scat_cl_1_2, scat_cl_1_3, scat_cl_1_4)
plot_grid(plotlist= scat_cl_1)

#Cluster 2 ----
##Boxplots##
box_cl_2 <- map(te_expl, ~box_log(clust_2, .x, clust_te))
plot_grid(plotlist = box_cl_2)

##Histogramme##
histo_cl_2 <- map(te_expl, ~(histo_log(clust_2, .x, clust_te, 0.125) + facet_grid(rows = vars(clust_te))))
plot_grid(plotlist = histo_cl_2)

##Scatter-Plots##
scat_cl_2_1 <- scatter(clust_2, "As", "Sb", clust_te)
scat_cl_2_2 <- scatter_dlog(clust_2, "Sb", "Ni", clust_te)
scat_cl_2_3 <- scatter_dlog(clust_2, "Ni", "Bi", clust_te)
scat_cl_2_4 <- scatter_dlog(clust_2, "Bi", "Ag", clust_te)
scat_cl_2 <- list(scat_cl_2_1, scat_cl_2_2, scat_cl_2_3, scat_cl_2_4)
plot_grid(plotlist= scat_cl_2)

#Cluster 3 ----
box_cl_3 <- map(te_expl, ~box_log(clust_3, .x, clust_te))
plot_grid(plotlist = box_cl_3)

##Histogramme##
histo_cl_3 <- map(te_expl, ~(histo_log(clust_3, .x, clust_te, 0.125) + facet_grid(rows = vars(clust_te))))
plot_grid(plotlist = histo_cl_3)

##Scatter-Plots##
scat_cl_3_1 <- scatter_dlog(clust_3, "As", "Sb", clust_te)
scat_cl_3_2 <- scatter_dlog(clust_3, "Sb", "Ni", clust_te)
scat_cl_3_3 <- scatter_dlog(clust_3, "Ni", "Bi", clust_te)
scat_cl_3_4 <- scatter_dlog(clust_3, "Bi", "Ag", clust_te)
scat_cl_3 <- list(scat_cl_3_1, scat_cl_3_2, scat_cl_3_3, scat_cl_3_4)
plot_grid(plotlist= scat_cl_3)

#Cluster 4 ----
box_cl_4 <- map(te_expl, ~box_log(clust_4, .x, clust_te))
plot_grid(plotlist = box_cl_4)

##Histogramme##
histo_cl_4 <- map(te_expl, ~(histo_log(clust_4, .x, clust_te, 0.125) + facet_grid(rows = vars(clust_te))))
plot_grid(plotlist = histo_cl_4)

##Scatter-Plots##
scat_cl_4_1 <- scatter_dlog(clust_4, "As", "Sb", clust_te)
scat_cl_4_2 <- scatter_dlog(clust_4, "Sb", "Ni", clust_te)
scat_cl_4_3 <- scatter_dlog(clust_4, "Ni", "Bi", clust_te)
scat_cl_4_4 <- scatter_dlog(clust_4, "Bi", "Ag", clust_te)
scat_cl_4 <- list(scat_cl_4_1, scat_cl_4_2, scat_cl_4_3, scat_cl_4_4)
plot_grid(plotlist= scat_cl_4)

#Cluster 5 ----
box_cl_5 <- map(te_expl, ~box_log(clust_5, .x, clust_te))
plot_grid(plotlist = box_cl_5)

##Histogramme##
histo_cl_5 <- map(te_expl, ~(histo_log(clust_5, .x, clust_te, 0.125) + facet_grid(rows = vars(clust_te))))
plot_grid(plotlist = histo_cl_5)

##Scatter-Plots##
scat_cl_5_1 <- scatter_dlog(clust_5, "As", "Sb", clust_te)
scat_cl_5_2 <- scatter_dlog(clust_5, "Sb", "Ni", clust_te)
scat_cl_5_3 <- scatter_dlog(clust_5, "Ni", "Bi", clust_te)
scat_cl_5_4 <- scatter_dlog(clust_5, "Bi", "Ag", clust_te)
scat_cl_5 <- list(scat_cl_5_1, scat_cl_5_2, scat_cl_5_3, scat_cl_5_4)
plot_grid(plotlist= scat_cl_5)