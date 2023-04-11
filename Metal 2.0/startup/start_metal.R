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
  
  elements <- names(ca[23:33])
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

