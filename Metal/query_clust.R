query_clust_raw <- dbSendQuery(con, 
                               "SELECT find_id, site_dt, culture_en, ca_id, clust_leg, find_character_en, type_dt, ars, sb, ni
                                FROM cau.clust_leg LEFT JOIN cau.ca USING (ca_id, site_id) LEFT JOIN cau.site USING (site_id) LEFT JOIN cau.find USING (find_id, site_id) LEFT JOIN cau.find_character USING (find_character_id) LEFT JOIN cau.type USING (type_id) LEFT JOIN cau.feature USING (feature_id, site_id) LEFT JOIN cau.culture USING (culture_id)
                                GROUP BY find_id, site_dt, culture_en, ca_id, clust_leg, find_character_en, type_dt, ars, sb, ni;")

clust <- dbFetch(query_clust_raw)

clust <- rename(clust, As = ars)
clust <- rename(clust, Ni = ni)
clust <- rename(clust, Sb = sb)
clust <- rename(clust, find_character = find_character_en)
clust <- rename(clust, culture = culture_en)
clust <- rename(clust, type = type_dt)
clust$clust_leg <- as.character(clust$clust_leg)
clust$AsNi <- clust$As/clust$Ni
clust$As <- replace_na(clust$As, 0.0001)
clust$Sb <- replace_na(clust$Sb, 0.0001)
clust$Ni <- replace_na(clust$Ni, 0.0001)
clust$As[clust$As==0] <- 0.0001
clust$Sb[clust$Sb==0] <- 0.0001
clust$Ni[clust$Ni==0] <- 0.0001
