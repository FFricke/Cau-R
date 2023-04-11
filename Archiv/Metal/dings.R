#Cluster für Gruppierung visualisieren ----

  hclust_filter <- filter(hclust, mclust=="9" | mclust=="10"| mclust=="11")
  
  scat_1 <- scatter_dlog(hclust_filter, "Ag", "Pb", mclust)
  scat_2 <- scatter_dlog(hclust_filter, "As", "Sb", mclust)
  scat_3 <- scatter_dlog(hclust_filter, "Sb", "Ni", mclust)
  scat_4 <- scatter_dlog(hclust_filter, "Ag", "Bi", mclust)
  scat <- list(scat_1, scat_2, scat_3, scat_4)
  plot_grid(plotlist = scat)
  
  hclust_filter <- filter(hclust, mclust=="6" | mclust=="7"| mclust=="8")
  
  scat_1 <- scatter_dlog(hclust_filter, "Ag", "Pb", mclust)
  scat_2 <- scatter_dlog(hclust_filter, "As", "Sb", mclust)
  scat_3 <- scatter_dlog(hclust_filter, "Sb", "Ni", mclust)
  scat_4 <- scatter_dlog(hclust_filter, "Ag", "Bi", mclust)
  scat <- list(scat_1, scat_2, scat_3, scat_4)
  plot_grid(plotlist = scat)
  
  hclust_filter <- filter(hclust, mclust=="1" | mclust=="2"| mclust=="3"| mclust=="4"| mclust=="5")
  
  scat_1 <- scatter_dlog(hclust_filter, "Ag", "Pb", mclust)
  scat_2 <- scatter_dlog(hclust_filter, "As", "Sb", mclust)
  scat_3 <- scatter_dlog(hclust_filter, "Sb", "Ni", mclust)
  scat_4 <- scatter_dlog(hclust_filter, "Ag", "Bi", mclust)
  scat <- list(scat_1, scat_2, scat_3, scat_4)
  plot_grid(plotlist = scat)
  
  scat_1 <- scatter_dlog(ca, "Ag", "Pb", mclust_group)
  scat_2 <- scatter_dlog(ca, "As", "Sb", mclust_group)
  scat_3 <- scatter_dlog(ca, "Sb", "Ni", mclust_group)
  scat_4 <- scatter_dlog(ca, "Ag", "Bi", mclust_group)
  scat <- list(scat_1, scat_2, scat_3, scat_4)
  plot_grid(plotlist = scat)

#Cluster PCA ----

  pca.clust_cult <- PCA(hclust_cult[15:25])
  fviz_eig(pca.clust, addlabels = TRUE)
  get_eigenvalue(pca.clust)
  fviz_pca_var(pca.clust)
  
  pca.clust_reg <- PCA(hclust_reg[15:25])
  
  pca.clust_site <- PCA(hclust_site[19:29])
  get_eigenvalue(pca.clust_site)


  #Cluster-Group Visualisierung ----

    scat_1 <- scatter_dlog(ca, "Ag", "Pb", mclust_group)
    scat_2 <- scatter_dlog(ca, "As", "Sb", mclust_group)
    scat_3 <- scatter_dlog(ca, "Sb", "Ni", mclust_group)
    scat_4 <- scatter_dlog(ca, "Ag", "Bi", mclust_group)
    scat <- list(scat_1, scat_2, scat_3, scat_4)
    plot_grid(plotlist = scat)
    
    plot_cult <- map(unique(ca$culture_id), ~bar(filter(ca, culture_id==.x), "mclust_group", culture_id)) 
    plot_grid(plotlist = plot_cult)

