library(ggplot2)
library(cowplot)
library(FactoMineR)
library(factoextra)
library(NbClust)

##Zinncluster ----

##Datenauswahl##
ca.t <- ca
  
  ##Standartisierung##
  ca.t$sdlogSn <- log10(ca.t$Sn)/sd(log10(ca.t$Sn))
  ca.t$sdlogAs <- log10(ca.t$As)/sd(log10(ca.t$As))
  ca.t$sdlogSb <- log10(ca.t$Sb)/sd(log10(ca.t$Sb))
  ca.t$sdlogNi <- log10(ca.t$Ni)/sd(log10(ca.t$Ni))
  ca.t$sdlogAg <- log10(ca.t$Ag)/sd(log10(ca.t$Ag))
  ca.t$sdlogBi <- log10(ca.t$Bi)/sd(log10(ca.t$Bi))
  ca.t$sdlogZn <- log10(ca.t$Zn)/sd(log10(ca.t$Zn))
  ca.t$sdlogPb <- log10(ca.t$Pb)/sd(log10(ca.t$Pb))
  ca.t$logAs <- log10(ca.t$As)
  ca.t$logSb <- log10(ca.t$Sb)
  ca.t$logNi <- log10(ca.t$Ni)
  ca.t$logAg <- log10(ca.t$Ag)
  ca.t$logBi <- log10(ca.t$Bi)
  ca.t$sdAs <- ca.t$As/sd(ca.t$As)
  ca.t$sdNi <- ca.t$Ni/sd(ca.t$Ni)
  ca.t$sdSb <- ca.t$Sb/sd(ca.t$Sb)

  
##Clusteranalyse##
hk.t <- hkmeans(ca.t[, c("sdlogSn")], 4,
          hc.metric = "euclidean", hc.method = "ward.D2")

  ##Datenexport##
  ca.t$mclust <- hk.t$cluster
  ca.t$mclust <- as.factor(ca.t$mclust)
  

    ##Viualisierung##
    histo_log(ca.t, "Sn", mclust, 0.1)

##Grundcluster----

##Datenauswahl##
ca.0 <- filter(ca.t, mclust!=3)

  ##Standartisierung##
  ca.0$sdlogSn <- log10(ca.0$Sn)/sd(log10(ca.0$Sn))
  ca.0$sdlogAs <- log10(ca.0$As)/sd(log10(ca.0$As))
  ca.0$sdlogSb <- log10(ca.0$Sb)/sd(log10(ca.0$Sb))
  ca.0$sdlogNi <- log10(ca.0$Ni)/sd(log10(ca.0$Ni))
  ca.0$sdlogAg <- log10(ca.0$Ag)/sd(log10(ca.0$Ag))
  ca.0$sdlogBi <- log10(ca.0$Bi)/sd(log10(ca.0$Bi))
  ca.0$sdlogZn <- log10(ca.0$Zn)/sd(log10(ca.0$Zn))
  ca.0$sdlogPb <- log10(ca.0$Pb)/sd(log10(ca.0$Pb))
  ca.0$logAs <- log10(ca.0$As)
  ca.0$logSb <- log10(ca.0$Sb)
  ca.0$logNi <- log10(ca.0$Ni)
  ca.0$logAg <- log10(ca.0$Ag)
  ca.0$logBi <- log10(ca.0$Bi)
  ca.0$sdAs <- ca.0$As/sd(ca.0$As)
  ca.0$sdNi <- ca.0$Ni/sd(ca.0$Ni)
  ca.0$sdSb <- ca.0$Sb/sd(ca.0$Sb)
  
##Clusteranalyse##
hk <- hkmeans(ca.0[, c("sdlogAs", "sdlogNi", "sdlogSb")], 2,
              hc.metric = "euclidean", hc.method = "ward.D2")

  ##Datenexport##
  ca.0$mclust <- hk$cluster
  ca.0$mclust <- as.factor(ca.0$mclust)
  
    ##Visualisierung##
    scat_1 <- scatter_dlog(ca.0, "As", "Sb", mclust)
    scat_2 <- scatter_dlog(ca.0, "As", "Ni", mclust)
    scat_3 <- scatter_dlog(ca.0, "Ag", "Ni", mclust)
    scat_4 <- scatter_dlog(ca.0, "Pb", "Bi", mclust)
    scat <- list(scat_1, scat_2, scat_3, scat_4)
    plot_grid(plotlist = scat)


