#Clusteranalyse nach Spurenelementen##
##Clusteranalyse nach Spurenelementen Vorbereitung ----
ca$sdlogAs <- log10(ca$As)/sd(log10(ca$As))
ca$sdlogSb <- log10(ca$Sb)/sd(log10(ca$Sb))
ca$sdlogNi <- log10(ca$Ni)/sd(log10(ca$Ni))
ca$sdlogAg <- log10(ca$Ag)/sd(log10(ca$Ag))
ca$sdlogBi <- log10(ca$Bi)/sd(log10(ca$Bi))
ca$sdlogZn <- log10(ca$Zn)/sd(log10(ca$Zn))
ca$sdlogPb <- log10(ca$Pb)/sd(log10(ca$Pb))
ca$logAs <- log10(ca$As)
ca$logSb <- log10(ca$Sb)
ca$logNi <- log10(ca$Ni)
ca$logAg <- log10(ca$Ag)
ca$logBi <- log10(ca$Bi)

##Cluster 1 ----
clust_al_1 <- filter(ca, clust_leg=="1")
dist_clust_al_1 <- dist(clust_al_1[, 
                               c("sdlogAs", "sdlogSb", "sdlogNi", "sdlogAg", "sdlogBi", "sdlogZn", "sdlogPb")], 
                      method = "euclidian")
hclust_clust_al_1 <- hclust(dist_clust_al_1, method = "ward.D")
NbClust()
ggdendrogram(hclust_clust_al_1)
fviz_nbclust(hclust_clust_1)

clust_al_1$clust_te <- cutree(hclust_clust_al_1, k=10)
clust_al_1$clust_te <- as.factor(clust_al_1$clust_te)

##Cluster 2 ----
clust_al_2 <- filter(ca, clust_leg=="2")
dist_clust_al_2 <- dist(clust_al_2[, 
                                   c("sdlogAs", "sdlogSb", "sdlogNi", "sdlogAg", "sdlogBi", "sdlogZn", "sdlogPb")], 
                        method = "euclidian")
hclust_clust_al_2 <- hclust(dist_clust_al_2, method = "ward.D")
ggdendrogram(hclust_clust_al_2)

clust_al_2$clust_te <- cutree(hclust_clust_al_2, k=10)
clust_al_2$clust_te <- as.factor(clust_al_2$clust_te)

##Cluster 3 ----
clust_al_3 <- filter(ca, clust_leg=="3")
dist_clust_al_3 <- dist(clust_al_3[, 
                                   c("sdlogAs", "sdlogSb", "sdlogNi", "sdlogAg", "sdlogBi", "sdlogZn", "sdlogPb")], 
                        method = "euclidian")
hclust_clust_al_3 <- hclust(dist_clust_al_3, method = "ward.D")
ggdendrogram(hclust_clust_al_3)

clust_al_3$clust_te <- cutree(hclust_clust_al_3, k=9)
clust_al_3$clust_te <- as.factor(clust_al_3$clust_te)

##Cluster 4 ----
clust_al_4 <- filter(ca, clust_leg=="4")
dist_clust_al_4 <- dist(clust_al_4[, 
                                   c("sdlogAs", "sdlogSb", "sdlogNi", "sdlogAg", "sdlogBi", "sdlogZn", "sdlogPb")], 
                        method = "euclidian")
hclust_clust_al_4 <- hclust(dist_clust_al_4, method = "ward.D")
ggdendrogram(hclust_clust_al_4)

clust_al_4$clust_te <- cutree(hclust_clust_al_4, k=6)
clust_al_4$clust_te <- as.factor(clust_al_4$clust_te)

##Cluster 5 ----
clust_al_5 <- filter(ca, clust_leg=="5")
dist_clust_al_5 <- dist(clust_al_5[, 
                                   c("sdlogAs", "sdlogSb", "sdlogNi", "sdlogAg", "sdlogBi", "sdlogZn", "sdlogPb")], 
                        method = "euclidian")
hclust_clust_al_5 <- hclust(dist_clust_al_5, method = "ward.D")
ggdendrogram(hclust_clust_al_5)

clust_al_5$clust_te <- cutree(hclust_clust_al_5, k=3)
clust_al_5$clust_te <- as.factor(clust_al_5$clust_te)

##Cluster 6 ----
clust_al_6 <- filter(ca, clust_leg=="6")
dist_clust_al_6 <- dist(clust_al_6[, 
                                   c("sdlogAs", "sdlogSb", "sdlogNi", "sdlogAg", "sdlogBi", "sdlogZn", "sdlogPb")], 
                        method = "euclidian")