#Cluster-Group nach site PCA
{

##Kompletter Datensatz----
  
  fviz_pca(prcomp(hclust_group_site[13:17]), 
           habillage = hclust_group_site$culture_en, geom="point", ggtheme=theme_classic(), palette="jco")

  fviz_pca(prcomp(hclust_group_site[13:17]), 
           habillage = hclust_group_site$region_en, geom="point", ggtheme=theme_classic(), palette="jco")
  
  
##nach Kulturen----
  
  hclust_group_site_filter <- filter(hclust_group_site, culture_en=="Yamnaya" | culture_en=="Katakombnaya" | culture_en=="Tripolye")
  fviz_pca(prcomp(hclust_group_site_filter[13:17]), 
           habillage = hclust_group_site_filter$culture_en, geom="point", ggtheme=theme_classic(), palette="jco")
  
  hclust_group_site_filter <- filter(hclust_group_site, complete>=10 &(culture_en=="Maykop" | culture_en=="Kura-Arax" | culture_en=="North-Caucasian"))
  fviz_pca(prcomp(hclust_group_site_filter[13:17]), 
           habillage = hclust_group_site_filter$culture_en, geom="point", ggtheme=theme_classic(), palette="jco")
  
  hclust_group_site_filter <- filter(hclust_group_site, culture_en=="Vergleichsraum Sued")
  fviz_pca(prcomp(hclust_group_site_filter[13:17]), 
           habillage = hclust_group_site_filter$region_en, geom="point", ggtheme=theme_classic(), palette="jco")
  
##PCA Sites nach Kulturen/Regionen----
  
  hclust_group_site_filter <- filter(hclust_group_site, region_en=="Anatolia")
  fviz_pca(prcomp(hclust_group_site_filter[13:17]), 
           habillage = hclust_group_site_filter$site_dt, geom="point", ggtheme=theme_classic())
  
  hclust_group_site_filter <- filter(hclust_group_site, complete>=10 & culture_en=="Maykop")
  fviz_pca(prcomp(hclust_group_site_filter[13:17]), 
           habillage = hclust_group_site_filter$site_dt, geom="point", ggtheme=theme_classic())
  
  hclust_group_site_filter <- filter(hclust_group_site, complete>=10 & culture_en=="Kura-Arax")
  fviz_pca(prcomp(hclust_group_site_filter[13:17]), 
           habillage = hclust_group_site_filter$site_dt, geom="point", ggtheme=theme_classic())
}
    
#Cluster Group nach Elementen ----
  ca_filter <- filter(ca, mclust_group=="3" |mclust_group=="4"|mclust_group=="5"|mclust_group=="2")
  plot_group <- purrr::map(unique(ca_filter$mclust_group), ~(histo(filter(ca_filter, mclust_group==.x), "As", mclust_group, 0.1)) + geom_density(aes(y=.1*..count..)))
  plot_grid(plotlist = plot_group)
  
  ca_filter <- filter(ca, mclust_group=="3" |mclust_group=="4"|mclust_group=="5"|mclust_group=="2")
  plot_group <- purrr::map(unique(ca_filter$mclust_group), ~(histo(filter(ca_filter, mclust_group==.x), "AsSb", mclust_group, 0.5)) + geom_density(aes(y=.5*..count..)) + xlim(0,10))
  plot_grid(plotlist = plot_group)
  
  plot_group <- purrr::map(unique(ca_filter$mclust_group), ~(histo_log(filter(ca_filter, mclust_group==.x), "As", mclust_group, .025)) + geom_density(aes(y=.025*..count..)))
  plot_grid(plotlist = plot_group)


#Tests zur Normalverteilung ----

  ##Shiparo-Wilk Tests##
    shapiro.test(filter(ca, mclust_group=="3")$sdlogAs)
    shapiro.test(filter(ca, mclust_group=="4")$sdlogAs)
    shapiro.test(filter(ca, mclust_group=="5")$sdlogAs)
  
  ##Kolmogorov-Smirnov Test##
    ks.test(filter(ca, mclust_group=="3")$sdlogAs, 'pnorm')
    ks.test(filter(ca, mclust_group=="4")$sdlogAs, 'pnorm')
    ks.test(filter(ca, mclust_group=="5")$sdlogAs, 'pnorm')

