query_hclust_reg_raw <- dbSendQuery(con, 
                            "select region_id, region_en, sum(case when mclust=1 then 1 else 0 end) as Cluster1, sum(case when mclust=2 then 1 else 0 end) as Cluster2, sum(case when mclust=3 then 1 else 0 end) as Cluster3, sum(case when mclust=4 then 1 else 0 end) as Cluster4, sum(case when mclust=5 then 1 else 0 end) as Cluster5, sum(case when mclust=6 then 1 else 0 end) as Cluster6, sum(case when mclust=7 then 1 else 0 end) as Cluster7, sum(case when mclust=8 then 1 else 0 end) as Cluster8, sum(case when mclust=9 then 1 else 0 end) as Cluster9, sum(case when mclust=10 then 1 else 0 end) as Cluster10, sum(case when mclust=11 then 1 else 0 end) as Cluster11, count(mclust) as complete
                            from cau.mclust join cau.site using (site_id) join cau.region using (region_id) group by region_id, region_en;")
hclust_reg <- dbFetch(query_hclust_reg_raw)

hclust_reg$region_id <- as.factor(hclust_reg$region_id)

hclust_reg$cluster1proc <- hclust_reg$cluster1/hclust_reg$complete
hclust_reg$cluster2proc <- hclust_reg$cluster2/hclust_reg$complete
hclust_reg$cluster3proc <- hclust_reg$cluster3/hclust_reg$complete
hclust_reg$cluster4proc <- hclust_reg$cluster4/hclust_reg$complete
hclust_reg$cluster5proc <- hclust_reg$cluster5/hclust_reg$complete
hclust_reg$cluster6proc <- hclust_reg$cluster6/hclust_reg$complete
hclust_reg$cluster7proc <- hclust_reg$cluster7/hclust_reg$complete
hclust_reg$cluster8proc <- hclust_reg$cluster8/hclust_reg$complete
hclust_reg$cluster9proc <- hclust_reg$cluster9/hclust_reg$complete
hclust_reg$cluster10proc <- hclust_reg$cluster10/hclust_reg$complete
hclust_reg$cluster11proc <- hclust_reg$cluster11/hclust_reg$complete
