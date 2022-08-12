ca_clust_leg <- filter(ca, main=="cu" & (region_id=="1" | region_id=="2" | region_id=="3" | region_id=="4" | region_id=="5" | region_id=="6" | region_id=="19" | region_id=="17"| region_id=="18"))
ca_clust_leg$As <- replace_na(ca_clust_leg$As, 0.0001)
ca_clust_leg$Sb <- replace_na(ca_clust_leg$Sb, 0.0001)
ca_clust_leg$Ni <- replace_na(ca_clust_leg$Ni, 0.0001)
ca_clust_leg$Ag <- replace_na(ca_clust_leg$Ag, 0.0001)
ca_clust_leg$Bi <- replace_na(ca_clust_leg$Bi, 0.0001)
ca_clust_leg$As[ca_clust_leg$As==0] <- 0.0001
ca_clust_leg$Sb[ca_clust_leg$Sb==0] <- 0.0001
ca_clust_leg$Ni[ca_clust_leg$Ni==0] <- 0.0001
ca_clust_leg$Ag[ca_clust_leg$Ag==0] <- 0.0001
ca_clust_leg$Bi[ca_clust_leg$Bi==0] <- 0.0001

ca_clust_leg$sd_As <- ca_clust_leg$As/sd(ca_clust_leg$As)
ca_clust_leg$sd_Sb <- ca_clust_leg$Sb/sd(ca_clust_leg$Sb)
ca_clust_leg$sd_Ni <- ca_clust_leg$Ni/sd(ca_clust_leg$Ni)
ca_clust_leg$sd_Bi <- ca_clust_leg$Bi/sd(ca_clust_leg$Bi)
ca_clust_leg$sd_Ag <- ca_clust_leg$Ag/sd(ca_clust_leg$Ag)

dist_ca_clust_leg <- dist(ca_clust_leg[, c(36,37,38)], method = "euclidian")

hclust_ca_clust_leg <- hclust(dist_ca_clust_leg, method = "ward.D")

ggdendrogram(hclust_ca_clust_leg)

ca_clust_leg$clust_leg <- cutree(hclust_ca_clust_leg, k=6)

ca_clust_leg$clust_leg <- as.character(ca_clust_leg$clust_leg)

##Export##
clust_leg <- ca_clust_leg[, c(5,4,2,41)]
write_csv(clust_leg, file="clust_leg.csv")

##Diagramme##
ggplot(ca_clust_leg, aes(x=As, y=Ni, colour=clust_leg)) +
  geom_point()  + coord_fixed(ratio = 1)

ggplot(ca_clust_leg, aes(x=As, y=Sb, colour=clust_leg)) +
  geom_point()  + coord_fixed(ratio = 1)

ggplot(ca_clust_leg, aes(x=Sb, y=Ni, colour=clust_leg)) +
  geom_point()  + coord_fixed(ratio = 1)

ggplot(ca_clust_leg, aes(x=As, y=Ni, colour=clust_leg)) +
  geom_point()  + coord_fixed(ratio = 1) +
  xlim(0,10) + ylim(0,10)

ggplot(ca_clust_leg, aes(x=As, y=Sb, colour=clust_leg)) +
  geom_point()  + coord_fixed(ratio = 1) +
  xlim(0,10) + ylim(0,10)

ggplot(ca_clust_leg, aes(x=Sb, y=Ni, colour=clust_leg)) +
  geom_point()  + coord_fixed(ratio = 1) +
  xlim(0,10) + ylim(0,10)

ggplot(ca_clust_leg, aes(x=As, y=Ni, colour=clust_leg)) +
  geom_point()  + coord_fixed(ratio = 1) + scale_x_log10() + scale_y_log10()

ggplot(ca_clust_leg, aes(x=As, y=Sb, colour=clust_leg)) +
  geom_point()  + coord_fixed(ratio = 1) + scale_x_log10() + scale_y_log10()

ggplot(ca_clust_leg, aes(x=clust_leg, fill=clust_leg)) +
  geom_bar() + facet_grid(rows=vars(culture))

ggplot(ca_clust_leg, aes(x=find_character_id, fill=find_character)) +
  geom_bar() + facet_grid(rows=vars(clust_leg))