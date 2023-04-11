##Filter (nur Zeilen mit vorhandenen Werten werden verwendet)###
Cau_clust_YYY <- filter(XXX, ZZZ>0.0001)

###Standertisierung der Werte durch die Standartabweichung###
Cau_clust_YYY$sd_ZZZ <- Cau_clust_YYY$ZZZ/sd(Cau_clust_YYY$ZZZ)

###Distanzermittlung zwischen den Werten###
dist_Cau_clust_YYY <- dist(Cau_clust_YYY[, c(33:36)], method = "euclidian")

###Clusteranalyse##
hclust_Cau_clust_YYY <- hclust(dist_Cau_clust_YYY, method = "ward.D2")

###Erstellung des Dendrogramms##
ggdendrogram(hclust_Cau_clust_YYY)

###Wählen der Anzahl der Cluster und abspeichern in Data Frame##
Cau_clust_e$clust_YYY <- cutree(hclust_Cau_clust_YYY, k=6)