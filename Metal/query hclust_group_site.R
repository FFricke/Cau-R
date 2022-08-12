query_hclust_group_group_site_raw <- dbSendQuery(con, 
                                     "
select site_id, site_dt, culture_id, culture_en, region_id, region_en, sum(case when mclust_group=1 then 1 else 0 end) as Group1, sum(case when mclust_group=2 then 1 else 0 end) as Group2, sum(case when mclust_group=3 then 1 else 0 end) as Group3, sum(case when mclust_group=4 then 1 else 0 end) as Group4, sum(case when mclust_group=5 then 1 else 0 end) as Group5, count(mclust_group) as complete
from cau.mclust join cau.mclust_group USING (mclust) JOIN cau.site using (site_id) join cau.region using(region_id) join cau.ca using (ca_id, part_id, site_id) join cau.find using (find_id, site_id) join cau.feature using (feature_id, site_id) left join cau.culture using (culture_id) group by  site_id, site_dt, culture_id, culture_en, region_id, region_en;
")

hclust_group_site <- dbFetch(query_hclust_group_group_site_raw)

hclust_group_site$group1_proc <- hclust_group_site$group1/hclust_group_site$complete
hclust_group_site$group2_proc <- hclust_group_site$group2/hclust_group_site$complete
hclust_group_site$group3_proc <- hclust_group_site$group3/hclust_group_site$complete
hclust_group_site$group4_proc <- hclust_group_site$group4/hclust_group_site$complete
hclust_group_site$group5_proc <- hclust_group_site$group5/hclust_group_site$complete

hclust_group_site$site_id <- as.factor(hclust_group_site$site_id)
hclust_group_site$region_id <- as.factor(hclust_group_site$region_id)
hclust_group_site$culture_id <- as.factor(hclust_group_site$culture_id)