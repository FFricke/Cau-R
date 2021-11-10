##Doppellogs##

ggplot(
  data = NULL, aes(x=XX, y=YY)) +
  geom_point(
    data=fil_cult, 
    aes(colour=culture)) +
  geom_point(
    data=fil_site, 
    aes(colour=site)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1) + 
  theme_bw()