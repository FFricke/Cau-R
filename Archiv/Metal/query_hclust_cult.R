query_hclust_cult_raw <- dbSendQuery(con, 
                            "select culture_id, culture_en, sum(case when mclust=1 then 1 else 0 end) as Cluster1, sum(case when mclust=2 then 1 else 0 end) as Cluster2, sum(case when mclust=3 then 1 else 0 end) as Cluster3, sum(case when mclust=4 then 1 else 0 end) as Cluster4, sum(case when mclust=5 then 1 else 0 end) as Cluster5, sum(case when mclust=6 then 1 else 0 end) as Cluster6, sum(case when mclust=7 then 1 else 0 end) as Cluster7, sum(case when mclust=8 then 1 else 0 end) as Cluster8, sum(case when mclust=9 then 1 else 0 end) as Cluster9, sum(case when mclust=10 then 1 else 0 end) as Cluster10, sum(case when mclust=11 then 1 else 0 end) as Cluster11, count(mclust) as complete
                            from cau.mclust join cau.site using (site_id) join cau.ca using (ca_id, part_id, site_id) join cau.find using (find_id, site_id) join cau.feature using (feature_id, site_id) join cau.culture using (culture_id) group by culture_id, culture_en;")
hclust_cult <- dbFetch(query_hclust_cult_raw)

hclust_cult$cultion_id <- as.factor(hclust_cult$cultion_id)

hclust_cult$cluster1proc <- hclust_cult$cluster1/hclust_cult$complete
hclust_cult$cluster2proc <- hclust_cult$cluster2/hclust_cult$complete
hclust_cult$cluster3proc <- hclust_cult$cluster3/hclust_cult$complete
hclust_cult$cluster4proc <- hclust_cult$cluster4/hclust_cult$complete
hclust_cult$cluster5proc <- hclust_cult$cluster5/hclust_cult$complete
hclust_cult$cluster6proc <- hclust_cult$cluster6/hclust_cult$complete
hclust_cult$cluster7proc <- hclust_cult$cluster7/hclust_cult$complete
hclust_cult$cluster8proc <- hclust_cult$cluster8/hclust_cult$complete
hclust_cult$cluster9proc <- hclust_cult$cluster9/hclust_cult$complete
hclust_cult$cluster10proc <- hclust_cult$cluster10/hclust_cult$complete
hclust_cult$cluster11proc <- hclust_cult$cluster11/hclust_cult$complete
