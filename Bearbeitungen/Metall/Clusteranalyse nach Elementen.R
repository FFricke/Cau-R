ca_clust_e <- filter(ca, As>0.0001, Sb>0.0001, Ni>0.0001, main=="cu")

ca_clust_e$logAs <- log10(ca_clust_e$As)
ca_clust_e$logSb <- log10(ca_clust_e$Sb)
ca_clust_e$logNi <- log10(ca_clust_e$Ni)

ca_clust_e$sd_As <- ca_clust_e$logAs/sd(ca_clust_e$logAs)
ca_clust_e$sd_Sb <- ca_clust_e$logSb/sd(ca_clust_e$logSb)
ca_clust_e$sd_Ni <- ca_clust_e$logNi/sd(ca_clust_e$logNi)


dist_ca_clust_e <- dist(ca_clust_e[, c(28:30)], method = "euclidian")

hclust_ca_clust_e <- hclust(dist_ca_clust_e, method = "ward.D")

ggdendrogram(hclust_ca_clust_e)

ca_clust_e$clust_e <- cutree(hclust_ca_clust_e, k=4)

ca_clust_e$clust_e <- as.character(ca_clust_e$clust_e)

##Doppellogs##

ggplot(
  data = ca_clust_e, aes(x=As, y=Sb)) +
  geom_point(
    aes(colour=clust_e)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1) + 
  theme_bw()

ggplot(
  data = ca_clust_e, aes(x=As, y=Ni)) +
  geom_point(
    aes(colour=clust_e)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1) + 
  theme_bw()


ggplot(
  data = ca_clust_e, aes(x=Ag, y=Ni)) +
  geom_point(
    aes(colour=clust_e)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1) + 
  theme_bw()
