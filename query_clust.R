query_clust_raw <- dbSendQuery(con, 
                               "SELECT find_id, site_dt, culture_en, ca_id, clust_e, find_character_en, type_dt, ars, sb, ni
                                FROM cau.clust_e JOIN cau.ca USING (ca_id, site_id) JOIN cau.site USING (site_id) JOIN cau.find USING (find_id, site_id) JOIN cau.find_character USING (find_character_id) JOIN cau.type USING (type_id) JOIN cau.feature USING (feature_id, site_id) JOIN cau.culture USING (culture_id)
                                GROUP BY find_id, site_dt, culture_en, ca_id, clust_e, find_character_en, type_dt, ars, sb, ni;")

clust <- dbFetch(query_clust_raw)

clust <- rename(clust, As = ars)
clust <- rename(clust, Ni = ni)
clust <- rename(clust, Sb = sb)
clust <- rename(clust, find_character = find_character_en)
clust <- rename(clust, culture = culture_en)
clust <- rename(clust, type = type_dt)
clust$clust_e <- as.character(clust$clust_e)
clust$AsNi <- clust$As/clust$Ni