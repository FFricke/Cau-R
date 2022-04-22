filter_pb <- filter(pb)

ggplot(filter_pb,  aes(x=pb206_204, y=pb207_204)) +
  geom_point(aes(colour=clust_e)) +
  coord_fixed(ratio = 1) +
  xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[207],Pb[204]))) + 
  theme_bw()

ggplot(filter_pb, aes(x=pb206_204, y=pb208_204)) +
  geom_point(aes(colour=clust_e)) +
  coord_fixed(ratio = 1) +
  xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[207],Pb[204]))) + 
  theme_bw()

ggplot(filter_pb, aes(x=1/As, y=pb206_204)) +
  geom_point(aes(colour=clust_e)) +
  ylab(expression(frac(Pb[206],Pb[204]))) + scale_x_log10() +
  theme_bw()
  
ggplot(filter_pb, aes(x=1/As, y=pb207_204)) +
  geom_point(aes(colour=clust_e)) +
  ylab(expression(frac(Pb[207],Pb[204]))) + scale_x_log10() +
  theme_bw()
  
ggplot(filter_pb, aes(x=1/As, y=pb208_204)) +
  geom_point(aes(colour=clust_e)) +
  ylab(expression(frac(Pb[208],Pb[204]))) + scale_x_log10() +
  theme_bw()
  
ggplot(filter_pb, aes(x=1/Ni, y=pb206_204)) +
  geom_point(aes(colour=clust_e)) +
  ylab(expression(frac(Pb[206],Pb[204]))) + scale_x_log10() +
  theme_bw()
  
ggplot(filter_pb, aes(x=1/Ni, y=pb207_204)) +
  geom_point(aes(colour=clust_e)) +
  ylab(expression(frac(Pb[207],Pb[204]))) + scale_x_log10() +
  theme_bw()
  
ggplot(filter_pb, aes(x=1/Ni, y=pb208_204)) +
  geom_point(aes(colour=clust_e)) +
  ylab(expression(frac(Pb[208],Pb[204]))) + scale_x_log10() +
  theme_bw()
  