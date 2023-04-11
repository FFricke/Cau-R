##Filter##
filter_clust <- filter(clust, culture=="Maykop" | culture=="Kura-Arax")
filter_clust$SUMME <- filter_clust$As + filter_clust$Ni + filter_clust$Sb

##SUMME##
ggplot(filter_clust,
  aes(x=SUMME)) + 
  geom_histogram() +
  facet_grid(cols = vars(culture), rows = vars(clust_e)) + 
  xlim(0,15) + 
  scale_x_log10() + 
  theme_bw()

ggplot(filter_clust,
       aes(x=SUMME)) + 
  geom_boxplot() +
  facet_grid(cols = vars(culture), rows = vars(clust_e)) + 
  xlim(0,15) +
  scale_x_log10() + 
  theme_bw()


##As##
ggplot(filter_clust,
       aes(x=As)) + 
  geom_histogram() +
  facet_grid(cols = vars(culture), rows = vars(clust_e)) + 
  scale_x_log10() + 
  theme_bw()

ggplot(filter_clust,
       aes(x=As)) + 
  geom_boxplot() +
  facet_grid(cols = vars(culture), rows = vars(clust_e)) + 
  xlim(0,15) + 
  scale_x_log10() + 
  theme_bw()

ggplot(filter_clust,
       aes(x=As)) + 
  geom_boxplot() +
  facet_grid(cols = vars(culture), rows = vars(clust_e)) + 
  xlim(0,15) + 
  theme_bw()

##Sb##
ggplot(filter_clust,
       aes(x=Sb)) + 
  geom_histogram() +
  facet_grid(cols = vars(culture), rows = vars(clust_e)) + 
  scale_x_log10() + 
  theme_bw()

ggplot(filter_clust,
       aes(x=Sb)) + 
  geom_boxplot() +
  facet_grid(cols = vars(culture), rows = vars(clust_e)) + 
  scale_x_log10() + 
  theme_bw()



