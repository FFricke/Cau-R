ggplot(
  data = clust, aes(x=As, y=Sb)) +
  geom_point(
    aes(colour=clust_e)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1) + 
  theme_bw()

ggplot(
  data = clust, aes(x=As, y=Ni)) +
  geom_point(
    aes(colour=clust_e)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1) + 
  theme_bw()
