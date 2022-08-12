ca_clust_e <- filter(ca, As>0.0001, Sb>0.0001, Bi >0.0001, Ni>0.0001, Ag>0.0001, main=="cu", !is.na(culture))

ca_clust_e$logAs <- log10(ca_clust_e$As)
ca_clust_e$logSb <- log10(ca_clust_e$Sb)
ca_clust_e$logNi <- log10(ca_clust_e$Ni)
ca_clust_e$logBi <- log10(ca_clust_e$Bi)
ca_clust_e$logAg <- log10(ca_clust_e$Ag)

ca_clust_e$sd_As <- ca_clust_e$logAs/sd(ca_clust_e$logAs)
ca_clust_e$sd_Sb <- ca_clust_e$logSb/sd(ca_clust_e$logSb)
ca_clust_e$sd_Ni <- ca_clust_e$logNi/sd(ca_clust_e$logNi)
ca_clust_e$sd_Bi <- ca_clust_e$logBi/sd(ca_clust_e$logBi)
ca_clust_e$sd_Ag <- ca_clust_e$logAg/sd(ca_clust_e$logAg)


dist_ca_clust_e <- dist(ca_clust_e[, c(36:40)], method = "euclidian")

hclust_ca_clust_e <- hclust(dist_ca_clust_e, method = "ward.D")

ggdendrogram(hclust_ca_clust_e)

ca_clust_e$clust_e <- cutree(hclust_ca_clust_e, k=6)

    ca_clust_e$clust_e <- as.ch
    
    
    racter(ca_clust_e$clust_e)

##Doppellogs##

diagramm_ca(data = ca_clust_e, element_1 = As, element_2 = Sb, variable = clust_e)
diagramm_ca(data = ca_clust_e, element_1 = As, element_2 = Ni, variable = clust_e)
diagramm_ca(data = ca_clust_e, element_1 = As, element_2 = Bi, variable = clust_e)
diagramm_ca(data = ca_clust_e, element_1 = As, element_2 = Ag, variable = clust_e)
diagramm_ca(data = ca_clust_e, element_1 = Bi, element_2 = Ag, variable = clust_e)
diagramm_ca(data = ca_clust_e, element_1 = Ni, element_2 = Ag, variable = clust_e)


##Histogramme##
diagramm_hist_ca(data = ca_clust_e,element = As, variable = clust_e)
diagramm_hist_ca(data = ca_clust_e,element = Sb, variable = clust_e)
diagramm_hist_ca(data = ca_clust_e,element = Ni, variable = clust_e)
diagramm_hist_ca(data = ca_clust_e,element = Bi, variable = clust_e)
diagramm_hist_ca(data = ca_clust_e,element = Ag, variable = clust_e)
