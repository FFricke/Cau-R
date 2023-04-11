#Startup----
library(shiny)
library(shinyWidgets)
library(leaflet)

library(ggplot2)
library(dplyr)
library(purrr)
library(tidyr)
library(sf)
library(sp)
library(RPostgreSQL)
library(ggdendro)
library(hrbrthemes)
library(FactoMineR)
library(factoextra)
library(ggnewscale)

#Attributes----
{
  heightLegend <- 100
  options(scipen = 999)
  contx <- scale_x_continuous()
  logx <- scale_x_log10()
  variab <- c("Cultures" = "culture_id",
              "Regions" = "region_id",
              "Typological Groups" = "find_character_id",
              "Cluster" = "mclust",
              "Cluster Group" = "mclust_group",
              "Periods" = "zt_id",
              "Period-Groups" = "zt_group_id")
  
  con <- dbConnect(drv = dbDriver("PostgreSQL"),
                   host = "archmetal.nerdnose.net",
                   dbname = "postgres",
                   user = "postgres",
                   password = "Postgresfo24")
  
  culture.import <- dbGetQuery(con, "
                        select culture_id, culture_en, culture_dt, color, shape
                        from cau.culture join cau.feature  using (culture_id) join cau.site using (site_id)
                        where region_id=1 or region_id = 2 or region_id = 3 or region_id = 4 or region_id = 5 or region_id = 6 or region_id = 17 or region_id = 18 or region_id = 19 or region_id = 20 or region_id = 21 
                        group by culture_id, culture_en, culture_dt, color, shape
                        order by culture_en
                        ")
  
  culture_id <- list(
    setNames(culture.import$color, culture.import$culture_id),
    setNames(culture.import$culture_en, culture.import$culture_id),
    setNames(culture.import$culture_dt, culture.import$culture_id),
    setNames(culture.import$shape, culture.import$culture_id))
  
  names(culture_id) <- c("col", "en", "dt", "shape")
  
  find_character.import <- dbGetQuery(con, "select * from cau.find_character")
  
  find_character_id <-  list(
    setNames(find_character.import$color, find_character.import$find_character_id),
    setNames(find_character.import$find_character_en, find_character.import$find_character_id),
    setNames(find_character.import$find_character_dt, find_character.import$find_character_id),
    setNames(find_character.import$shape, find_character.import$find_character_id))
  
  names(find_character_id) <- c("col", "en", "dt", "shape")
  
  region.import <- dbGetQuery(con, "select * from cau.region 
                       where region_id=1 or region_id = 2 or region_id = 3 or region_id = 4 or region_id = 5 or region_id = 6 or region_id = 17 or region_id = 18 or region_id = 19 or region_id = 20 or region_id = 21 or region_id = 22 or region_id = 23 or region_id = 24 or region_id = 26
                      ")
  
  region_id <- list(
    setNames(region.import$color, region.import$region_id),
    setNames(region.import$region_en, region.import$region_id),
    setNames(region.import$region_dt, region.import$region_id),
    setNames(region.import$shape, region.import$region_id))
  
  names(region_id) <- c("col", "en", "dt", "shape")
  
  site.import <- dbGetQuery(con, "select site_id, site_dt from cau.site
                     where region_id=1 or region_id = 2 or region_id = 3 or region_id = 4 or region_id = 5 or region_id = 6 or region_id = 17 or region_id = 18 or region_id = 19 or region_id = 20 or region_id = 21 or region_id = 22 or region_id = 23 or region_id = 24 or region_id = 26
                     ")
  
  site_id <- list(
    setNames(site.import$site_dt, site.import$site_id),
    setNames(site.import$site_dt, site.import$site_id))
  
  names(site_id) <- c("en", "dt")
  
  zt.import <- dbGetQuery(con, 
                          "
                  select zt_id, zt_en, zt_dt, min, max, color, shape
                  from cau.zt join cau.feature using (zt_id) join cau.site using (site_id) join cau.find using (feature_id, site_id)
                  where region_id=1 or region_id = 2 or region_id = 3 or region_id = 4 or region_id = 5 or region_id = 6 or region_id = 17 or region_id = 18 or region_id = 19 or region_id = 20 or region_id = 21 or region_id = 22 or region_id = 23 or region_id = 24 or region_id = 26
                  group by zt_id, zt_en, zt_dt, min, max, color, shape
                  order by min, max
                  ")
  
  zt.import$choice_en   <- paste0(zt.import$zt_en, "(", zt.import$min, "-", zt.import$max, ")")
  zt.import$choice_dt   <- paste0(zt.import$zt_dt, "(", zt.import$min, "-", zt.import$max, ")")
  
  zt_id <- list(
    setNames(zt.import$color, zt.import$zt_id),
    setNames(zt.import$shape, zt.import$zt_id),
    setNames(zt.import$choice_en, zt.import$zt_id),
    setNames(zt.import$choice_dt, zt.import$zt_id))
  
  names(zt_id) <- c("col", "shape", "en", "dt")
  
  zt_group.import <- dbGetQuery(con, "select * from cau.zt_group;")
  
  zt_group_id <-  list(
    setNames(zt_group.import$color, zt_group.import$zt_group_id),
    setNames(zt_group.import$zt_group_en, zt_group.import$zt_group_id),
    setNames(zt_group.import$zt_group_dt, zt_group.import$zt_group_id),
    setNames(zt_group.import$shape, zt_group.import$zt_group_id))
  
  names(zt_group_id) <- c("col", "en", "dt", "shape")
  
  mclust.import <- dbGetQuery(con,
                              "select * from cau.mclust")
  mclust <- list(
    setNames(mclust.import$color, mclust.import$mclust),
    setNames(mclust.import$mclust_en, mclust.import$mclust),
    setNames(mclust.import$mclust_dt, mclust.import$mclust),
    setNames(mclust.import$shape, mclust.import$mclust)
  )
  names(mclust) <- c("col", "en", "dt", "shape")
  
  mclust_group.import <- dbGetQuery(con,
                                    "select * from cau.mclust_group")
  mclust_group <- list(
    setNames(mclust_group.import$color, mclust_group.import$mclust_group),
    setNames(mclust_group.import$mclust_group_en, mclust_group.import$mclust_group),
    setNames(mclust_group.import$mclust_group_dt, mclust_group.import$mclust_group),
    setNames(mclust_group.import$shape, mclust_group.import$mclust_group)
  )
  names(mclust_group) <- c("col", "en", "dt", "shape")
  
  mountain.import <- dbGetQuery(con,
                                "select * from ore.mountain")
  mountain_id <- list(
    setNames(mountain.import$color, mountain.import$mountain_id),
    setNames(mountain.import$mountain, mountain.import$mountain_id),
    setNames(mountain.import$mountain, mountain.import$mountain_id)
  )
  names(mountain_id) <- c("col", "en", "dt")
  
}

#Import Datasets----
{
  ##Import Sites----
  {
    sites <- st_read(con, 
                     query = 
                       "
                  select site_id, site_dt, culture_id, culture_en, region_id, region_en, zt_id, zt_en, min, max, geography, sn1, sn2, pb1, pb2, zn1, zn2, bi1, bi2, ag1, ag2, sb1, sb2, as1, as2, fe1, fe2, ni1, ni2, co1, co2, au1, au2
                  from cau.site join cau.find using (site_id) join cau.feature using (site_id, feature_id) join cau.geography using (geography_id) join cau.zt using (zt_id) join cau.culture using (culture_id) join cau.region using (region_id) left join cau.ca_zt using (site_id, zt_id)
                  where region_id=1 or region_id = 2 or region_id = 3 or region_id = 4 or region_id = 5 or region_id = 6 or region_id = 17 or region_id = 18 or region_id = 19 or region_id = 20 or region_id = 21 or region_id = 22 or region_id = 23 or region_id = 24 or region_id = 26
                  group by site_id, site_dt, culture_id, culture_en, region_id, region_en, zt_id, zt_en, min, max, geography, sn1, sn2, pb1, pb2, zn1, zn2, bi1, bi2, ag1, ag2, sb1, sb2, as1, as2, fe1, fe2, ni1, ni2, co1, co2, au1, au2;
                  ")
    
    sites$lng <- as.data.frame((st_coordinates(sites)))$X
    sites$lat <- as.data.frame((st_coordinates(sites)))$Y
    sites <- rename(sites, region=region_en)
    sites <- rename(sites, culture=culture_en)
    sites <- rename(sites, zt=zt_en)
    sites <- merge(sites,
                   data.frame(culture_id = names(culture_id$col), col = unname(culture_id$col)),
                   by= "culture_id")
    sites <- rename(sites, Sn1 = sn1)
    sites <- rename(sites, Pb1 = pb1)
    sites <- rename(sites, Zn1 = zn1)
    sites <- rename(sites, Bi1 = bi1)
    sites <- rename(sites, Ag1 = ag1)
    sites <- rename(sites, Sb1 = sb1)
    sites <- rename(sites, As1 = as1)
    sites <- rename(sites, Fe1 = fe1)
    sites <- rename(sites, Ni1 = ni1)
    sites <- rename(sites, Co1 = co1)
    sites <- rename(sites, Au1 = au1)
    sites <- rename(sites, Sn2 = sn2)
    sites <- rename(sites, Pb2 = pb2)
    sites <- rename(sites, Zn2 = zn2)
    sites <- rename(sites, Bi2 = bi2)
    sites <- rename(sites, Ag2 = ag2)
    sites <- rename(sites, Sb2 = sb2)
    sites <- rename(sites, As2 = as2)
    sites <- rename(sites, Fe2 = fe2)
    sites <- rename(sites, Ni2 = ni2)
    sites <- rename(sites, Co2 = co2)
    sites <- rename(sites, Au2 = au2)
    
    sites$Cu1 <- replace_na(sites$Cu1, 0.001)
    sites$Sn1 <- replace_na(sites$Sn1, 0.001)
    sites$Pb1 <- replace_na(sites$Pb1, 0.001)
    sites$Zn1 <- replace_na(sites$Zn1, 0.001)
    sites$Bi1 <- replace_na(sites$Bi1, 0.001)
    sites$Ag1 <- replace_na(sites$Ag1, 0.001)
    sites$Sb1 <- replace_na(sites$Sb1, 0.001)
    sites$As1 <- replace_na(sites$As1, 0.001)
    sites$Fe1 <- replace_na(sites$Fe1, 0.001)
    sites$Co1 <- replace_na(sites$Co1, 0.001)
    sites$Ni1 <- replace_na(sites$Ni1, 0.001)
    sites$Au1 <- replace_na(sites$Au1, 0.001)
    sites$Sn1[sites$Sn1==0] <- 0.001
    sites$Pb1[sites$Pb1==0] <- 0.001
    sites$Zn1[sites$Zn1==0] <- 0.001
    sites$Bi1[sites$Bi1==0] <- 0.001
    sites$Ag1[sites$Ag1==0] <- 0.001
    sites$Sb1[sites$Sb1==0] <- 0.001
    sites$As1[sites$As1==0] <- 0.001
    sites$Fe1[sites$Fe1==0] <- 0.001
    sites$Co1[sites$Co1==0] <- 0.001
    sites$Ni1[sites$Ni1==0] <- 0.001
    sites$Au1[sites$Au1==0] <- 0.001
    sites$Sn1[sites$Sn1==0.0001] <- 0.001
    sites$Pb1[sites$Pb1==0.0001] <- 0.001
    sites$Zn1[sites$Zn1==0.0001] <- 0.001
    sites$Bi1[sites$Bi1==0.0001] <- 0.001
    sites$Ag1[sites$Ag1==0.0001] <- 0.001
    sites$Sb1[sites$Sb1==0.0001] <- 0.001
    sites$As1[sites$As1==0.0001] <- 0.001
    sites$Fe1[sites$Fe1==0.0001] <- 0.001
    sites$Co1[sites$Co1==0.0001] <- 0.001
    sites$Ni1[sites$Ni1==0.0001] <- 0.001
    sites$Au1[sites$Au1==0.0001] <- 0.001
    
    sites$Sn2 <- replace_na(sites$Sn2, 0.001)
    sites$Pb2 <- replace_na(sites$Pb2, 0.001)
    sites$Zn2 <- replace_na(sites$Zn2, 0.001)
    sites$Bi2 <- replace_na(sites$Bi2, 0.001)
    sites$Ag2 <- replace_na(sites$Ag2, 0.001)
    sites$Sb2 <- replace_na(sites$Sb2, 0.001)
    sites$As2 <- replace_na(sites$As2, 0.001)
    sites$Fe2 <- replace_na(sites$Fe2, 0.001)
    sites$Co2 <- replace_na(sites$Co2, 0.001)
    sites$Ni2 <- replace_na(sites$Ni2, 0.001)
    sites$Au2 <- replace_na(sites$Au2, 0.001)
    sites$Sn2[sites$Sn2==0] <- 0.001
    sites$Pb2[sites$Pb2==0] <- 0.001
    sites$Zn2[sites$Zn2==0] <- 0.001
    sites$Bi2[sites$Bi2==0] <- 0.001
    sites$Ag2[sites$Ag2==0] <- 0.001
    sites$Sb2[sites$Sb2==0] <- 0.001
    sites$As2[sites$As2==0] <- 0.001
    sites$Fe2[sites$Fe2==0] <- 0.001
    sites$Co2[sites$Co2==0] <- 0.001
    sites$Ni2[sites$Ni2==0] <- 0.001
    sites$Au2[sites$Au2==0] <- 0.001
    sites$Sn2[sites$Sn2==0.0001] <- 0.001
    sites$Pb2[sites$Pb2==0.0001] <- 0.001
    sites$Zn2[sites$Zn2==0.0001] <- 0.001
    sites$Bi2[sites$Bi2==0.0001] <- 0.001
    sites$Ag2[sites$Ag2==0.0001] <- 0.001
    sites$Sb2[sites$Sb2==0.0001] <- 0.001
    sites$As2[sites$As2==0.0001] <- 0.001
    sites$Fe2[sites$Fe2==0.0001] <- 0.001
    sites$Co2[sites$Co2==0.0001] <- 0.001
    sites$Ni2[sites$Ni2==0.0001] <- 0.001
    sites$Au2[sites$Au2==0.0001] <- 0.001
    
    sites <- rename(sites, site=site_dt)
    elements <- names(ca[23:33])
  }
  
  #Import CA ----
  {
    ca <- dbGetQuery(con,
                     "
                  SELECT find_id, part_id, site_id, site_dt, ca_id, culture_id, culture_en, zt_id, zt_group_id, region_id, region_en, min, max, find_character_id, find_character_en, type_id, main_id, mclust, mclust_group, clust_hard, clust_col, cu, sn, pb, zn, bi, ag, sb, ars, fe, ni, co, au 
                  FROM cau.ca JOIN cau.find USING (find_id, site_id) JOIN cau.mclust USING (mclust) JOIN cau.feature USING (feature_id, site_id) join cau.site using (site_id) join cau.zt using (zt_id) join cau.culture using (culture_id) join cau.region using (region_id) join cau.find_character using (find_character_id)
                  WHERE main_id=1 and (region_id=1 or region_id = 2 or region_id = 3 or region_id = 4 or region_id = 5 or region_id = 6 or region_id = 17 or region_id = 18 or region_id = 19 or region_id = 20 or region_id = 21 or region_id = 22 or region_id = 23 or region_id = 24 or region_id = 26) 
                  GROUP BY find_id, part_id, site_id, site_dt, ca_id, culture_id, culture_en, zt_id, zt_group_id, region_id, region_en, min, max, find_character_id, find_character_en, type_id, main_id, mclust, mclust_group, clust_hard, clust_col, cu, sn, pb, zn, bi, ag, sb, ars, fe, ni, co, au;
                  ")
    ca <- rename(ca, region=region_en)
    ca <- rename(ca, culture=culture_en)
    ca <- rename(ca, find_character=find_character_en)
    ca <- rename(ca, site=site_dt)
    ca <- rename(ca, Cu = cu)
    ca <- rename(ca, Sn = sn)
    ca <- rename(ca, Pb = pb)
    ca <- rename(ca, Zn = zn)
    ca <- rename(ca, Bi = bi)
    ca <- rename(ca, Ag = ag)
    ca <- rename(ca, Sb = sb)
    ca <- rename(ca, As = ars)
    ca <- rename(ca, Fe = fe)
    ca <- rename(ca, Ni = ni)
    ca <- rename(ca, Co = co)
    ca <- rename(ca, Au = au)
    ca$culture_id <- as.character(ca$culture_id)
    ca$find_character_id <- as.character(ca$find_character_id)
    ca$zt_id <- as.character(ca$zt_id)
    ca$region_id <- as.character(ca$region_id)
    ca$mclust <- as.factor(ca$mclust)
    ca$mclust_group <- as.factor(ca$mclust_group)
    ca$clust_hard <- as.factor(ca$clust_hard)
    ca$clust_col <- as.factor(ca$clust_col)
    ca$zt_group_id <- as.factor(ca$zt_group_id)
    
    
    ca$Cu <- replace_na(ca$Cu, 0.001)
    ca$Sn <- replace_na(ca$Sn, 0.001)
    ca$Pb <- replace_na(ca$Pb, 0.001)
    ca$Zn <- replace_na(ca$Zn, 0.001)
    ca$Bi <- replace_na(ca$Bi, 0.001)
    ca$Ag <- replace_na(ca$Ag, 0.001)
    ca$Sb <- replace_na(ca$Sb, 0.001)
    ca$As <- replace_na(ca$As, 0.001)
    ca$Fe <- replace_na(ca$Fe, 0.001)
    ca$Co <- replace_na(ca$Co, 0.001)
    ca$Ni <- replace_na(ca$Ni, 0.001)
    ca$Au <- replace_na(ca$Au, 0.001)
    
    ca$Cu[ca$Cu==0] <- 0.001
    ca$Sn[ca$Sn==0] <- 0.001
    ca$Pb[ca$Pb==0] <- 0.001
    ca$Zn[ca$Zn==0] <- 0.001
    ca$Bi[ca$Bi==0] <- 0.001
    ca$Ag[ca$Ag==0] <- 0.001
    ca$Sb[ca$Sb==0] <- 0.001
    ca$As[ca$As==0] <- 0.001
    ca$Fe[ca$Fe==0] <- 0.001
    ca$Co[ca$Co==0] <- 0.001
    ca$Ni[ca$Ni==0] <- 0.001
    ca$Au[ca$Au==0] <- 0.001
    
    ca$Cu[ca$Cu==0.0001] <- 0.001
    ca$Sn[ca$Sn==0.0001] <- 0.001
    ca$Pb[ca$Pb==0.0001] <- 0.001
    ca$Zn[ca$Zn==0.0001] <- 0.001
    ca$Bi[ca$Bi==0.0001] <- 0.001
    ca$Ag[ca$Ag==0.0001] <- 0.001
    ca$Sb[ca$Sb==0.0001] <- 0.001
    ca$As[ca$As==0.0001] <- 0.001
    ca$Fe[ca$Fe==0.0001] <- 0.001
    ca$Co[ca$Co==0.0001] <- 0.001
    ca$Ni[ca$Ni==0.0001] <- 0.001
    ca$Au[ca$Au==0.0001] <- 0.001
  }
  
  #Import-Pb----
  {
    pb <- dbGetQuery(con,
                     "SELECT find_id, part_id, site_id, site_dt, ca_id, culture_id, culture_en, zt_id, zt_group_id, region_id, region_en, min, max, find_character_id, find_character_en, type_id, main_id, mclust, mclust_group, clust_hard, clust_col, cu, sn, pb, zn, bi, ag, sb, ars, fe, ni, co, au, pb206_204, pb207_204, pb208_204, pb207_206, pb208_206
                      FROM cau.pb  join cau.ca using (site_id, find_id, part_id) JOIN cau.find USING (find_id, site_id) JOIN cau.mclust USING (mclust) JOIN cau.feature USING (feature_id, site_id) join cau.site using (site_id) join cau.zt using (zt_id) join cau.culture using (culture_id) join cau.region using (region_id) join cau.find_character using (find_character_id)
                      WHERE main_id=1 and (region_id=1 or region_id = 2 or region_id = 3 or region_id = 4 or region_id = 5 or region_id = 6 or region_id = 17 or region_id = 18 or region_id = 19 or region_id = 20 or region_id = 21 or region_id = 22 or region_id = 23 or region_id = 24 or region_id = 26) 
                      GROUP BY find_id, part_id, site_id, site_dt, ca_id, culture_id, culture_en, zt_id, zt_group_id, region_id, region_en, min, max, find_character_id, find_character_en, type_id, main_id, mclust, mclust_group, clust_hard, clust_col, cu, sn, pb, zn, bi, ag, sb, ars, fe, ni, co, au, pb206_204, pb207_204, pb208_204, pb207_206, pb208_206;
                    ")
    pb <- rename(pb, region=region_en)
    pb <- rename(pb, culture=culture_en)
    pb <- rename(pb, find_character=find_character_en)
    pb <- rename(pb, site=site_dt)
    pb <- rename(pb, Cu = cu)
    pb <- rename(pb, Sn = sn)
    pb <- rename(pb, Pb = pb)
    pb <- rename(pb, Zn = zn)
    pb <- rename(pb, Bi = bi)
    pb <- rename(pb, Ag = ag)
    pb <- rename(pb, Sb = sb)
    pb <- rename(pb, As = ars)
    pb <- rename(pb, Fe = fe)
    pb <- rename(pb, Ni = ni)
    pb <- rename(pb, Co = co)
    pb <- rename(pb, Au = au)
    pb$culture_id <- as.character(pb$culture_id)
    pb$find_character_id <- as.character(pb$find_character_id)
    pb$zt_id <- as.character(pb$zt_id)
    pb$region_id <- as.character(pb$region_id)
    pb$mclust <- as.factor(pb$mclust)
    pb$mclust_group <- as.factor(pb$mclust_group)
    pb$clust_hard <- as.factor(pb$clust_hard)
    pb$clust_col <- as.factor(pb$clust_col)
    pb$zt_group_id <- as.factor(pb$zt_group_id)
    
    
    pb$Cu <- replace_na(pb$Cu, 0.001)
    pb$Sn <- replace_na(pb$Sn, 0.001)
    pb$Pb <- replace_na(pb$Pb, 0.001)
    pb$Zn <- replace_na(pb$Zn, 0.001)
    pb$Bi <- replace_na(pb$Bi, 0.001)
    pb$Ag <- replace_na(pb$Ag, 0.001)
    pb$Sb <- replace_na(pb$Sb, 0.001)
    pb$As <- replace_na(pb$As, 0.001)
    pb$Fe <- replace_na(pb$Fe, 0.001)
    pb$Co <- replace_na(pb$Co, 0.001)
    pb$Ni <- replace_na(pb$Ni, 0.001)
    pb$Au <- replace_na(pb$Au, 0.001)
    
    pb$Cu[pb$Cu==0] <- 0.001
    pb$Sn[pb$Sn==0] <- 0.001
    pb$Pb[pb$Pb==0] <- 0.001
    pb$Zn[pb$Zn==0] <- 0.001
    pb$Bi[pb$Bi==0] <- 0.001
    pb$Ag[pb$Ag==0] <- 0.001
    pb$Sb[pb$Sb==0] <- 0.001
    pb$As[pb$As==0] <- 0.001
    pb$Fe[pb$Fe==0] <- 0.001
    pb$Co[pb$Co==0] <- 0.001
    pb$Ni[pb$Ni==0] <- 0.001
    pb$Au[pb$Au==0] <- 0.001
    
    pb$Cu[pb$Cu==0.0001] <- 0.001
    pb$Sn[pb$Sn==0.0001] <- 0.001
    pb$Pb[pb$Pb==0.0001] <- 0.001
    pb$Zn[pb$Zn==0.0001] <- 0.001
    pb$Bi[pb$Bi==0.0001] <- 0.001
    pb$Ag[pb$Ag==0.0001] <- 0.001
    pb$Sb[pb$Sb==0.0001] <- 0.001
    pb$As[pb$As==0.0001] <- 0.001
    pb$Fe[pb$Fe==0.0001] <- 0.001
    pb$Co[pb$Co==0.0001] <- 0.001
    pb$Ni[pb$Ni==0.0001] <- 0.001
    pb$Au[pb$Au==0.0001] <- 0.001
  }
  ##Import ore ----
  {
    ore <- dbGetQuery(con,
                      "select inv, material, site, mountain_id, region, pb206_204, pb207_204, pb208_204 
                      from ore.pb join ore.site using (site_id) join ore.mountain  using (mountain_id) join ore.region using (region_id) join ore.material using (material_id)
                      group by inv, material, site, mountain_id, region, pb206_204, pb207_204, pb208_204;")
    ore$mountain_id <- as.factor(ore$mountain_id)
  }
}



#Functions----
{
  desginLegend <- function()
  {
    guides(color=guide_legend(title=NULL, nrow=3, byrow=TRUE), shape=guide_legend(title=NULL, nrow=3, byrow=TRUE), fill=guide_legend(title=NULL, nrow=3, byrow=TRUE))
  }
  
  ##Basic Diagramms----
  {
    scatter <- function(data, x, y, var)
    {
      ggplot(
        data = data, aes(x = .data[[x]], y = .data[[y]])) +
        geom_point(
          aes(color={{var}}, shape={{var}})) +
        coord_fixed(ratio = 1) + 
        theme_bw() +
        theme(legend.position = "top", legend.direction = "horizontal") +
        desginLegend() +
        scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
        scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force)
    }
    
    scatter_dlog <- function(data, x, y, var)
    {
      ggplot(
        data = data, aes(x = .data[[x]], y = .data[[y]])) +
        geom_point(
          aes(color={{var}}, shape={{var}})) +
        coord_fixed(ratio = 1) + 
        theme_bw() +
        theme(legend.position = "top", legend.direction = "horizontal") +
        desginLegend() +
        scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
        scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force) +
        scale_x_log10() + scale_y_log10()
    }
    
    histo <- function(data, x, var, bin)
    {
      ggplot(
        data = data, aes(x = .data[[x]])) +
        geom_histogram(binwidth = bin,
                       aes(fill={{var}})) + 
        theme_bw() +
        theme(legend.position = "bottom", legend.direction = "horizontal") +
        desginLegend() +
        scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
    }
    
    histo_log <- function(data, x, var, bin)
    {
      ggplot(
        data = data, aes(x = .data[[x]])) +
        geom_histogram(binwidth = bin,
                       aes(fill={{var}})) +
        scale_x_log10() + 
        theme_bw() +
        theme(legend.position = "none") +
        desginLegend() +
        scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
    }
    
    histo_log_fac <- function(data, x, var, bin, fac)
    {
      ggplot(
        data = data, aes(x = .data[[x]])) +
        geom_histogram(binwidth = bin,
                       aes(fill={{var}})) +
        scale_x_log10() + 
        theme_bw() +
        theme(legend.position = "none") +
        desginLegend() +
        scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force) +
        facet_grid(rows = vars({{fac}}), scales = "free", labeller = labeller(.rows = c(fac$en)))
    }
    
    histo_fac <- function(data, x, var, bin, fac)
    {
      ggplot(
        data = data, aes(x = .data[[x]])) +
        geom_histogram(binwidth = bin,
                       aes(fill={{var}})) +
        theme_bw() +
        theme(legend.position = "none") +
        desginLegend() +
        scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force) +
        facet_grid(rows = vars({{fac}}), scales = "free", labeller = labeller(.rows = c(fac$en)))
    }
    
    box_log <- function(data, x, var)
    {
      ggplot(
        data = data, aes(x = .data[[x]])) +
        geom_boxplot(
          aes(fill={{var}})) +
        scale_x_log10() + 
        theme_bw() +
        guides(fill=guide_legend(title=NULL))+
        scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
    }
    
    box <- function(data, x, var)
    {
      ggplot(
        data = data, aes(x = .data[[x]])) +
        geom_boxplot(
          aes(fill={{var}})) +
        theme_bw() +
        guides(fill=guide_legend(title=NULL))+
        scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
    }
    
    bar <- function(data, x, var)
    {
      ggplot(
        data = data, aes(.data[[x]])) +
        geom_bar(aes(fill={{var}})) + 
        theme_bw() +
        theme(legend.position = "none", strip.text.y = element_text(angle = 0)) +
        desginLegend() +
        scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force) + 
        scale_x_discrete(labels = c(var$en))
    }
    
    bar_facet <- function(data, x, var, fac)
    {
      ggplot(
        data = data, aes(.data[[x]])) +
        geom_bar(aes(fill={{var}})) + 
        theme_bw() +
        theme(legend.position = "none", strip.text.y = element_text(angle = 0)) +
        desginLegend() +
        scale_fill_manual(values = c(var$col), limits = force) + 
        scale_x_discrete(labels = c(get(x)$en)) +
        facet_grid(rows = vars({{fac}}), scales = "free", labeller = labeller(.rows = c(fac$en)))
    }
    
    ##Pb-isotope-diagramms----
    {
      diagramm_pb_207 <- function(data, var)
      {
        ggplot(data=data,  aes(x=pb206_204, y=pb207_204)) +
          geom_point(
            aes(color={{var}}, shape={{var}})) +
          coord_fixed(ratio = 1) +
          xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[207],Pb[204]))) + 
          theme_bw() +
          desginLegend() +
          scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
          scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force)
      }
      
      diagramm_pb_208 <- function(data, var)
      {
        ggplot(data=data, aes(x=pb206_204, y=pb208_204)) +
          geom_point(
            aes(color={{var}}, shape={{var}})) +
          coord_fixed(ratio = 1) +
          xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[208],Pb[204]))) + 
          theme_bw() + 
          desginLegend() +
          scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
          scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force)
      }
    }
    
    ##Pb-isotope-diagramms----
    {
      diagramm_pb_207mod <- function(dataPb, varPb, dataOre, varOre)
      {
        ggplot(data=NULL,  aes(x=pb206_204, y=pb207_204)) +
          stat_bin_hex(data = dataOre,
                       aes(fill={{varOre}})) +
          scale_fill_manual(values = c(varOre$col), labels = c(varOre$en), limits = force) +
          new_scale_fill() +
          geom_point(data = dataPb,
                     aes(fill={{varPb}}, shape={{varPb}})) +
          scale_fill_manual(values = c(varPb$col), labels = c(varPb$en), limits = force) +
          scale_shape_manual(values = c(varPb$shape), labels = c(varPb$en), limits = force) +
          xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[207],Pb[204]))) + 
          theme_bw() +
          theme(axis.text.x = element_blank(),
                axis.ticks.x = element_blank(),
                axis.title.x = element_blank(),
                plot.margin = unit(c(5.5, 5.5, 0, 5.5), "pt")
          ) +
          coord_fixed(ratio = 1) + 
          desginLegend()
      }
      
      diagramm_pb_208mod <- function(dataPb, varPb, dataOre, varOre)
      {
        ggplot(data=NULL,  aes(x=pb206_204, y=pb208_204)) +
          stat_bin_hex(data = dataOre,
                       aes(fill={{varOre}})) +
          scale_fill_manual(values = c(varOre$col), labels = c(varOre$en), limits = force) +
          new_scale_fill() +
          geom_point(data = dataPb,
                     aes(fill={{varPb}}, shape={{varPb}})) +
          scale_fill_manual(values = c(varPb$col), labels = c(varPb$en), limits = force) +
          scale_shape_manual(values = c(varPb$shape), labels = c(varPb$en), limits = force) +
          xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[207],Pb[204]))) + 
          theme_bw() +
          theme(plot.margin = unit(c(5.5, 5.5, 0, 5.5), "pt")) +
          coord_fixed(ratio = 1) + 
          desginLegend()
      }
    }
    
    
    ##Admixture-diagramm----
    {
      ##1/Pb-isotope-diagramm----
      
      diagramm_1_pb_206 <- function(data, x, var)
      {
        ggplot(
          data = data, aes(x=1/{{x}}, y=pb206_204)) +
          geom_point(
            aes(color={{var}}, shape={{var}})) +
          scale_x_log10() +
          ylab(expression(frac(Pb[206],Pb[204]))) + 
          theme_bw() +
          desginLegend() +
          scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
          scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force)
      }
      
      diagramm_1_pb_207 <- function(data, x, var)
      {
        ggplot(
          data = data, aes(x=1/{{x}}, y=pb207_204)) +
          geom_point(
            aes(color={{var}}, shape={{var}})) +
          scale_x_log10() +
          ylab(expression(frac(Pb[207],Pb[204]))) + 
          theme_bw() +
          desginLegend() +
          scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
          scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force)
      }
      
      diagramm_1_pb_208 <- function(data, x, var)
      {
        ggplot(
          data = data, aes(x=1/{{x}}, y=pb208_204)) +
          geom_point(
            aes(color={{var}}, shape={{var}})) +
          scale_x_log10() +
          ylab(expression(frac(Pb[208],Pb[204]))) + 
          theme_bw() +
          desginLegend() +
          scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
          scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force)
      }
      
      ##x/Pb-isotope-diagramms----
      
      diagramm_el_pb_206 <- function(data, x, var)
      {
        ggplot(
          data = data, aes(x={{x}}/Pb, y=pb206_204)) +
          geom_point(size = 2,
                     aes(color={{var}}, shape={{var}}, shape={{var}})) +
          scale_x_log10() +
          ylab(expression(frac(Pb[206],Pb[204]))) + 
          theme_bw() +
          desginLegend() +
          scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
          scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force)
      }
      
      diagramm_el_pb_207 <- function(data, x, var)
      {
        ggplot(
          data = data, aes(x={{x}}/Pb, y=pb207_204)) +
          geom_point(size = 2,
                     aes(color={{var}}, shape={{var}})) +
          scale_x_log10() +
          ylab(expression(frac(Pb[207],Pb[204]))) + 
          theme_bw() +
          desginLegend() +
          scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
          scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force)
      }
      
      diagramm_el_pb_208 <- function(data, x, var)
      {
        ggplot(
          data = data, aes(x={{x}}/Pb, y=pb208_204)) +
          geom_point(size = 2,
                     aes(color={{var}}, shape={{var}})) +
          scale_x_log10() +
          ylab(expression(frac(Pb[208],Pb[204]))) + 
          theme_bw() +
          desginLegend() +
          scale_color_manual(values = c(var$col), labels = c(var$en), limits = force) +
          scale_shape_manual(values = c(var$shape), labels = c(var$en), limits = force)
      }
    }
    
    
    
  }
  
  ##UI-elements ----
  {
    histoDropdownButton <- function(inputId1, inputId2, inputId3)
    {dropdownButton(
      
      noUiSliderInput(inputId1,
                      max = 1,
                      min = 0.1,
                      value = 0.1,
                      step = 0.1,
                      label = "Diagramm Binwidth"),
      
      selectInput(inputId2,
                  label = "Element",
                  choices = names(ca[elements])
      ),
      selectInput(inputId3,
                  label = "Scale",
                  choices = c(
                    "normal" = "contx",
                    "logarithmic" = "logx"
                  )
      ),
      circle = TRUE, 
      width = "300px",
      size = "sm",
      
      tooltip = tooltipOptions(title = "Click to see inputs !")
    )}
    
    scatterDropdownButton <- function(inputIdx, inputIdy)
    {dropdownButton(
      
      selectInput(inputIdx,
                  label = "Element",
                  choices = names(ca[elements])
      ),
      
      selectInput(inputIdy,
                  label = "Element",
                  choices = names(ca[elements])
      ),
      
      circle = TRUE, 
      width = "300px",
      size = "sm",
      
      tooltip = tooltipOptions(title = "Click to see inputs !")
    )}
    
    barDropdownButton <- function(inputIdx, inputIdy)
    {dropdownButton(
      
      selectInput(inputIdx,
                  label = "x-Axis",
                  choices = variab
      ),
      
      selectInput(inputIdy,
                  label = "Rows",
                  choices = variab
      ),
      
      circle = TRUE, 
      width = "300px",
      size = "sm",
      
      tooltip = tooltipOptions(title = "Click to see inputs !")
    )}
    
    
    
    designSliders <- function(inputId1, inputId2, number)
    {
      fluidRow(
        column(6,
               noUiSliderInput(inputId1,
                               max = 250,
                               min = 35,
                               value = 100,
                               step = 5,
                               label = "Diagramm Resulution")
        ),
        column(6,
               noUiSliderInput(inputId2,
                               max = 1000,
                               min = 200,
                               value = number,
                               step = 10,
                               label = "Diagramm Size")
        )
      )
    }
    
    elementSlider <- function(InputId)
    {
      sliderTextInput(InputId,
                      choices = c(0.001, 0.01, 0.1, 1, 10, 100),
                      label = InputId,
                      grid = TRUE,
                      selected = c(0.001, 100))
    }
    swap <- function(data)
    {
      setNames(names(data),data)
    }
    
    minMaxInput <- function(inputId)
    {
      splitLayout(cellWidths = c("10%", "45%", "45%"), print(inputId), numericInput(paste0(inputId, 1), label=NULL, value = 0.001), numericInput(paste0(inputId, 2), label=NULL, value = 100))
      
    }
    
  }
  
  
}


