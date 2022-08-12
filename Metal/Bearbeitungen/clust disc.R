#Konstruktion Dataframe ----
clust_1_disc <- as.data.frame( 
  filter(ca, clust_leg=="1") %>%
  group_by(clust_e) %>%
  summarise(median(As), median(Sb), median(Ni), median(Ag)))

clust_2_disc <- as.data.frame( 
filter(ca, clust_leg=="2") %>%
  group_by(clust_e) %>%
  summarise(median(As), median(Sb), median(Ni), median(Ag)))

clust_3_disc <- as.data.frame( 
filter(ca, clust_leg=="3") %>%
  group_by(clust_e) %>%
  summarise(median(As), median(Sb), median(Ni), median(Ag)))

clust_4_disc <- as.data.frame( 
filter(ca, clust_leg=="4") %>%
  group_by(clust_e) %>%
  summarise(median(As), median(Sb), median(Ni), median(Ag)))

clust_5_disc <- as.data.frame(
filter(ca, clust_leg=="5") %>%
  group_by(clust_e) %>%
  summarise(median(As), median(Sb), median(Ni), median(Ag)))

clust_1_disc["clust_leg"] <- 1
clust_2_disc["clust_leg"] <- 2
clust_3_disc["clust_leg"] <- 3
clust_4_disc["clust_leg"] <- 4
clust_5_disc["clust_leg"] <- 5

clust_disc <- rbind(clust_1_disc, clust_2_disc, clust_3_disc, clust_4_disc, clust_5_disc)
clust_disc <- rename(clust_disc, As="median(As)")
clust_disc <- rename(clust_disc, Sb="median(Sb)")
clust_disc <- rename(clust_disc, Ni="median(Ni)")
clust_disc <- rename(clust_disc, Ag="median(Ag)")
clust_disc$clust_e <- as_factor(clust_disc$clust_e)
clust_disc$clust_leg <- as_factor(clust_disc$clust_leg)
#Diagramme zu clust_disc ----
ggplot(clust_disc, 
       aes(x = Ag, y = Sb, colour=clust_leg)) +
  geom_point() + 
  geom_label_repel(aes(label = clust_e)) +
  scale_x_log10() + scale_y_log10()

ggplot(clust_disc, 
       aes(x = Ag, y = Ni, colour=clust_leg)) +
  geom_point() + 
  geom_label_repel(aes(label = clust_e)) +
  scale_x_log10() + scale_y_log10()

ggplot(clust_disc, 
       aes(x = Sb, y = Ni, colour=clust_leg)) +
  geom_point() + 
  geom_label_repel(aes(label = clust_e)) +
  scale_x_log10() + scale_y_log10()

#Clusteranalyse----
##Vorbereitung##
clust_disc$sdlogSb <- log10(clust_disc$Sb)/sd(log10(clust_disc$Sb))
clust_disc$sdlogNi <- log10(clust_disc$Ni)/sd(log10(clust_disc$Ni))
clust_disc$sdlogAg <- log10(clust_disc$Ag)/sd(log10(clust_disc$Ag))
clust_disc$logSb <- log10(clust_disc$Sb)
clust_disc$logNi <- log10(clust_disc$Ni)
clust_disc$logAg <- log10(clust_disc$Ag)

##Analyse##
dist_clust_disc <- dist(clust_disc[, c("sdlogSb", "sdlogNi", "sdlogAg")], method = "euclidian")
hclust_clust_disc <- hclust(dist_clust_disc, method = "ward.D")
ggdendrogram(hclust_clust_disc)

clust_disc$clust_2 <- cutree(hclust_clust_disc, k=7)
clust_disc$clust_2 <- as.character(clust_disc$clust_2)

#Diagramme mit Clustern----

plots_clust_disc_1 <- ggplot(clust_disc, 
       aes(x = Ag, y = Sb, colour=clust_2)) +
  geom_point() + 
  scale_x_log10() + scale_y_log10()
plots_clust_disc_2 <- ggplot(clust_disc, 
       aes(x = Ag, y = Ni, colour=clust_2)) +
  geom_point() + 
  scale_x_log10() + scale_y_log10()
plots_clust_disc_3 <- ggplot(clust_disc, 
       aes(x = Sb, y = Ni, colour=clust_2)) +
  geom_point() + 
  scale_x_log10() + scale_y_log10()

plots_clust_disc <- list(plots_clust_disc_1, plots_clust_disc_2, plots_clust_disc_3)
plot_grid(plotlist = plots_clust_disc)

#Export für Datenbank ----
write_csv(clust_disc[, c("clust_2", "clust_leg", "clust_e")], file = "clust_disc.csv")