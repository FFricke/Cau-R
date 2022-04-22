query_clust_count_raw <- dbSendQuery(con,
                                     "SELECT culture_en, find_character_id, find_character_en, clust_e, count(ca_id)
                                  FROM cau.clust_e JOIN cau.ca USING (ca_id, site_id) JOIN cau.site USING (site_id) JOIN cau.find USING (find_id, site_id) JOIN cau.find_character USING (find_character_id) JOIN cau.feature USING (feature_id, site_id) JOIN cau.culture USING (culture_id)
                                  GROUP BY culture_en, find_character_id, find_character_en, clust_e;")

clust_count <- dbFetch(query_clust_count_raw)

clust_count <- rename(clust_count, find_character = find_character_en)
clust_count <- rename(clust_count, culture = culture_en)
clust_count$clust_e <- as.numeric(clust_count$clust_e)
clust_count$count <- as.numeric(clust_count$count)
clust_count$find_character_id <- as.character(clust_count$find_character_id)