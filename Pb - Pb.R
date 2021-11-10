ggplot(
  data = NULL, aes(x=pb206_204, y=pb207_204)) +
  geom_point(
    data=fil_cult, 
    aes(colour=culture)) +
  geom_point(
    data=fil_site, 
    aes(colour=site))  + 
  coord_fixed(ratio = 1) +
  xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[207],Pb[204]))) + 
  theme_bw()


ggplot(
  data = NULL, aes(x=pb206_204, y=pb208_204)) +
  geom_point(
    data=fil_cult, 
    aes(colour=culture)) +
  geom_point(
    data=fil_site, 
    aes(colour=site))  + 
  coord_fixed(ratio = 1) +
  ylab(expression(frac(Pb[208],Pb[204]))) + xlab(expression(frac(Pb[206],Pb[204]))) + 
  theme_bw()