##Grundcluster----
ca$sdAs <- ca$As/sd(ca$As)
ca$sdNi <- ca$Ni/sd(ca$Ni)
ca$sdSb <- ca$Sb/sd(ca$Sb)

hk <- hkmeans(ca[, c("sdlogAs", "sdlogNi", "sdlogSb")], 2,
              hc.metric = "euclidean", hc.method = "ward.D2")

ca$mclust <- hk$cluster
ca$mclust <- as.factor(ca$mclust)

scat_1 <- scatter_dlog(ca, "As", "Sb", mclust)
scat_2 <- scatter_dlog(ca, "As", "Ni", mclust)
scat_3 <- scatter_dlog(ca, "Sb", "Ni", mclust)
scat_4 <- scatter_dlog(ca, "Ag", "Bi", mclust)
scat <- list(scat_1, scat_2, scat_3, scat_4)
plot_grid(plotlist = scat)


##1. Subcluster----

ca.1 <- filter(ca, mclust=="1")
ca.1$sdlogAs <- log10(ca.1$As)/sd(log10(ca.1$As))
ca.1$sdlogSb <- log10(ca.1$Sb)/sd(log10(ca.1$Sb))
ca.1$sdlogNi <- log10(ca.1$Ni)/sd(log10(ca.1$Ni))
ca.1$sdlogAg <- log10(ca.1$Ag)/sd(log10(ca.1$Ag))
ca.1$sdlogBi <- log10(ca.1$Bi)/sd(log10(ca.1$Bi))
ca.1$sdlogZn <- log10(ca.1$Zn)/sd(log10(ca.1$Zn))
ca.1$sdlogPb <- log10(ca.1$Pb)/sd(log10(ca.1$Pb))
ca.1$logAs <- log10(ca.1$As)
ca.1$logSb <- log10(ca.1$Sb)
ca.1$logNi <- log10(ca.1$Ni)
ca.1$logAg <- log10(ca.1$Ag)
ca.1$logBi <- log10(ca.1$Bi)
ca.1$sdAs <- ca.1$As/sd(ca.1$As)
ca.1$sdNi <- ca.1$Ni/sd(ca.1$Ni)
ca.1$sdSb <- ca.1$Sb/sd(ca.1$Sb)

hk.1 <- hkmeans(ca.1[, c("sdNi", "sdSb")], 4,
                hc.metric = "euclidean", hc.method = "ward.D")


ca.1$mclust <- hk.1$cluster
ca.1$mclust <- as.factor(ca.1$mclust)

scat_1 <- scatter_dlog(ca.1, "As", "Sb", mclust)
scat_2 <- scatter_dlog(ca.1, "As", "Ni", mclust)
scat_3 <- scatter_dlog(ca.1, "Sb", "Ni", mclust)
scat_4 <- scatter_dlog(ca.1, "Ag", "Bi", mclust)
scat <- list(scat_1, scat_2, scat_3, scat_4)
plot_grid(plotlist = scat)


##2. Subcluster----

ca.2 <- filter(ca.1, mclust=="1")
ca.2$sdlogAs <- log10(ca.2$As)/sd(log10(ca.2$As))
ca.2$sdlogSb <- log10(ca.2$Sb)/sd(log10(ca.2$Sb))
ca.2$sdlogNi <- log10(ca.2$Ni)/sd(log10(ca.2$Ni))
ca.2$sdlogAg <- log10(ca.2$Ag)/sd(log10(ca.2$Ag))
ca.2$sdlogBi <- log10(ca.2$Bi)/sd(log10(ca.2$Bi))
ca.2$sdlogZn <- log10(ca.2$Zn)/sd(log10(ca.2$Zn))
ca.2$sdlogPb <- log10(ca.2$Pb)/sd(log10(ca.2$Pb))
ca.2$logAs <- log10(ca.2$As)
ca.2$logSb <- log10(ca.2$Sb)
ca.2$logNi <- log10(ca.2$Ni)
ca.2$logAg <- log10(ca.2$Ag)
ca.2$logBi <- log10(ca.2$Bi)

hc.2 <- HCPC(ca.2[, c("sdAs", "sdlogNi", "sdlogSb", "sdlogAg", "sdlogPb")], nb.clust = 3, max=NULL, graph = TRUE, method = "ward")

ca.2$mclust <- hc.2$data.clust$clust
ca.2$mclust <- as.factor(ca.2$mclust)