#UI----
{
  ui <- fluidPage(
    
    sidebarLayout(
      
      ##Side-Panel----
      {
        sidebarPanel(width = 2, height = 12,
                     
                     noUiSliderInput("range", 
                                     max = max(sites$min),
                                     min = min(sites$max), 
                                     value=c(min(sites$max),max(sites$min)), 
                                     label = "Chronological Range", 
                                     step = 10,
                                     direction = "rtl"),
                     
                     pickerInput("regions",
                                 label = "Regions",
                                 choices = swap(region_id$en),
                                 multiple = TRUE,
                                 selected = unique(ca$region_id),
                                 options = list(
                                   `actions-box` = TRUE)),
                     
                     pickerInput("cultures",
                                 label = "Cultures",
                                 choices = swap(culture_id$en),
                                 multiple = TRUE,
                                 options = list(
                                   `actions-box` = TRUE)),
                     
                     pickerInput("periods",
                                 label = "Periods",
                                 choices = swap(zt_id$en),
                                 multiple = TRUE,
                                 options = list(
                                   `live-search` = TRUE,
                                   `actions-box` = TRUE)),
                     
                     pickerInput("sites",
                                 label = "Sites",
                                 choices = swap(site_id$en),
                                 multiple = TRUE,
                                 options = list(
                                   `live-search` = TRUE,
                                   `actions-box` = TRUE)),
                     
                     
                     pickerInput("mclust",
                                 label = "Cluster",
                                 choices = swap(mclust$en),
                                 multiple = TRUE,
                                 options = list(
                                   `live-search` = TRUE,
                                   `actions-box` = TRUE)),
                     
                     pickerInput("mclust_group",
                                 label = "Cluster-Groups",
                                 choices = swap(mclust_group$en),
                                 multiple = TRUE,
                                 options = list(
                                   `live-search` = TRUE,
                                   `actions-box` = TRUE)),
                     
                     pickerInput("mountains",
                                 label = "Mountain range",
                                 choices = swap(mountain_id$en),
                                 multiple = TRUE,
                                 options = list(
                                   `live-search` = TRUE,
                                   `actions-box` = TRUE)),
                     
                     pickerInput("inputVar",
                                 label = "Variable",
                                 choices = variab),
                     
                     pickerInput("find_character",
                                 label = "Typological Groups",
                                 choices = unique((arrange(ca, find_character)$find_character)),
                                 multiple = TRUE,
                                 options = list(
                                   `actions-box` = TRUE)),
                     map(elements , ~minMaxInput(.x))
                     
        )
      },
      
      #Main Panel----
      {
        mainPanel(width = 10, height = 12,
                  navbarPage("Archmetal",
                             ###Map----
                             {
                               tabPanel("Map", leafletOutput("map", width = "100%", height = 900))
                             },
                             
                             ##Scatter-Plots----
                             {
                               navbarMenu("Scatter-Plots",
                                          
                                          tabPanel("Single Plot",
                                                   fluidRow(
                                                     column(12, align = "center",
                                                            plotOutput("c_legend", height = heightLegend)
                                                     )
                                                   ),
                                                   
                                                   fluidRow(
                                                     column(12, align = "center",
                                                            scatterDropdownButton("xc1", "yc1"),
                                                            plotOutput("c1", 
                                                                       height = "100%"
                                                            )
                                                     )
                                                   ),
                                                   designSliders("resols1", "sizes1", 700)
                                                   
                                          ),
                                          
                                          tabPanel("Two Plots",
                                                   
                                                   fluidRow(
                                                     column(12, align = "center",
                                                            plotOutput("f_legend", height = heightLegend))
                                                   ),
                                                   
                                                   fluidRow(
                                                     column(6, align = "center",
                                                            scatterDropdownButton("xf1", "yf1"),
                                                            plotOutput("f1", width = "100%", height = "100%")),
                                                     column(6, align = "center",
                                                            scatterDropdownButton("xf2", "yf2"),
                                                            plotOutput("f2", width = "100%", height = "100%"))
                                                   ),
                                                   
                                                   designSliders("resols2", "sizes2", 700)
                                                   
                                                   
                                          ),
                                          
                                          tabPanel("Four Plots",
                                                   
                                                   fluidRow(
                                                     column(12, align = "center",
                                                            plotOutput("r_legend", height = heightLegend))
                                                   ),
                                                   
                                                   fluidRow(
                                                     column(6, align = "center",
                                                            scatterDropdownButton("xr1", "yr1"),
                                                            plotOutput("r1", width = "100%", height = "100%")),
                                                     column(6, align = "center",
                                                            scatterDropdownButton("xr2", "yr2"),
                                                            plotOutput("r2", width = "100%", height = "100%"))
                                                   ),
                                                   
                                                   fluidRow(
                                                     column(6,  align = "center",
                                                            scatterDropdownButton("xr3", "yr3"),
                                                            plotOutput("r3", width = "100%", height = "100%")),
                                                     column(6,  align = "center",
                                                            scatterDropdownButton("xr4", "yr4"),
                                                            plotOutput("r4", width = "100%", height = "100%"))
                                                   ),
                                                   
                                                   designSliders("resols3", "sizes3", 500)
                                                   
                                                   
                                          )
                                          
                               )
                             },
                             
                             ##Histogramms----
                             {
                               navbarMenu("Histogramms",
                                          
                                          tabPanel("One Plot",
                                                   
                                                   fluidRow(
                                                     column(12,
                                                            histoDropdownButton("bin1.1", "el1.1", "log1.1"),
                                                            plotOutput("hcul1")
                                                     )
                                                   ),
                                                   
                                                   fluidRow(
                                                     column(12,
                                                            plotOutput("hcul_legend", height = heightLegend)
                                                     )
                                                   ),
                                                   
                                                   designSliders("resolh1", "sizeh1", 700)
                                                   
                                          ),
                                          
                                          tabPanel("Two Plots",
                                                   
                                                   fluidRow(
                                                     column(12,
                                                            histoDropdownButton("bin2.1", "el2.1", "log2.1"),
                                                            plotOutput("hfchar1")
                                                     )
                                                   ),
                                                   
                                                   fluidRow(
                                                     column(12,
                                                            histoDropdownButton("bin2.2", "el2.2", "log2.2"),
                                                            plotOutput("hfchar2")
                                                     )
                                                   ),
                                                   
                                                   fluidRow(
                                                     column(12,
                                                            plotOutput("hfchar_legend", height = heightLegend)
                                                     )
                                                   ),
                                                   
                                                   designSliders("resolh2", "sizeh2", 700)
                                                   
                                          ),
                                          
                                          tabPanel("Three Plots",
                                                   
                                                   fluidRow(
                                                     column(12,
                                                            histoDropdownButton("bin3.1", "el3.1", "log3.1"),
                                                            plotOutput("hreg1")
                                                     )
                                                   ),
                                                   
                                                   fluidRow(
                                                     column(12,
                                                            histoDropdownButton("bin3.2", "el3.2", "log3.2"),
                                                            plotOutput("hreg2")
                                                     )
                                                   ),
                                                   fluidRow(
                                                     column(12,
                                                            histoDropdownButton("bin3.3", "el3.3", "log3.3"),
                                                            plotOutput("hreg3")
                                                     )
                                                   ),
                                                   fluidRow(
                                                     column(12,
                                                            plotOutput("hreg_legend", height = heightLegend)
                                                     )
                                                   ),
                                                   designSliders("resolh3", "sizeh3", 700)
                                          )
                                          
                               )
                             },
                             
                             ##Bar-Plots----
                             {
                               navbarMenu("Bar-Plots",
                                          tabPanel("Row-Facet",
                                                   fluidRow(
                                                     column(12, align = "center",
                                                            barDropdownButton("barx", "barrow"),
                                                            plotOutput("bar1", height = "100%"),
                                                            designSliders("resolbar1", "sizebar1", 700)
                                                     ) 
                                                   )
                                          )
                               )
                             },
                             
                             ##Pb-Diagramms----
                             {
                               navbarMenu("Pb-Isotope-Diagramms",
                                          tabPanel("Basic Pb-Isotopes",
                                                   fluidRow(
                                                     column(12, align = "center",
                                                            shinydashboard::box(plotOutput("pb_legend", height = heightLegend)))
                                                   ),
                                                   fluidRow(
                                                     column(12,align = "center",
                                                            shinydashboard::box(plotOutput("pbplot"),),
                                                            designSliders("resolpb1", "sizepb1", 700)
                                                     )
                                                   )
                                          )
                               )
                             },
                             
                             ##Data----
                             {
                               navbarMenu("Data",
                                          tabPanel("Chemical Analysis",
                                                   dataTableOutput("dataset_ca")),
                                          tabPanel("Sites",
                                                   dataTableOutput("dataset_sites"))
                               )
                             }
                             
                             
                  )
        )
      }
    )
  )
}

