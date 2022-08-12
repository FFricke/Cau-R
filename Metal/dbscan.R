dbscan::kNNdistplot(ca[, c("sdlogAs", "sdlogNi", "sdlogSb", "sdlogAg", "sdlogPb")], k=8)
abline(h = 0.95, lty= 2)

db <-  dbscan(ca[, c("sdlogAs", "sdlogNi", "sdlogSb", "sdlogAg", "sdlogPb")], eps = 0.25, minPts =10)
ca$mclust <- db$cluster
ca$mclust <- as.factor(ca$mclust)


scat_1 <- scatter_dlog(ca, "As", "Sb", mclust)
scat_2 <- scatter_dlog(ca, "As", "Ni", mclust)
scat_3 <- scatter_dlog(ca, "Sb", "Ni", mclust)
scat_4 <- scatter_dlog(ca, "Ag", "Bi", mclust)
scat <- list(scat_1, scat_2, scat_3, scat_4)
plot_grid(plotlist = scat)