##1. Subcluster----

##Datenauswahl##
ca.1 <- filter(ca.0, mclust=="1")
    
  ##Standartisierung##    
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

##Clusteranalyse##  
hk.1 <- hkmeans(ca.1[, c("sdNi", "sdSb")], 4,
                hc.metric = "euclidean", hc.method = "ward.D")

  ##Datenexport##
  ca.1$mclust <- hk.1$cluster
  ca.1$mclust <- as.factor(ca.1$mclust)

    ##Visualisierung##
    scat_1 <- scatter_dlog(ca.1, "As", "Sb", mclust)
    scat_2 <- scatter_dlog(ca.1, "As", "Ni", mclust)
    scat_3 <- scatter_dlog(ca.1, "Sb", "Ni", mclust)
    scat_4 <- scatter_dlog(ca.1, "Ag", "Bi", mclust)
    scat <- list(scat_1, scat_2, scat_3, scat_4)
    plot_grid(plotlist = scat)


##2. Subcluster----
    
##Datenauswahl##
ca.2 <- filter(ca.1, mclust=="1")

  ##Standartisierung##
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

##Clusteranalyse##
hc.2 <- HCPC(ca.2[, c("sdAs", "sdlogNi", "sdlogSb", "sdlogAg", "sdlogPb")], 
             nb.clust = 3, max=NULL, graph = TRUE, method = "ward")

  ##Datenexport##
  ca.2$mclust <- hc.2$data.clust$clust
  ca.2$mclust <- as.factor(ca.2$mclust)

    ##Visualisierung##
    scat_1 <- scatter_dlog(ca.2, "As", "Sb", mclust)
    scat_2 <- scatter_dlog(ca.2, "As", "Ni", mclust)
    scat_3 <- scatter_dlog(ca.2, "Bi", "Ni", mclust)
    scat_4 <- scatter_dlog(ca.2, "Ag", "Pb", mclust)
    scat <- list(scat_1, scat_2, scat_3, scat_4)
    plot_grid(plotlist = scat)

##3.2 Cluster ----

##Datenauswahl##
ca.3.2 <- filter(ca.2, mclust=="2")

  ##Standartisierung##
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

##Clusteranalyse##
hc.3.2 <- HCPC(ca.3.2[, c("sdlogAs", "sdlogNi", "sdlogSb", "sdlogAg", "sdlogPb")], 
               nb.clust = 4, max=NULL, graph = TRUE, method = "ward")

  ##Datenexport##
  ca.3.2$mclust <- hc.3.2$data.clust$clust
  ca.3.2$mclust <- as.factor(ca.3.2$mclust)

    ##Visualisierung##
    scat_1 <- scatter_dlog(ca.3.2, "As", "Sb", mclust)
    scat_2 <- scatter_dlog(ca.3.2, "As", "Ni", mclust)
    scat_3 <- scatter_dlog(ca.3.2, "Pb", "Bi", mclust)
    scat_4 <- scatter_dlog(ca.3.2, "Ag", "Ni", mclust)
    scat <- list(scat_1, scat_2, scat_3, scat_4)
    plot_grid(plotlist = scat)


##3.3 Cluster ----
    
##Datenauswal##
ca.3.3 <- filter(ca.2, mclust=="3")

  ##Standartisierung##
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

##Clusteranalyse##  
hc.3.3 <- HCPC(ca.3.3[, c("sdlogAs", "sdlogNi", "sdlogSb", "sdlogAg", "sdlogPb")], 
               nb.clust = 4, max=NULL, graph = TRUE, method = "ward")

  ##Datenexport##
  ca.3.3$mclust <- hc.3.3$data.clust$clust
  ca.3.3$mclust <- as.factor(ca.3.3$mclust)

    ##Visualisierung##  
    scat_1 <- scatter_dlog(ca.3.3, "As", "Sb", mclust)
    scat_2 <- scatter_dlog(ca.3.3, "As", "Ni", mclust)
    scat_3 <- scatter_dlog(ca.3.3, "Pb", "Bi", mclust)
    scat_4 <- scatter_dlog(ca.3.3, "Ag", "Ni", mclust)
    scat <- list(scat_1, scat_2, scat_3, scat_4)
    plot_grid(plotlist = scat)