scat_1 <- scatter_dlog(ca.2, "As", "Sb", mclust)
scat_2 <- scatter_dlog(ca.2, "As", "Ni", mclust)
scat_3 <- scatter_dlog(ca.2, "Bi", "Ni", mclust)
scat_4 <- scatter_dlog(ca.2, "Ag", "Pb", mclust)
scat <- list(scat_1, scat_2, scat_3, scat_4)
plot_grid(plotlist = scat)

##3.2 Cluster ----

ca.3.2 <- filter(ca.2, mclust=="2")
ca.3.2$sdlogAs <- log10(ca.3.2$As)/sd(log10(ca.3.2$As))
ca.3.2$sdlogSb <- log10(ca.3.2$Sb)/sd(log10(ca.3.2$Sb))
ca.3.2$sdlogNi <- log10(ca.3.2$Ni)/sd(log10(ca.3.2$Ni))
ca.3.2$sdlogAg <- log10(ca.3.2$Ag)/sd(log10(ca.3.2$Ag))
ca.3.2$sdlogBi <- log10(ca.3.2$Bi)/sd(log10(ca.3.2$Bi))
ca.3.2$sdlogZn <- log10(ca.3.2$Zn)/sd(log10(ca.3.2$Zn))
ca.3.2$sdlogPb <- log10(ca.3.2$Pb)/sd(log10(ca.3.2$Pb))
ca.3.2$logAs <- log10(ca.3.2$As)
ca.3.2$logSb <- log10(ca.3.2$Sb)
ca.3.2$logNi <- log10(ca.3.2$Ni)
ca.3.2$logAg <- log10(ca.3.2$Ag)
ca.3.2$logBi <- log10(ca.3.2$Bi)

hc.3.2 <- HCPC(ca.3.2[, c("sdlogAs", "sdlogSb", "sdlogAg", "sdlogPb")], nb.clust = 3, max=NULL, graph = TRUE, method = "ward")


ca.3.2$mclust <- hc.3.2$data.clust$clust
ca.3.2$mclust <- as.factor(ca.3.2$mclust)

scat_1 <- scatter_dlog(ca.3.2, "Ag", "Pb", mclust)
scat_2 <- scatter_dlog(ca.3.2, "As", "Sb", mclust)
scat_3 <- scatter_dlog(ca.3.2, "As", "Ni", mclust)
scat_4 <- scatter_dlog(ca.3.2, "Ag", "Bi", mclust)
scat <- list(scat_1, scat_2, scat_3, scat_4)
plot_grid(plotlist = scat)


##3.3 Cluster ----

ca.3.3 <- filter(ca.2, mclust=="3")
ca.3.3$sdlogAs <- log10(ca.3.3$As)/sd(log10(ca.3.3$As))
ca.3.3$sdlogSb <- log10(ca.3.3$Sb)/sd(log10(ca.3.3$Sb))
ca.3.3$sdlogNi <- log10(ca.3.3$Ni)/sd(log10(ca.3.3$Ni))
ca.3.3$sdlogAg <- log10(ca.3.3$Ag)/sd(log10(ca.3.3$Ag))
ca.3.3$sdlogBi <- log10(ca.3.3$Bi)/sd(log10(ca.3.3$Bi))
ca.3.3$sdlogZn <- log10(ca.3.3$Zn)/sd(log10(ca.3.3$Zn))
ca.3.3$sdlogPb <- log10(ca.3.3$Pb)/sd(log10(ca.3.3$Pb))
ca.3.3$logAs <- log10(ca.3.3$As)
ca.3.3$logSb <- log10(ca.3.3$Sb)
ca.3.3$logNi <- log10(ca.3.3$Ni)
ca.3.3$logAg <- log10(ca.3.3$Ag)
ca.3.3$logBi <- log10(ca.3.3$Bi)

hc.3.3 <- HCPC(ca.3.3[, c("sdlogAs", "sdlogSb", "sdlogAg", "sdlogPb")], nb.clust = 3, max=NULL, graph = TRUE, method = "ward")


ca.3.3$mclust <- hc.3.3$data.clust$clust
ca.3.3$mclust <- as.factor(ca.3.3$mclust)

scat_1 <- scatter_dlog(ca.3.3, "Ag", "Pb", mclust)
scat_2 <- scatter_dlog(ca.3.3, "As", "Sb", mclust)
scat_3 <- scatter_dlog(ca.3.3, "Sb", "Ni", mclust)
scat_4 <- scatter_dlog(ca.3.3, "Ag", "Bi", mclust)
scat <- list(scat_1, scat_2, scat_3, scat_4)
plot_grid(plotlist = scat)