hclust_clust_al_6 <- hclust(dist_clust_al_6, method = "ward.D")
ggdendrogram(hclust_clust_al_6)

clust_al_6$clust_te <- cutree(hclust_clust_al_6, k=1)
clust_al_6$clust_te <- as.factor(clust_al_6$clust_te)


##Export für Datenbank----
clust_al <- rbind(clust_al_1, clust_al_2, clust_al_3, clust_al_4, clust_al_5, clust_al_6)
clust_al_exp <- clust_al[, c("ca_id", "site_id", "part_id", "clust_leg", "clust_te")]
write_csv(clust_al_exp, file = "clust_al_exp.csv")

##Cluster der Cluster ----
#Konstruktion Dataframe ----

clust_al_1_disc <- as.data.frame( 
  filter(clust_al, clust_leg=="1") %>%
    group_by(clust_e) %>%
    summarise(median(As), median(Sb), median(Ni), median(Ag), median(Pb), median(Zn), median(Bi)))

clust_al_2_disc <- as.data.frame( 
  filter(clust_al, clust_leg=="2") %>%
    group_by(clust_e) %>%
    summarise(median(As), median(Sb), median(Ni), median(Ag), median(Pb), median(Zn), median(Bi)))

clust_al_3_disc <- as.data.frame( 
  filter(clust_al, clust_leg=="3") %>%
    group_by(clust_e) %>%
    summarise(median(As), median(Sb), median(Ni), median(Ag), median(Pb), median(Zn), median(Bi)))

clust_al_4_disc <- as.data.frame( 
  filter(clust_al, clust_leg=="4") %>%
    group_by(clust_e) %>%
    summarise(median(As), median(Sb), median(Ni), median(Ag), median(Pb), median(Zn), median(Bi)))

clust_al_5_disc <- as.data.frame( 
  filter(clust_al, clust_leg=="5") %>%
    group_by(clust_e) %>%
    summarise(median(As), median(Sb), median(Ni), median(Ag), median(Pb), median(Zn), median(Bi)))

clust_al_6_disc <- as.data.frame( 
  filter(clust_al, clust_leg=="6") %>%
    group_by(clust_e) %>%
    summarise(median(As), median(Sb), median(Ni), median(Ag), median(Pb), median(Zn), median(Bi)))

clust_al_1_disc["clust_leg"] <- 1
clust_al_2_disc["clust_leg"] <- 2
clust_al_3_disc["clust_leg"] <- 3
clust_al_4_disc["clust_leg"] <- 4
clust_al_5_disc["clust_leg"] <- 5
clust_al_6_disc["clust_leg"] <- 6

clust_al_disc <- rbind(clust_al_1_disc, clust_al_2_disc, clust_al_3_disc, clust_al_4_disc, clust_al_5_disc, clust_al_6_disc)
clust_al_disc <- rename(clust_al_disc, As="median(As)")
clust_al_disc <- rename(clust_al_disc, Sb="median(Sb)")
clust_al_disc <- rename(clust_al_disc, Ni="median(Ni)")
clust_al_disc <- rename(clust_al_disc, Ag="median(Ag)")
clust_al_disc <- rename(clust_al_disc, Pb="median(Pb)")
clust_al_disc <- rename(clust_al_disc, Zn="median(Zn)")
clust_al_disc <- rename(clust_al_disc, Bi="median(Bi)")
clust_al_disc$clust_e <- as_factor(clust_al_disc$clust_e)
clust_al_disc$clust_leg <- as_factor(clust_al_disc$clust_leg)

#Clusteranalyse der Cluster ----

##Vorbereitung##
clust_al_disc$sdlogSb <- log10(clust_al_disc$Sb)/sd(log10(clust_al_disc$Sb))
clust_al_disc$sdlogNi <- log10(clust_al_disc$Ni)/sd(log10(clust_al_disc$Ni))
clust_al_disc$sdlogAg <- log10(clust_al_disc$Ag)/sd(log10(clust_al_disc$Ag))
clust_al_disc$sdlogPb <- log10(clust_al_disc$Pb)/sd(log10(clust_al_disc$Pb))
clust_al_disc$sdlogZn <- log10(clust_al_disc$Zn)/sd(log10(clust_al_disc$Zn))
clust_al_disc$sdlogBi <- log10(clust_al_disc$Bi)/sd(log10(clust_al_disc$Bi))


dist_clust_al_disc <- dist(clust_al_disc[, c("sdlogSb", "sdlogNi", "sdlogAg", "sdlogPb", "sdlogZn", "sdlogBi")], method = "euclidian")
hclust_clust_al_disc <- hclust(dist_clust_al_disc, method = "ward.D")
ggdendrogram(hclust_clust_al_disc)
