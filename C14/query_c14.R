source("connect_db.R")
query_c14_raw <- dbSendQuery(con, 
                             "select c14_id, site_id, site_dt, feature_id, feature, region_id, culture_en, culture_id, zt_dt, zt_id, zt_type_id, material, lab_number, cra, error, avg(ars), percentile_disc(0.5) within group (order by ars) as median, percentile_disc(0.157) within group (order by ars) as onesigma_1, percentile_disc(0.839) within group (order by ars) as onesigma_2, percentile_disc(0.021) within group (order by ars) as twosigma_1, percentile_disc(0.979) within group (order by ars) as twosigma_2
                             from cau.c14 left join cau.ca using (site_id) left join cau.site using (site_id) left join cau.feature using (feature_id, site_id) left join cau.culture using (culture_id) left join cau.zt using (zt_id, zt_type_id) left join cau.material using (material_id)
                             group by c14_id, site_id, site_dt, feature_id, feature, region_id, culture_en, culture_id, zt_dt, zt_id, zt_type_id, material, lab_number ,cra, error;
                             ;")

c14 <- dbFetch(query_c14_raw)

c14 <- rename(c14, site = site_dt)
c14 <- rename(c14, culture = culture_en)
c14 <- rename(c14, zt = zt_dt)
c14$site_id <- as.factor(c14$site_id)
c14$culture_id <- as.factor(c14$culture_id)
c14$region_id <- as.factor(c14$region_id)
c14$avg <- replace(c14$avg, is.na(c14$avg), 0)
c14$median <- replace(c14$median, is.na(c14$median), 0)
c14$onesigma_1 <- replace(c14$onesigma_1, is.na(c14$onesigma_1), 0)
c14$onesigma_2 <- replace(c14$onesigma_2, is.na(c14$onesigma_2), 0)
c14$twosigma_1 <- replace(c14$twosigma_1, is.na(c14$twosigma_1), 0)
c14$twosigma_2 <- replace(c14$twosigma_2, is.na(c14$twosigma_2), 0)