##5.1 Cluster ----
ca.5.1 <- filter(ca.2, mclust=="1")
ca.5.1$sdlogAs <- log10(ca.5.1$As)/sd(log10(ca.5.1$As))
ca.5.1$sdlogSb <- log10(ca.5.1$Sb)/sd(log10(ca.5.1$Sb))
ca.5.1$sdlogNi <- log10(ca.5.1$Ni)/sd(log10(ca.5.1$Ni))
ca.5.1$sdlogAg <- log10(ca.5.1$Ag)/sd(log10(ca.5.1$Ag))
ca.5.1$sdlogBi <- log10(ca.5.1$Bi)/sd(log10(ca.5.1$Bi))
ca.5.1$sdlogZn <- log10(ca.5.1$Zn)/sd(log10(ca.5.1$Zn))
ca.5.1$sdlogPb <- log10(ca.5.1$Pb)/sd(log10(ca.5.1$Pb))
ca.5.1$logAs <- log10(ca.5.1$As)
ca.5.1$logSb <- log10(ca.5.1$Sb)
ca.5.1$logNi <- log10(ca.5.1$Ni)
ca.5.1$logAg <- log10(ca.5.1$Ag)
ca.5.1$logBi <- log10(ca.5.1$Bi)

hc.5.1 <- HCPC(ca.5.1[, c("sdlogAs", "sdlogSb", "sdlogPb", "sdlogAg", "sdlogNi")], nb.clust = 4, max=NULL, graph = TRUE, method = "ward")


ca.5.1$mclust <- hc.5.1$data.clust$clust
ca.5.1$mclust <- as.factor(ca.5.1$mclust)

scat_1 <- scatter_dlog(ca.5.1, "Ag", "Pb", mclust)
scat_2 <- scatter_dlog(ca.5.1, "As", "Sb", mclust)
scat_3 <- scatter_dlog(ca.5.1, "Sb", "Ni", mclust)
scat_4 <- scatter_dlog(ca.5.1, "As", "Ni", mclust)
scat <- list(scat_1, scat_2, scat_3, scat_4)
plot_grid(plotlist = scat)

##Export für Datenbank ----

hclust_1 <- filter(ca, mclust=="2")
hclust_1$mclust <- 1

hclust_2 <- filter(ca.1, mclust=="2")
hclust_3 <- filter(ca.1, mclust=="3")
hclust_4 <- filter(ca.1, mclust=="4")

hclust_6 <- filter(ca.3.2, mclust=="1")
hclust_6$mclust <- 6
hclust_7 <- filter(ca.3.2, mclust=="2")
hclust_7$mclust <- 7
hclust_8 <- filter(ca.3.2, mclust=="3")
hclust_8$mclust <- 8

hclust_9 <- filter(ca.3.3, mclust=="1")
hclust_9$mclust <- 9
hclust_10 <- filter(ca.3.3, mclust=="2")
hclust_10$mclust <- 10
hclust_11 <- filter(ca.3.3, mclust=="3")
hclust_11$mclust <- 11

hclust_12 <- filter(ca.5.1, mclust=="1")
hclust_12$mclust <- 12
hclust_13 <- filter(ca.5.1, mclust=="2")
hclust_13$mclust <- 13
hclust_14 <- filter(ca.5.1, mclust=="3")
hclust_14$mclust <- 14
hclust_15 <- filter(ca.5.1, mclust=="4")
hclust_15$mclust <- 15

hclust <- rbind(hclust_1, hclust_2, hclust_3, hclust_4, hclust_6, hclust_7, hclust_8, hclust_9, hclust_10, hclust_11, hclust_12, hclust_13, hclust_14, hclust_15)
hclust$mclust <- as.factor(hclust$mclust)

scat_1 <- scatter_dlog(hclust, "Ag", "Pb", mclust)
scat_2 <- scatter_dlog(hclust, "As", "Sb", mclust)
scat_3 <- scatter_dlog(hclust, "Sb", "Ni", mclust)
scat_4 <- scatter_dlog(hclust, "Ag", "Bi", mclust)
scat <- list(scat_1, scat_2, scat_3, scat_4)
plot_grid(plotlist = scat)

write_csv(hclust[, c("ca_id", "part_id", "site_id", "mclust")], file="mclust.csv") 


