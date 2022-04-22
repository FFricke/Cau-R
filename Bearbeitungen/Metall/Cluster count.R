filter_clust_count <- filter(clust_count, culture=="Maykop" | culture=="Kura-Arax")

ggplot(filter_clust_count,
  aes(x=clust_e, y=count)) +
  geom_col(aes(fill=find_character)) + 
  facet_grid(rows = vars(find_character_id), cols=vars(culture)) +
  theme_bw() + xlab("cluster")

ggplot(filter_clust_count,
       aes(x=find_character_id, y=count)) +
  geom_col(aes(fill=find_character)) + 
  facet_grid(rows = vars(clust_e), cols=vars(culture)) +
  theme_bw() + xlab("cluster")