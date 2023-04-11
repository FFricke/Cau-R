periods <- dbGetQuery(con, "select zt_id, zt_dt, zt_group_id, min, max 
from cau.zt join cau.feature using (zt_id) join cau.find using (site_id, feature_id) 
group by zt_id, zt_dt, min, zt_group_id, max order by min, max;")

plot(periods$min, periods$max)
periodsClust <- HCPC(periods[, c("min", "max")])

periods$zt_group_id <- as.factor(periods$zt_group_id)
ggplot(periods) + geom_point(aes(x=min, y=max, colour=zt_group_id))
