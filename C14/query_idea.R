source("connect_db.R")
query_byCultures_raw <- dbSendQuery(con, 
                             "select c14_id, site_id, site_dt, region_id, culture_en, culture_id, cra, error, avg, median, onesigma_1, onesigma_2, twosigma_1, twosigma_2
                             from cau.c14 join cau.site using (site_id) left join cau.feature using (feature_id, site_id) left join cau.culture using (culture_id) left join cau.find using (site_id) left join cau.ca using (find_id, site_id) left join cau.ca_culture using (site_id, culture_id)
                             group by c14_id, site_id, site_dt, region_id, culture_en, culture_id, cra, error, avg, median, onesigma_1, onesigma_2, twosigma_1, twosigma_2
                             ;")

byCultures <- dbFetch(query_byCultures_raw)

byCultures <- rename(byCultures, site = site_dt)
byCultures <- rename(byCultures, culture = culture_en)
byCultures$site_id <- as.factor(byCultures$site_id)
byCultures$culture_id <- as.factor(byCultures$culture_id)
byCultures$region_id <- as.factor(byCultures$region_id)
byCultures$avg <- replace(byCultures$avg, is.na(byCultures$avg), 0)
byCultures$median <- replace(byCultures$median, is.na(byCultures$median), 0)
byCultures$onesigma_1 <- replace(byCultures$onesigma_1, is.na(byCultures$onesigma_1), 0)
byCultures$onesigma_2 <- replace(byCultures$onesigma_2, is.na(byCultures$onesigma_2), 0)
byCultures$twosigma_1 <- replace(byCultures$twosigma_1, is.na(byCultures$twosigma_1), 0)
byCultures$twosigma_2 <- replace(byCultures$twosigma_2, is.na(byCultures$twosigma_2), 0)

