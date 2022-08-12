#Clusteranalysen (col und leg) ----
{
  ##Cluster nach Härteklassen (As+Sb) ----
    hclust$AsSb <- hclust$As + hclust$Sb
    dist_AsSb <- dist(hclust[, ("AsSb")])
    hclust_AsSb <- hclust(dist_AsSb, method="ward.D")
    ggdendrogram(hclust_AsSb)
    
    
    hclust$clust_hard <- cutree(hclust_AsSb, k=4)
    hclust$clust_hard <- as.factor(hclust$clust_hard)
    
    scatter_1 <- scatter_dlog(hclust, "As", "Ni", clust_hard)
    scatter_2 <- scatter_dlog(hclust, "As", "Sb", clust_hard)
    scatter_3 <- scatter_dlog(hclust, "Sb", "Ni", clust_hard)
    scatter_4 <- scatter_dlog(hclust, "Ag", "Bi", clust_hard)
    scatter <- list(scatter_1, scatter_2, scatter_3, scatter_4)
    plot_grid(plotlist = scatter)
    
    histo(hclust, "AsSb", clust_hard, 0.02) + xlim(0,10) + ylim(0,75) + ylim(0,50)
    
  ##Cluster nach Farbstufen (As+Sb+Ni) ----
    hclust$AsSbNi <- hclust$As + hclust$Sb + hclust$Ni
    dist_AsSbNi <- dist(hclust[, ("AsSbNi")])
    hclust_AsSbNi <- hclust(dist_AsSbNi, method="ward.D")
    ggdendrogram(hclust_AsSbNi)
                      
                      
    hclust$clust_col <- cutree(hclust_AsSbNi, k=4)
    hclust$clust_col <- as.factor(hclust$clust_col)
                  
    scatter_1 <- scatter_dlog(hclust, "As", "Ni", clust_col)
    scatter_2 <- scatter_dlog(hclust, "As", "Sb", clust_col)
    scatter_3 <- scatter_dlog(hclust, "Sb", "Ni", clust_col)
    scatter_4 <- scatter_dlog(hclust, "Ag", "Bi", clust_col)
    scatter <- list(scatter_1, scatter_2, scatter_3, scatter_4)
    plot_grid(plotlist = scatter)
    
    histo(hclust, "AsSbNi", clust_col, 0.01) + xlim(0,8)
    
  ##Export für Datenbank ----
    col_exp <- hclust[, c("ca_id", "part_id", "site_id", "mclust", "clust_hard", "clust_col")]
    write_csv(col_exp, file="mclust.csv")
}

#Korrospondenzanalysen (col und leg) ----
{
  ##zwischen mclust und leg----
    hclust.leg_mclust <- hclust(hclust[,c("clust_leg", "mclust")])
}