query_c14_raw <- dbSendQuery(con, 
                             "select c14_id, site_id, site_dt, feature_id, feature, culture_en, zt_dt, zt_id, zt_type_id, material, lab_number, cra, error
                          from cau.c14 left join cau.site using (site_id) left join cau.feature using (feature_id, site_id) left join cau.culture using (culture_id) left join cau.zt using (zt_id, zt_type_id) left join cau.material using (material_id)
                          group by c14_id, site_id, site_dt, feature_id, feature, culture_en, zt_dt, zt_id, zt_type_id, material, lab_number ,cra, error;")

c14 <- dbFetch(query_c14_raw)

c14 <- rename(c14, site = site_dt)
c14 <- rename(c14, culture = culture_en)
c14 <- rename(c14, zt = zt_dt)