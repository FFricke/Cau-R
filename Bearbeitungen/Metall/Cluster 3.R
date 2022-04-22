clust_e_3 <- filter(clust, clust_e==3)
clust_e_3$AsNi <- log10(clust_e_3$As/clust_e_3$Ni)

ggplot(clust_e_3, aes(x=As, y=Ni)) +
  geom_point(aes(colour=AsNi)) +
  coord_fixed(ratio = 1) + 
  theme_bw() + scale_colour_gradient(low = "blue", high = "red")

ggplot(clust_e_3, aes(x=As, y=Ni)) +
  geom_point(aes(colour=AsNi)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1) + 
  theme_bw() + scale_colour_gradient(low = "blue", high = "red")