#Server ----

server <- function(input, output, session) {
  
  #Dataset-Filters----
  {  
    dataset_sites <- reactive(filter(sites, 
                                     (
                                       (min>= input$range[1] & max <= input$range[2]) &
                                         (
                                           (culture_id %in% c(input$cultures)) |
                                             (region_id %in% c(input$regions)) |
                                             (site_id %in% c(input$sites)) |
                                             (zt_id %in% c(input$periods)) 
                                         ) &
                                         (
                                           (Sn1>= input$Sn1 & Sn2 <= input$Sn2) &
                                             (Pb1>= input$Pb1 & Pb2 <= input$Pb2) &
                                             (Zn1>= input$Zn1 & Zn2 <= input$Zn2) &
                                             (Bi1>= input$Bi1 & Bi2 <= input$Bi2) &
                                             (Ag1>= input$Ag1 & Ag2 <= input$Ag2) &
                                             (Sb1>= input$Sb1 & Sb2 <= input$Sb2) &
                                             (As1>= input$As1 & As2 <= input$As2) &
                                             (Fe1>= input$Fe1 & Fe2 <= input$Fe2) &
                                             (Ni1>= input$Ni1 & Ni2 <= input$Ni2) &
                                             (Co1>= input$Co1 & Co2 <= input$Co2) &
                                             (Au1>= input$Au1 & Au2 <= input$Au2)
                                         )
                                     )
    )
    )
    
    dataset_ca  <- reactive(filter(ca, 
                                   (
                                     (min>= input$range[1] & max <= input$range[2]) &
                                       (
                                         (culture_id %in% c(input$cultures)) |
                                           (region_id %in% c(input$regions)) |
                                           (site_id %in% c(input$sites)) |
                                           (find_character %in% c(input$find_character)) |
                                           (zt_id %in% c(input$periods))|
                                           (mclust %in% c(input$mclust)) |
                                           (mclust_group %in% c(input$mclust_group))
                                       ) &
                                       (
                                         (Sn>= input$Sn1 & Sn <= input$Sn2) &
                                           (Pb>= input$Pb1 & Pb <= input$Pb2) &
                                           (Zn>= input$Zn1 & Zn <= input$Zn2) &
                                           (Bi>= input$Bi1 & Bi <= input$Bi2) &
                                           (Ag>= input$Ag1 & Ag <= input$Ag2) &
                                           (Sb>= input$Sb1 & Sb <= input$Sb2) &
                                           (As>= input$As1 & As <= input$As2) &
                                           (Fe>= input$Fe1 & Fe <= input$Fe2) &
                                           (Ni>= input$Ni1 & Ni <= input$Ni2) &
                                           (Co>= input$Co1 & Co <= input$Co2) &
                                           (Au>= input$Au1 & Au <= input$Au2)
                                       )
                                   )
    )
    )
    dataset_pb <- reactive(filter(pb,
                                  (min>= input$range[1] & max <= input$range[2]) &
                                    (
                                      (culture_id %in% c(input$cultures)) |
                                        (region_id %in% c(input$regions)) |
                                        (site_id %in% c(input$sites)) |
                                        (find_character %in% c(input$find_character)) |
                                        (zt_id %in% c(input$periods))|
                                        (mclust %in% c(input$mclust)) |
                                        (mclust_group %in% c(input$mclust_group))
                                    )
    )
    )
    dataset_ore <- reactive(filter(ore,
                                   mountain_id %in% c(input$mountains)
    )
    )
  }
  
  
  #Plot-Reactives----
  {
    ##Scatter-Plots----
    {
      c1 <- reactive({scatter_dlog(dataset_ca(), input$xc1, input$yc1, get(input$inputVar))})
      c_legend <- reactive({cowplot::get_legend(c1())})
      
      f1 <- reactive({scatter_dlog(dataset_ca(), input$xf1, input$yf1, get(input$inputVar))})
      f2 <- reactive({scatter_dlog(dataset_ca(), input$xf2, input$yf2, get(input$inputVar))})
      f_legend <- reactive({cowplot::get_legend(f1())})
      
      r1 <- reactive({scatter_dlog(dataset_ca(), input$xr1, input$yr1, get(input$inputVar))})
      r2 <- reactive({scatter_dlog(dataset_ca(), input$xr2, input$yr2, get(input$inputVar))})
      r3 <- reactive({scatter_dlog(dataset_ca(), input$xr3, input$yr3, get(input$inputVar))})
      r4 <- reactive({scatter_dlog(dataset_ca(), input$xr4, input$yr4, get(input$inputVar))})
      r_legend <- reactive({cowplot::get_legend(r1())})
    }
    
    #Histogramms----
    {
      hcul1 <- reactive({histo(dataset_ca(), input$el1.1, get(input$inputVar), input$bin1.1) + get(input$log1.1)})
      hcul_legend <- reactive({cowplot::get_legend(hcul1())})
      
      hfchar1 <- reactive({histo(dataset_ca(), input$el2.1, get(input$inputVar), input$bin2.1) + get(input$log2.1)})
      hfchar2 <- reactive({histo(dataset_ca(), input$el2.2, get(input$inputVar), input$bin2.2) + get(input$log2.2)})
      hfchar_legend <- reactive({cowplot::get_legend(hfchar1())})
      
      hreg1 <- reactive({histo(dataset_ca(), input$el3.1, get(input$inputVar), input$bin3.1) + get(input$log3.1)})
      hreg2 <- reactive({histo(dataset_ca(), input$el3.2, get(input$inputVar), input$bin3.2) + get(input$log3.2)})
      hreg3 <- reactive({histo(dataset_ca(), input$el3.3, get(input$inputVar), input$bin3.2) + get(input$log3.3)})
      hreg_legend <- reactive({cowplot::get_legend(hreg1())})
    }
    
    #Bar-Plots----
    {
      bar1 <- reactive({bar_facet(dataset_ca(), input$barx, get(input$inputVar), get(input$barrow))})
    }
    
    #Pb-Diagramms----
    {
      pb1 <- reactive({diagramm_pb_207mod(dataset_pb(), get(input$inputVar), dataset_ore(), mountain_id)})
      pb2 <- reactive({diagramm_pb_208mod(dataset_pb(), get(input$inputVar), dataset_ore(), mountain_id)})
      pbplot <- reactive({ggpubr::ggarrange(pb1() + theme(legend.position = "none"), pb2() + theme(legend.position = "none"), 
                                            ncol = 1, nrow = 2, align = "v")
      })
      pb_legend <- reactive({cowplot::get_legend(pb1())})
    }
    
    
    
  }
  
  #Plot-Rendering----
  {  
    ##Map----
    {
      output$map <- renderLeaflet({
        leaflet(dataset_sites()) %>%
          addProviderTiles(providers$Esri.WorldShadedRelief,
                           options = providerTileOptions(noWrap = TRUE)) %>%
          addCircleMarkers(fillColor = dataset_sites()$col, color = "black", opacity = 1, fillOpacity = 1, radius = 4, weight = 1)
      })
    }
    #Scatter-Plots----
    {
      observeEvent(c(input$resols1, input$sizes1), 
                   {output$c1 <- renderPlot(expr={c1() + theme(legend.position="none")},
                                            res = input$resols1, height = input$sizes1, width = input$sizes1)})
      observeEvent(input$resols1,{output$c_legend <- renderPlot(grid::grid.draw(c_legend()), res = input$resols1)})
      
      
      observeEvent(c(input$resols2, input$sizes2), 
                   {output$f1 <- renderPlot(expr={f1() + theme(legend.position="none")},
                                            res = input$resols2, height = input$sizes2, width = input$sizes2)})
      observeEvent(c(input$resols2, input$sizes2), 
                   {output$f2 <- renderPlot(expr={f2() + theme(legend.position="none")}, 
                                            res = input$resols2, height = input$sizes2, width = input$sizes2)})
      observeEvent(input$resols2, {output$f_legend <- renderPlot(grid::grid.draw(f_legend()), res = input$resols2)})
      
      
      observeEvent(c(input$resols3, input$sizes3), 
                   {output$r1 <- renderPlot(expr={r1() + theme(legend.position="none")}, 
                                            res = input$resols3, height = input$sizes3, width = input$sizes3)})
      observeEvent(c(input$resols3, input$sizes3), 
                   {output$r2 <- renderPlot(expr={r2() + theme(legend.position="none")},
                                            res = input$resols3, height = input$sizes3, width = input$sizes3)})
      observeEvent(c(input$resols3, input$sizes3), 
                   {output$r3 <- renderPlot(expr={r3() + theme(legend.position="none")}, 
                                            res = input$resols3, height = input$sizes3, width = input$sizes3)})
      observeEvent(c(input$resols3, input$sizes3), 
                   {output$r4 <- renderPlot(expr={r4() + theme(legend.position="none")},
                                            res = input$resols3, height = input$sizes3, width = input$sizes3)})
      observeEvent(input$resols3,{output$r_legend <- renderPlot(grid::grid.draw(r_legend()), res = input$resols3)})
    }
    
    #Histogramms----
    {
      observeEvent(input$resolh1, 
                   {output$hcul1 <- renderPlot(expr={hcul1() + theme(legend.position="none")}, res = input$resolh1)})
      observeEvent(input$resolh1,
                   {output$hcul_legend <- renderPlot(grid::grid.draw(hcul_legend()), res = input$resolh1)})
      
      observeEvent(input$resolh2, 
                   {output$hfchar1 <- renderPlot(expr={hfchar1() + theme(legend.position="none")}, res = input$resolh2)})
      observeEvent(input$resolh2, 
                   {output$hfchar2 <- renderPlot(expr={hfchar2() + theme(legend.position="none")}, res = input$resolh2)})
      observeEvent(input$resolh2,
                   {output$hfchar_legend <- renderPlot(grid::grid.draw(hfchar_legend()), res = input$resolh2)})
      
      observeEvent(input$resolh3, 
                   {output$hreg1 <- renderPlot(expr={hreg1() + theme(legend.position="none")}, res = input$resolh3)})
      observeEvent(input$resolh3, 
                   {output$hreg2 <- renderPlot(expr={hreg2() + theme(legend.position="none")}, res = input$resolh3)})
      observeEvent(input$resolh3, 
                   {output$hreg3 <- renderPlot(expr={hreg3() + theme(legend.position="none")}, res = input$resolh3)})
      observeEvent(input$resolh3,
                   {output$hreg_legend <- renderPlot(grid::grid.draw(hreg_legend()), res = input$resolh3)})
    }
    
    ##Bar-Plot----
    
    observeEvent(input$sizebar1,
                 {output$bar1 <- renderPlot(expr={bar1()}, height = input$sizebar1)})
    
    ##Pb-Diagramms----
    {
      observeEvent(c(input$resolpb1, input$sizepb1), 
                   {output$pbplot <- renderPlot(expr={pbplot()},
                                                res = input$resolpb1, height = input$sizepb1, width = input$sizepb1)})
      
      observeEvent(input$resolpb1, {output$pb_legend <- renderPlot(grid::grid.draw(pb_legend()), res = input$resolpb1)})
    }
    #Data----
    {
      output$dataset_ca <- renderDataTable(
        select(dataset_ca(), ca_id, find_id, site, culture, region, find_character, Sn, Pb, Zn, Bi, Ag, Sb, As, Fe, Ni, Co, Au))
      output$dataset_sites <- renderDataTable(
        select(dataset_sites(), site_id, site, culture, zt, region))
    }
    
  }
}

shinyApp(ui, server)




