#Clusteranalyse nach Legierungen##
##Clusteranalyse nach Legierungen Vorbereitung ----
ca$sd_As <- ca$As/sd(ca$As)
ca$sd_Sb <- ca$Sb/sd(ca$Sb)
ca$sd_Ni <- ca$Ni/sd(ca$Ni)

##Clusteranalyse nach Legierungen ----
dist_ca_clust_leg <- dist(ca[, c("sd_As", "sd_Sb", "sd_Ni")], method = "euclidian")
hclust_ca_clust_leg <- hclust(dist_ca_clust_leg, method = "ward.D")
ggdendrogram(hclust_ca_clust_leg)

ca$clust_leg <- cutree(hclust_ca_clust_leg, k=6)
ca$clust_leg <- as.character(ca$clust_leg)


#Clusteranalyse nach Spurenelementen##
##Clusteranalyse nach Spurenelementen Vorbereitung ----
ca$sdlogAs <- log10(ca$As)/sd(log10(ca$As))
ca$sdlogSb <- log10(ca$Sb)/sd(log10(ca$Sb))
ca$sdlogNi <- log10(ca$Ni)/sd(log10(ca$Ni))
ca$sdlogAg <- log10(ca$Ag)/sd(log10(ca$Ag))
ca$sdlogBi <- log10(ca$Bi)/sd(log10(ca$Bi))
ca$logAs <- log10(ca$As)
ca$logSb <- log10(ca$Sb)
ca$logNi <- log10(ca$Ni)
ca$logAg <- log10(ca$Ag)
ca$logBi <- log10(ca$Bi)

##Cluster 1 ----
clust_1 <- filter(ca, clust_leg=="1")
dist_clust_1 <- dist(clust_1[, c("sdlogAs", "sdlogSb", "sdlogNi", "sdlogAg")], method = "euclidian")
hclust_clust_1 <- hclust(dist_clust_1, method = "ward.D")
ggdendrogram(hclust_clust_1)

clust_1$clust_te <- cutree(hclust_clust_1, k=8)
clust_1$clust_te <- as.character(clust_1$clust_te)

##Cluster 2 ----
clust_2 <- filter(ca, clust_leg=="2")
dist_clust_2 <- dist(clust_2[, c("sdlogAs", "sdlogSb", "sdlogNi", "sdlogAg")], method = "euclidian")
hclust_clust_2 <- hclust(dist_clust_2, method = "ward.D")
ggdendrogram(hclust_clust_2)

clust_2$clust_te <- cutree(hclust_clust_2, k=7)
clust_2$clust_te <- as.character(clust_2$clust_te)

##Cluster 3 ----
clust_3 <- filter(ca, clust_leg=="3")
dist_clust_3 <- dist(clust_3[, c("sdlogSb", "sdlogNi", "sdlogAg")], method = "euclidian")
hclust_clust_3 <- hclust(dist_clust_3, method = "ward.D")
ggdendrogram(hclust_clust_3)

clust_3$clust_te <- cutree(hclust_clust_3, k=7)
clust_3$clust_te <- as.character(clust_3$clust_te)

##Cluster 4 ----
clust_4 <- filter(ca, clust_leg=="4")
dist_clust_4 <- dist(clust_4[, c("sdlogAs", "sdlogSb", "sdlogNi", "sdlogAg")], method = "euclidian")
hclust_clust_4 <- hclust(dist_clust_4, method = "ward.D")
ggdendrogram(hclust_clust_4)

clust_4$clust_te <- cutree(hclust_clust_4, k=8)
clust_4$clust_te <- as.character(clust_4$clust_te)

##Cluster 5 ----
clust_5 <- filter(ca, clust_leg=="5")
dist_clust_5 <- dist(clust_5[, c("sdlogAs", "sdlogSb", "sdlogNi", "sdlogAg")], method = "euclidian")
hclust_clust_5 <- hclust(dist_clust_5, method = "ward.D")
ggdendrogram(hclust_clust_5)

clust_5$clust_te <- cutree(hclust_clust_5, k=3)
clust_5$clust_te <- as.character(clust_5$clust_te)

##Cluster 5 ----
clust_6 <- filter(ca, clust_leg=="6")
dist_clust_6 <- dist(clust_6[, c("sdlogAs", "sdlogSb", "sdlogNi", "sdlogAg")], method = "euclidian")
hclust_clust_6 <- hclust(dist_clust_6, method = "ward.D")
ggdendrogram(hclust_clust_6)

clust_6$clust_te <- cutree(hclust_clust_6, k=1)
clust_6$clust_te <- as.character(clust_6$clust_te)

##Export für Datenbank----
clust_al <- rbind(clust_al_1, clust_al_2, clust_al_3, clust_al_4, clust_al_5, clust_al_6)
clust_al_exp <- clust_al[, c("ca_id", "site_id", "part_id", "clust_leg", "clust_te")]
write_csv(clust_al_exp, file = "clust_al_exp.csv")
