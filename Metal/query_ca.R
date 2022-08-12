query_ca_raw <- dbSendQuery(con, 
                            "
SELECT find_id, part_id, site_dt, site_id, ca_id, culture_id, culture_en, zt_id, zt_type_id, region_id, region_dt, find_character_id, find_character_en, type_dt, main, clust_leg, cu, sn, pb, zn, bi, ag, sb, ars, fe, ni, co, au 
FROM cau.clust_leg LEFT JOIN cau.ca USING (ca_id, site_id, part_id) LEFT JOIN cau.site USING (site_id) LEFT JOIN cau.find USING (find_id, site_id) LEFT JOIN cau.find_character USING (find_character_id) LEFT JOIN cau.type USING (type_id) LEFT JOIN cau.feature USING (feature_id, site_id) LEFT JOIN cau.culture USING (culture_id) LEFT JOIN cau.region USING (region_id) LEFT JOIN cau.main USING (main_id)
GROUP BY find_id, part_id, site_id, site_dt, ca_id, culture_id, culture_en, zt_id, zt_type_id, region_id, region_dt, find_character_id, find_character_en, type_dt, main,  clust_leg, cu, sn, pb, zn, bi, ag, sb, ars, fe, ni, co, au;
")

ca <- dbFetch(query_ca_raw)
ca$culture_id <- as.character(ca$culture_id)
ca <- rename(ca, site = site_dt)
ca <- rename(ca, culture = culture_en)
ca <- rename(ca, region = region_dt)
ca <- rename(ca, type = type_dt)
ca <- rename(ca, find_character = find_character_en)
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
ca$find_character_id <- as.character(ca$find_character_id)
ca$zt_id <- as.character(ca$zt_id)
ca$zt_type_id <- as.character(ca$zt_type_id)
ca$clust_leg <- as.character(ca$clust_leg)
ca$region_id <- as.character(ca$region_id)


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
