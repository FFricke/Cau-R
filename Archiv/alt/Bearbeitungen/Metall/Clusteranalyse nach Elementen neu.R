ca_clust_e <- filter(ca, main=="cu" & (region_id=="1" | region_id=="2" | region_id=="3" | region_id=="4" | region_id=="5" | region_id=="6" | region_id=="19"))
ca_clust_e$As <- replace_na(ca_clust_e$As, 0.0001)
ca_clust_e$Sb <- replace_na(ca_clust_e$Sb, 0.0001)
ca_clust_e$Ni <- replace_na(ca_clust_e$Ni, 0.0001)
ca_clust_e$Ag <- replace_na(ca_clust_e$Ag, 0.0001)
ca_clust_e$Bi <- replace_na(ca_clust_e$Bi, 0.0001)
ca_clust_e$As[ca_clust_e$As==0] <- 0.0001
ca_clust_e$Sb[ca_clust_e$Sb==0] <- 0.0001
ca_clust_e$Ni[ca_clust_e$Ni==0] <- 0.0001
ca_clust_e$Ag[ca_clust_e$Ag==0] <- 0.0001
ca_clust_e$Bi[ca_clust_e$Bi==0] <- 0.0001

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

ca_clust_e$clust_e <- cutree(hclust_ca_clust_e, k=18)

ca_clust_e$clust_e <- as.character(ca_clust_e$clust_e)

##Doppellogs##

diagramm_ca(data = ca_clust_e, element_1 = As, element_2 = Sb, variable = clust_e)
diagramm_ca(data = ca_clust_e, element_1 = As, element_2 = Ni, variable = clust_e)
diagramm_ca(data = ca_clust_e, element_1 = Sb, element_2 = Ni, variable = clust_e)
diagramm_ca(data = ca_clust_e, element_1 = Ag, element_2 = Ni, variable = clust_e)
diagramm_ca(data = ca_clust_e, element_1 = Bi, element_2 = Ag, variable = clust_e)
diagramm_ca(data = ca_clust_e, element_1 = Ni, element_2 = Ag, variable = clust_e)


##Histogramme##
diagramm_hist_ca(data = ca_clust_e,element = As, variable = clust_e)
diagramm_hist_ca(data = ca_clust_e,element = Sb, variable = clust_e)
diagramm_hist_ca(data = ca_clust_e,element = Ni, variable = clust_e)
diagramm_hist_ca(data = ca_clust_e,element = Bi, variable = clust_e)
diagramm_hist_ca(data = ca_clust_e,element = Ag, variable = clust_e)

group_by(ca_clust_e, clust_e) %>%
  summarise(min(As), max(As), median(As), sd(As))
  summarise(median(As), median(Sb), median(Ni), median(Bi), median(Ag)) -> clust_disc_median_2

clust_disc_median_2 <- rename(clust_disc_median_2, As = `median(As)`)
clust_disc_median_2 <- rename(clust_disc_median_2, Sb = `median(Sb)`)
clust_disc_median_2 <- rename(clust_disc_median_2, Ni = `median(Ni)`)
clust_disc_median_2 <- rename(clust_disc_median_2, Bi = `median(Bi)`)
clust_disc_median_2 <- rename(clust_disc_median_2, Ag = `median(Ag)`)

ggplot(data=clust_disc_median_2,
       aes(x=As, y=Sb, colour=clust_e)) +
  geom_point() + 
  scale_x_log10() + scale_y_log10()

ggplot(data=clust_disc_median_2,
       aes(x=As, y=Ni, colour=clust_e)) +
  geom_point() + 
  scale_x_log10() + scale_y_log10()

ggplot(data=clust_disc_median_2,
       aes(x=Ag, y=Bi, colour=clust_e)) +
  geom_point() + 
  scale_x_log10() + scale_y_log10()



ggplot(data=filter(ca_clust_e, culture=="Maykop"),
       aes(group=culture, x=clust_e, fill = factor(..x..))) +
  geom_bar(aes(y = (..count..)/sum(..count..))) + 
  geom_text(aes( label = scales::percent(..prop..),
                 y= ..prop.. ), stat= "count", vjust = -.5) +
  scale_y_continuous(labels=scales::percent) +
  facet_grid(rows=vars(culture))

ggplot(data=filter(ca_clust_e, culture=="Kura-Arax"),
       aes(group=culture, x=clust_e, fill = factor(..x..))) +
  geom_bar(aes(y = (..count..)/sum(..count..))) + 
  geom_text(aes( label = scales::percent(..prop..),
                 y= ..prop.. ), stat= "count", vjust = -.5) +
  scale_y_continuous(labels=scales::percent) +
  facet_grid(rows=vars(culture))

ggplot(data=filter(ca_clust_e, culture=="North-Caucasian"),
       aes(group=culture, x=clust_e, fill = factor(..x..))) +
  geom_bar(aes(y = (..count..)/sum(..count..))) + 
  geom_text(aes( label = scales::percent(..prop..),
                 y= ..prop.. ), stat= "count", vjust = -.5) +
  scale_y_continuous(labels=scales::percent) +
  facet_grid(rows=vars(culture))


ggplot(ca_clust_e, aes(x=As)) +
  geom_histogram(binwidth = 0.05) + xlim(0,10)

ggplot(ca_clust_e, aes(x=Ni)) +
  geom_histogram(binwidth = 0.05) + xlim(0,3)

ggplot(ca_clust_e, aes(x=Sb)) +
  geom_histogram(binwidth = 0.05) + xlim(0,3)

ggplot(ca_clust_e, aes(x=As)) +
  geom_boxplot() + xlim(0,10) + scale_x_log10()

