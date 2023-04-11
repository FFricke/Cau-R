##Clusteranzahl ----
{
  ###hk.1 ----
  {
   hk1Dend <- fviz_dend(hk.1)
    
   hk1Elbow <- fviz_nbclust(ca.1[, c("sdNi", "sdSb")],
                 hkmeans, method = "wss") +
      labs(subtitle = "Elbow-Methode")
    
   hk1Sil <- fviz_nbclust(ca.1[, c("sdNi", "sdSb")],
                 hkmeans, method = "silhouette") +
      labs(subtitle = "Silhouetten-Methode")
    
   hk1Gap <- fviz_nbclust(ca.1[, c("sdNi", "sdSb")],
                 hkmeans, method = "gap_stat") +
      labs(subtitle = "Gap-Methode")
   
   hk1Anz <- list(hk1Dend, hk1Elbow, hk1Sil, hk1Gap)
   
   cowplot::plot_grid(plotlist = hk1Anz, labels = c("a", "b", "c", "d"))
   ggsave("hc2Anz.jpeg", plot = last_plot(), dpi = 600, device = "jpeg",
          path = "/home/fabianf/Nextcloud/Cau-Latex/Abb/")
  }
  
  ###hc.2 ----
  {
  hc2PCA <- PCA(ca.2[, c("sdAs", "sdlogNi", "sdlogSb", "sdlogAg", "sdlogPb")])
      
  hc2Dend <- fviz_dend(hc.2)
  
  hc2Elbow <- fviz_nbclust(hc2PCA$ind$coord,
               hkmeans, method = "wss") +
    geom_vline(xintercept = 3, linetype = 2) +hkhk
    labs(subtitle = "Elbow-Methode") 
  
  hc2Sil <-  fviz_nbclust(hc2PCA$ind$coord,
               hkmeans, method = "silhouette") +
    labs(subtitle = "Silhouetten-Methode")
  
  hc2Gap <- fviz_nbclust(hc2PCA$ind$coord,
               hkmeans, method = "gap_stat") +
    labs(subtitle = "Gap-Methode")  
  
  hc2Anz <- list(hc2Dend, hc2Elbow, hc2Sil, hc2Gap)
  
  cowplot::plot_grid(plotlist = hc2Anz, labels = c("a", "b", "c", "d"))
  ggsave("hc2Anz.jpeg", plot = last_plot(), dpi = 600, device = "jpeg",
         path = "/home/fabianf/Nextcloud/Cau-Latex/Abb/")
  }
  
  ##hc.3.2 ----
  {
    hc32PCA <- PCA(ca.3.2[, c("sdlogAs", "sdlogNi", "sdlogSb", "sdlogAg", "sdlogPb")])
    
    hc32Dend <- fviz_dend(hc.3.2)
    
    hc32Elbow <- fviz_nbclust(hc2PCA$ind$coord,
                 hcut, method = "wss") +
      labs(subtitle = "Elbow-Methode")
    
    hc32Sil <- fviz_nbclust(hc2PCA$ind$coord,
                 hcut, method = "silhouette") +
      labs(subtitle = "Silhouetten-Methode")
    
    hc32Gap <- fviz_nbclust(hc2PCA$ind$coord,
                 hcut, method = "gap_stat") +
      labs(subtitle = "Gap-Methode")
    
    hc32Anz <- list(hc32Dend, hc32Elbow, hc32Sil, hc32Gap)
    
    cowplot::plot_grid(plotlist = hc32Anz, labels = c("a", "b", "c", "d"))
    ggsave("hc32Anz.jpeg", plot = last_plot(), dpi = 600, device = "jpeg",
           path = "/home/fabianf/Nextcloud/Cau-Latex/Abb/")
  }
  
  ##hc.3.3 ----
  {
    hc33PCA <- PCA(ca.3.3[, c("sdlogAs", "sdlogNi", "sdlogSb", "sdlogAg", "sdlogPb")])
    
    hc33Dend <- fviz_dend(hc.3.3)
    
    hc33Elbow <- fviz_nbclust(hc33PCA$ind$coord,
                 hcut, method = "wss") +
      labs(subtitle = "Elbow-Methode")
    
    hc33Sil <- fviz_nbclust(hc33PCA$ind$coord,
                 hcut, method = "silhouette") +
      labs(subtitle = "Silhouetten-Methode")
    
    hc33Gap <- fviz_nbclust(hc33PCA$ind$coord,
                 hcut, method = "gap_stat") +
      labs(subtitle = "Gap-Methode")
    
    hc33Anz <- list(hc33Dend, hc33Elbow, hc33Sil, hc33Gap)
    
    cowplot::plot_grid(plotlist = hc33Anz, labels = c("a", "b", "c", "d"))
    ggsave("hc33Anz.jpeg", plot = last_plot(), dpi = 600, device = "jpeg",
           path = "/home/fabianf/Nextcloud/Cau-Latex/Abb/")
  }
  
  ##hc.5.1 ----
  {
    hc51PCA <- PCA(ca.5.1[, c("sdlogAs", "sdlogSb", "sdlogPb", "sdlogAg", "sdlogNi")])
    
    hc51Dend <- fviz_dend(hc.5.1)
    
    hc51Elbow <- fviz_nbclust(hc51PCA$ind$coord, 
                 hcut, method = "wss") +
      labs(subtitle = "Elbow-Methode")
    
    hc51Sil <- fviz_nbclust(hc51PCA$ind$coord,  
                 hcut, method = "silhouette") +
      labs(subtitle = "Silhouetten-Methode")
    
    hc51Gab <- fviz_nbclust(hc51PCA$ind$coord, 
                 hcut, method = "gap_stat") +
      labs(subtitle = "Gap-Methode")
    
    hc51Anz <- list(hc51Dend, hc51Elbow, hc51Sil, hc51Gab)
    
    cowplot::plot_grid(plotlist = hc51Anz, labels = c("a", "b", "c", "d"))
    ggsave("hc51Anz.jpeg", plot = last_plot(), dpi = 600, device = "jpeg",
           path = "/home/fabianf/Nextcloud/Cau-Latex/Abb/")
  }
}