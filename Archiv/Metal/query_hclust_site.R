query_hclust_site_raw <- dbSendQuery(con, 
"
select site_id, site_dt, culture_id, culture_en, region_id, region_en, sum(case when mclust=1 then 1 else 0 end) as Cluster1, sum(case when mclust=2 then 1 else 0 end) as Cluster2, sum(case when mclust=3 then 1 else 0 end) as Cluster3, sum(case when mclust=4 then 1 else 0 end) as Cluster4, sum(case when mclust=5 then 1 else 0 end) as Cluster5, sum(case when mclust=6 then 1 else 0 end) as Cluster6, sum(case when mclust=7 then 1 else 0 end) as Cluster7, sum(case when mclust=8 then 1 else 0 end) as Cluster8, sum(case when mclust=9 then 1 else 0 end) as Cluster9, sum(case when mclust=10 then 1 else 0 end) as Cluster10, sum(case when mclust=11 then 1 else 0 end) as Cluster11, count(mclust) as complete
from cau.mclust join cau.site using (site_id) join cau.region using(region_id) join cau.ca using (ca_id, part_id, site_id) join cau.find using (find_id, site_id) join cau.feature using (feature_id, site_id) left join cau.culture using (culture_id) group by  site_id, site_dt, culture_id, culture_en, region_id, region_en;
")

hclust_site <- dbFetch(query_hclust_site_raw)

hclust_site$cluster1proc <- hclust_site$cluster1/hclust_site$complete
hclust_site$cluster2proc <- hclust_site$cluster2/hclust_site$complete
hclust_site$cluster3proc <- hclust_site$cluster3/hclust_site$complete
hclust_site$cluster4proc <- hclust_site$cluster4/hclust_site$complete
hclust_site$cluster5proc <- hclust_site$cluster5/hclust_site$complete
hclust_site$cluster6proc <- hclust_site$cluster6/hclust_site$complete
hclust_site$cluster7proc <- hclust_site$cluster7/hclust_site$complete
hclust_site$cluster8proc <- hclust_site$cluster8/hclust_site$complete
hclust_site$cluster9proc <- hclust_site$cluster9/hclust_site$complete
hclust_site$cluster10proc <- hclust_site$cluster10/hclust_site$complete
hclust_site$cluster11proc <- hclust_site$cluster11/hclust_site$complete

hclust_site$site_id <- as.factor(hclust_site$site_id)
hclust_site$region_id <- as.factor(hclust_site$region_id)
hclust_site$culture_id <- as.factor(hclust_site$culture_id)

hclust_site_filter <- filter(hclust_site, hclust_site$complete>=5)