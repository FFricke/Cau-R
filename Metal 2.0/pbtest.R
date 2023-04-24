ggplot(ore, aes(x = pb206_204, y=pb207_204)) + stat_density2d(aes(colour=region))

 ggplot(ore, aes(x = pb206_204, y=pb207_204)) + geom_point(aes(colour=region)) + stat_density2d_filled(aes(colour=region), geom = "polygon")

ggplot(data = NULL) + 
  stat_bin_hex(data = ore, aes(x = pb206_204, y=pb207_204, alpha = 0.25)) +
  geom_point(data = pb, aes(x = pb206_204, y=pb207_204, colour = mclust, sh))



ggplot(data=NULL,  aes(x=pb206_204, y=pb207_204)) +
  stat_bin_hex(data = ore, aes(alpha = 0.25)) +
  geom_point(data = pb,
    aes(color=mclust, shape=mclust)) +
  xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[207],Pb[204]))) + 
  theme_bw() +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.x = element_blank(),
        plot.margin = unit(c(5.5, 5.5, 0, 5.5), "pt")
  ) +
  desginLegend() +
  scale_color_manual(values = c(mclust$col), labels = c(mclust$en), limits = force) +
  scale_shape_manual(values = c(mclust$shape), labels = c(mclust$en), limits = force)

ggplot(data=NULL,  aes(x=pb206_204, y=pb208_204)) +
  stat_bin_hex(data = ore, aes(alpha = 0.25)) +
  geom_point(data = pb,
             aes(fill=mclust, shape=mclust)) +
  xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[207],Pb[204]))) + 
  theme_bw() +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.x = element_blank(),
        plot.margin = unit(c(5.5, 5.5, 0, 5.5), "pt")
  ) +
  desginLegend() +
  scale_fill_manual(values = c(mclust$col), labels = c(mclust$en), limits = force) +
  scale_shape_manual(values = c(mclust$shape), labels = c(mclust$en), limits = force)


ggplot(data=NULL,  aes(x=pb206_204, y=pb207_204)) +
  stat_bin_hex(data = ore, aes(color = mountain, alpha = 0.25)) +
  geom_point(data=pb,
    aes(fill=mclust, shape=mclust)) +
  xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[207],Pb[204]))) + 
  theme_bw() +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.x = element_blank(),
        plot.margin = unit(c(5.5, 5.5, 0, 5.5), "pt")
  ) +
  desginLegend() +
  scale_fill_manual(values = c(mclust$col), labels = c(mclust$en), limits = force) +
  scale_color_manual(values = c(mountain$col)) +
  scale_shape_manual(values = c(mclust$shape), labels = c(mclust$en), limits = force)

ggplot(data=ore, aes(x=pb206_204, y=pb207_204)) +
  stat_bin_hex(aes(color=mountain_id)) +
  desginLegend() +
  scale_color_manual(values = c(mountain$col), labels = c(mountain$en), limits = force) 

ggplot(data=NULL, aes(x=pb206_204, y=pb207_204)) +
  stat_bin_hex(data=ore, aes(fill=mountain_id, alpha = 0.5)) +
  scale_fill_manual(values = c(mountain_id$col), labels = c(mountain_id$en), limits = force) +
  new_scale_fill() +
  geom_point(data=pb, aes(fill=mclust, shape=mclust)) +
  scale_fill_manual(values = c(mclust$col), labels = c(mclust$en), limits = force) +
  scale_shape_manual(values = c(mclust$shape), labels = c(mclust$en), limits = force)

ggplot(data=NULL, aes(x=pb206_204, y=pb208_204)) +
  stat_bin_hex(data=ore, aes(fill=mountain_id, alpha = 0.5)) +
  scale_fill_manual(values = c(mountain_id$col), labels = c(mountain_id$en), limits = force) +
  new_scale_fill() +
  geom_point(data=pb, aes(fill=mclust, shape=mclust)) +
  scale_fill_manual(values = c(mclust$col), labels = c(mclust$en), limits = force) +
  scale_shape_manual(values = c(mclust$shape), labels = c(mclust$en), limits = force) +
  theme_minimal() +
  desginLegend()

ggplot(data=NULL,  aes(x=pb206_204, y=pb207_204)) +
  stat_bin_hex(data = ore,
               aes(fill=mountain_id)) +
  scale_fill_manual(values = c(mountain_id$col), labels = c(mountain_id$en), limits = force) +
  new_scale_fill() +
  geom_point(data = pb,
             aes(fill={{varPb}}, shape={{varPb}})) +
  scale_fill_manual(values = c(varPb$col), labels = c(varPb$en), limits = force) +
  scale_shape_manual(values = c(varPb$shape), labels = c(varPb$en), limits = force) +
  xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[207],Pb[204]))) + 
  theme_bw() +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.x = element_blank(),
        plot.margin = unit(c(5.5, 5.5, 0, 5.5), "pt")
  ) +
  