##5.1 Cluster ----
    
##Datenauswahl##    
ca.5.1 <- filter(ca.2, mclust=="1")

  ##Standartisierung##
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

##Clusteranalyse##  
hc.5.1 <- HCPC(ca.5.1[, c("sdlogAs", "sdlogSb", "sdlogPb", "sdlogAg", "sdlogNi")], 
               nb.clust = 5, max=NULL, graph = TRUE, method = "ward")

  ##Datenexport##
  ca.5.1$mclust <- hc.5.1$data.clust$clust
  ca.5.1$mclust <- as.factor(ca.5.1$mclust)

    ##Visualisierung##
    scat_1 <- scatter_dlog(ca.5.1, "Ag", "Pb", mclust)
    scat_2 <- scatter_dlog(ca.5.1, "As", "Sb", mclust)
    scat_3 <- scatter_dlog(ca.5.1, "Sb", "Ni", mclust)
    scat_4 <- scatter_dlog(ca.5.1, "As", "Ni", mclust)
    scat <- list(scat_1, scat_2, scat_3, scat_4)
    plot_grid(plotlist = scat)

##Export für Datenbank ----

##Datensammlung aus den einzelnen Dataframes##
hclust_t <- filter(ca.t, mclust==3)
hclust_t$mclust <- 18

hclust_1 <- filter(ca.0, mclust=="2")
hclust_1$mclust <- 1

hclust_2 <- filter(ca.1, mclust=="2")
hclust_3 <- filter(ca.1, mclust=="3")
hclust_4 <- filter(ca.1, mclust=="4")

hclust_5 <- filter(ca.3.2, mclust=="1")
hclust_5$mclust <- 5
hclust_6 <- filter(ca.3.2, mclust=="2")
hclust_6$mclust <- 6
hclust_7 <- filter(ca.3.2, mclust=="3")
hclust_7$mclust <- 7
hclust_8 <- filter(ca.3.2, mclust=="4")
hclust_8$mclust <- 8

hclust_9 <- filter(ca.3.3, mclust=="1")
hclust_9$mclust <- 9
hclust_10 <- filter(ca.3.3, mclust=="2")
hclust_10$mclust <- 10
hclust_11 <- filter(ca.3.3, mclust=="3")
hclust_11$mclust <- 11
hclust_12 <- filter(ca.3.3, mclust=="4")
hclust_12$mclust <- 12

hclust_13 <- filter(ca.5.1, mclust=="1")
hclust_13$mclust <- 13
hclust_14 <- filter(ca.5.1, mclust=="2")
hclust_14$mclust <- 14
hclust_15 <- filter(ca.5.1, mclust=="3")
hclust_15$mclust <- 15
hclust_16 <- filter(ca.5.1, mclust=="4")
hclust_16$mclust <- 16
hclust_17 <- filter(ca.5.1, mclust=="5")
hclust_17$mclust <- 17

hclust <- rbind(hclust_t, hclust_1, hclust_2, hclust_3, hclust_4, hclust_5, hclust_6, hclust_7, hclust_8, hclust_9, 
                hclust_10, hclust_11, hclust_12, hclust_13, hclust_14, hclust_15, hclust_16, hclust_17)
hclust$mclust <- as.factor(hclust$mclust)

  ##Visualisierung##
  scat_1 <- scatter_dlog(hclust, "Ag", "Pb", mclust)
  scat_2 <- scatter_dlog(hclust, "As", "Sb", mclust)
  scat_3 <- scatter_dlog(hclust, "Sb", "Ni", mclust)
  scat_4 <- scatter_dlog(hclust, "Ag", "Bi", mclust)
  scat <- list(scat_1, scat_2, scat_3, scat_4)
  plot_grid(plotlist = scat)

##Export in Datenbank##
dbWriteTable(con, "hclust", hclust[, c("ca_id", "part_id", "site_id", "mclust")])
