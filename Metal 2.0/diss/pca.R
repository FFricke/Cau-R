library(FactoMineR)
library(factoextra)

##Import Crosstables ----
{
  ###Culture Crosstabel----
  {
    crossCulture <- dbGetQuery(con,
                               "select culture_id,
                                sum(case when mclust = 1 then 1 else 0 end) as Cluster1,
                                sum(case when mclust = 2 then 1 else 0 end) as Cluster3_1,
                                sum(case when mclust = 3 then 1 else 0 end) as Cluster3_2,
                                sum(case when mclust = 4 then 1 else 0 end) as Cluster2,
                                sum(case when mclust = 5 then 1 else 0 end) as Cluster4_1,
                                sum(case when mclust = 6 then 1 else 0 end) as Cluster4_2,
                                sum(case when mclust = 7 then 1 else 0 end) as Cluster4_3,
                                sum(case when mclust = 8 then 1 else 0 end) as Cluster4_4,
                                sum(case when mclust = 9 then 1 else 0 end) as Cluster5_1,
                                sum(case when mclust = 10 then 1 else 0 end) as Cluster5_2,
                                sum(case when mclust = 11 then 1 else 0 end) as Cluster5_3,
                                sum(case when mclust = 12 then 1 else 0 end) as Cluster5_4,
                                sum(case when mclust = 13 then 1 else 0 end) as Cluster6_1,
                                sum(case when mclust = 14 then 1 else 0 end) as Cluster6_2,
                                sum(case when mclust = 15 then 1 else 0 end) as Cluster6_3,
                                sum(case when mclust = 16 then 1 else 0 end) as Cluster6_4,
                                sum(case when mclust = 17 then 1 else 0 end) as Cluster6_5,
                                sum(case when mclust = 18 then 1 else 0 end) as Cluster7,
                                count(mclust) as all
                                
                                
                                from cau.feature join cau.find using (feature_id, site_id) join cau.ca using (find_id, site_id) join cau.culture using (culture_id)
                                
                                group by culture_id;
                    ")
    crossCulture[2] <- crossCulture[2]/crossCulture[20]
    crossCulture[3] <- crossCulture[3]/crossCulture[20]
    crossCulture[4] <- crossCulture[4]/crossCulture[20]
    crossCulture[5] <- crossCulture[5]/crossCulture[20]
    crossCulture[6] <- crossCulture[6]/crossCulture[20]
    crossCulture[7] <- crossCulture[7]/crossCulture[20]
    crossCulture[8] <- crossCulture[8]/crossCulture[20]
    crossCulture[9] <- crossCulture[9]/crossCulture[20]
    crossCulture[10] <- crossCulture[10]/crossCulture[20]
    crossCulture[11] <- crossCulture[11]/crossCulture[20]
    crossCulture[12] <- crossCulture[12]/crossCulture[20]
    crossCulture[13] <- crossCulture[13]/crossCulture[20]
    crossCulture[14] <- crossCulture[14]/crossCulture[20]
    crossCulture[15] <- crossCulture[15]/crossCulture[20]
    crossCulture[16] <- crossCulture[16]/crossCulture[20]
    crossCulture[18] <- crossCulture[18]/crossCulture[20]
    crossCulture[19] <- crossCulture[19]/crossCulture[20]
    
    crossCulture$culture_id <- as.factor(crossCulture$culture_id)
    crossCulture2 <- crossCulture[, (2:19)]
    rownames(crossCulture2) <- crossCulture[, 1]
    
  }
  
  ##Site Crosstable----
  {
    crossSite <- dbGetQuery(con,
                            "
                                select 
                                site_dt, culture_id,
                                sum(case when mclust = 1 then 1 else 0 end) as Cluster1,
                                sum(case when mclust = 2 then 1 else 0 end) as Cluster3_1,
                                sum(case when mclust = 3 then 1 else 0 end) as Cluster3_2,
                                sum(case when mclust = 4 then 1 else 0 end) as Cluster2,
                                sum(case when mclust = 5 then 1 else 0 end) as Cluster4_1,
                                sum(case when mclust = 6 then 1 else 0 end) as Cluster4_2,
                                sum(case when mclust = 7 then 1 else 0 end) as Cluster4_3,
                                sum(case when mclust = 8 then 1 else 0 end) as Cluster4_4,
                                sum(case when mclust = 9 then 1 else 0 end) as Cluster5_1,
                                sum(case when mclust = 10 then 1 else 0 end) as Cluster5_2,
                                sum(case when mclust = 11 then 1 else 0 end) as Cluster5_3,
                                sum(case when mclust = 12 then 1 else 0 end) as Cluster5_4,
                                sum(case when mclust = 13 then 1 else 0 end) as Cluster6_1,
                                sum(case when mclust = 14 then 1 else 0 end) as Cluster6_2,
                                sum(case when mclust = 15 then 1 else 0 end) as Cluster6_3,
                                sum(case when mclust = 16 then 1 else 0 end) as Cluster6_4,
                                sum(case when mclust = 17 then 1 else 0 end) as Cluster6_5,
                                sum(case when mclust = 18 then 1 else 0 end) as Cluster7,
                                count(mclust) as all, culture_en, site_id
                                
                                
                                from cau.feature join cau.find using (feature_id, site_id) join cau.ca using (find_id, site_id) join cau.culture using (culture_id) join cau.site using (site_id)
                                
                                where region_id != 6
                            
                                group by site_dt, culture_id, culture_en, site_id;
                            ")
    
    crossSite[3] <- crossSite[3]/crossSite[21]
    crossSite[4] <- crossSite[4]/crossSite[21]
    crossSite[5] <- crossSite[5]/crossSite[21]
    crossSite[6] <- crossSite[6]/crossSite[21]
    crossSite[7] <- crossSite[7]/crossSite[21]
    crossSite[8] <- crossSite[8]/crossSite[21]
    crossSite[9] <- crossSite[9]/crossSite[21]
    crossSite[10] <- crossSite[10]/crossSite[21]
    crossSite[11] <- crossSite[11]/crossSite[21]
    crossSite[12] <- crossSite[12]/crossSite[21]
    crossSite[13] <- crossSite[13]/crossSite[21]
    crossSite[14] <- crossSite[14]/crossSite[21]
    crossSite[15] <- crossSite[15]/crossSite[21]
    crossSite[16] <- crossSite[16]/crossSite[21]
    crossSite[17] <- crossSite[17]/crossSite[21]
    crossSite[18] <- crossSite[18]/crossSite[21]
    crossSite[19] <- crossSite[19]/crossSite[21]
    crossSite[20] <- crossSite[20]/crossSite[21]
    crossSite$culture_id <- as.factor(crossSite$culture_id)
    
    crossSite2 <- filter(crossSite, all>=6)
    crossSite3 <- crossSite2[, (3:20)]
    crossSiteClust <- crossSite2
    rownames(crossSite3) <- unite(crossSite2, "rownames", site_dt:culture_id)$rownames
  }
  
  ##Region Crosstable----
  {
    crossRegion <- dbGetQuery(con,
                            "
                                select 
                                region_en, culture_id,
                                sum(case when mclust = 1 then 1 else 0 end) as Cluster1,
                                sum(case when mclust = 2 then 1 else 0 end) as Cluster3_1,
                                sum(case when mclust = 3 then 1 else 0 end) as Cluster3_2,
                                sum(case when mclust = 4 then 1 else 0 end) as Cluster2,
                                sum(case when mclust = 5 then 1 else 0 end) as Cluster4_1,
                                sum(case when mclust = 6 then 1 else 0 end) as Cluster4_2,
                                sum(case when mclust = 7 then 1 else 0 end) as Cluster4_3,
                                sum(case when mclust = 8 then 1 else 0 end) as Cluster4_4,
                                sum(case when mclust = 9 then 1 else 0 end) as Cluster5_1,
                                sum(case when mclust = 10 then 1 else 0 end) as Cluster5_2,
                                sum(case when mclust = 11 then 1 else 0 end) as Cluster5_3,
                                sum(case when mclust = 12 then 1 else 0 end) as Cluster5_4,
                                sum(case when mclust = 13 then 1 else 0 end) as Cluster6_1,
                                sum(case when mclust = 14 then 1 else 0 end) as Cluster6_2,
                                sum(case when mclust = 15 then 1 else 0 end) as Cluster6_3,
                                sum(case when mclust = 16 then 1 else 0 end) as Cluster6_4,
                                sum(case when mclust = 17 then 1 else 0 end) as Cluster6_5,
                                sum(case when mclust = 18 then 1 else 0 end) as Cluster7,
                                count(mclust) as all, culture_en
                                
                                
                                from cau.feature join cau.find using (feature_id, site_id) join cau.ca using (find_id, site_id) join cau.culture using (culture_id) join cau.site using (site_id) join cau.region using (region_id)
                                
                                where region_id != 6
                            
                                group by region_en, culture_id, culture_en;
                            ")
    
    crossRegion[3] <- crossRegion[3]/crossRegion[21]
    crossRegion[4] <- crossRegion[4]/crossRegion[21]
    crossRegion[5] <- crossRegion[5]/crossRegion[21]
    crossRegion[6] <- crossRegion[6]/crossRegion[21]
    crossRegion[7] <- crossRegion[7]/crossRegion[21]
    crossRegion[8] <- crossRegion[8]/crossRegion[21]
    crossRegion[9] <- crossRegion[9]/crossRegion[21]
    crossRegion[10] <- crossRegion[10]/crossRegion[21]
    crossRegion[11] <- crossRegion[11]/crossRegion[21]
    crossRegion[12] <- crossRegion[12]/crossRegion[21]
    crossRegion[13] <- crossRegion[13]/crossRegion[21]
    crossRegion[14] <- crossRegion[14]/crossRegion[21]
    crossRegion[15] <- crossRegion[15]/crossRegion[21]
    crossRegion[16] <- crossRegion[16]/crossRegion[21]
    crossRegion[17] <- crossRegion[17]/crossRegion[21]
    crossRegion[18] <- crossRegion[18]/crossRegion[21]
    crossRegion[19] <- crossRegion[19]/crossRegion[21]
    crossRegion[20] <- crossRegion[20]/crossRegion[21]
    crossRegion$culture_id <- as.factor(crossRegion$culture_id)
    
    crossRegion2 <- crossRegion[, (3:20)]
    rownames(crossRegion2) <- unite(crossRegion, "rownames", region_en:culture_id)$rownames
  }
}


crossRegionPCA <- PCA(crossRegion2)
crossRegionPCAViz <- fviz_pca_ind(crossRegionPCA, 
                                geom.ind = c("point", "text"), 
                                habillage = crossRegion$culture_id, repel = TRUE, labelsize=3) + 
  theme_ft_rc() +
  theme(legend.position = "top") +
  scale_color_manual(values = c(culture_id$col), labels = c(culture_id$en), limits = force) +
  scale_shape_manual(values = c(culture_id$shape), labels = c(culture_id$en), limits = force)
crossRegionPCAViz



crossSitePCA <- PCA(crossSite3, ncp = 10)
crossSitePCAViz <- fviz_pca_ind(crossSitePCA, 
                                geom.ind = c("point", "text"), 
                                habillage = crossSite2$culture_id, repel = TRUE, labelsize=3) + 
  theme_ft_rc() +
  theme(legend.position = "top") +
  scale_color_manual(values = c(culture_id$col), labels = c(culture_id$en), limits = force) +
  scale_shape_manual(values = c(culture_id$shape), labels = c(culture_id$en), limits = force)

crossSitePCAViz

crossSiteCor <- crossSitePCA$ind$coord

crossSiteDend <- fviz_dend(hkmeans(crossSiteCor, k= 10))

crossSiteElbow <- fviz_nbclust(crossSiteCor,
                         hkmeans, method = "wss") +
  labs(subtitle = "Elbow-Methode")

crossSiteSil <- fviz_nbclust(crossSiteCor,
                       hkmeans, method = "silhouette") +
  labs(subtitle = "Silhouetten-Methode")

crossSiteGap <- fviz_nbclust(crossSiteCor,
                       hkmeans, method = "gap_stat") +
  labs(subtitle = "Gap-Methode")

crossSiteAnz <- list(crossSiteDend, crossSiteElbow, crossSiteSil, crossSiteGap)

cowplot::plot_grid(plotlist = crossSiteAnz, labels = c("a", "b", "c", "d"))

hkCrossSite <- hkmeans(crossSiteCor, k= 10,
                       hc.metric = "euclidean", hc.method = "ward.D2")
fviz_cluster(hkCrossSite)

crossSiteClust$siteClust <- as.factor(hkCrossSite$cluster)

crossSiteClust %>%
crosstable(culture_en, by=siteClust, total = "both", 
           drop_levels = TRUE, margin = "row", label = TRUE) %>%
  as_flextable(keep_it = "TRUE")


