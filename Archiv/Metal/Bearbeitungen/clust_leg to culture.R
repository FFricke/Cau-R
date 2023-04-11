expl_cult <- unique(ca$culture_id)

plots_cult <- map(expl_cult, ~bar(filter(ca, culture_id==.x), "clust_leg", culture_id)) 
plot_grid(plotlist = plots_cult)


plot_cult_1 <- map(expl_cult, ~bar(filter(ca, clust_leg=="1", culture_id==.x), "clust_e", culture_id)) 
plot_grid(plotlist = plot_cult_1)

plot_cult_2 <- map(expl_cult, ~bar(filter(ca, clust_leg=="2", culture_id==.x), "clust_e", culture_id)) 
plot_grid(plotlist = plot_cult_2)

plot_cult_3 <- map(unique(filter(ca, clust_leg=="3")$culture_id), ~bar(filter(ca, clust_leg=="3", culture_id==.x), "clust_e", culture_id)) 
plot_grid(plotlist = plot_cult_3)

plot_cult_4 <- map(unique(filter(ca, clust_leg=="4")$culture_id), ~bar(filter(ca, clust_leg=="4", culture_id==.x), "clust_e", culture_id)) 
plot_grid(plotlist = plot_cult_4)

plot_cult_5 <- map(unique(filter(ca, clust_leg=="5")$culture_id), ~bar(filter(ca, clust_leg=="5", culture_id==.x), "clust_e", culture_id)) 
plot_grid(plotlist = plot_cult_5)

