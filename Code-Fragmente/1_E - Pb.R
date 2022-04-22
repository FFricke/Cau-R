##1/XXX - Pb##

ggplot(
  data = NULL, aes(x=1/XXX, y=pb206_204)) +
  geom_point(
    data=fil_cult, 
    aes(colour=culture)) +
  geom_point(
    data=fil_site, 
    aes(colour=site))  + 
  scale_x_log10() +
  ylab(expression(frac(Pb[206],Pb[204]))) + 
  theme_bw()

ggplot(
  data = NULL, aes(x=1/XXX, y=pb207_204)) +
  geom_point(
    data=fil_cult, 
    aes(colour=culture)) +
  geom_point(
    data=fil_site, 
    aes(colour=site))  + 
  scale_x_log10() +
  ylab(expression(frac(Pb[207],Pb[204]))) + 
  theme_bw()

ggplot(
  data = NULL, aes(x=1/XXX, y=pb207_204)) +
  geom_point(
    data=fil_cult, 
    aes(colour=culture)) +
  geom_point(
    data=fil_site, 
    aes(colour=site))  + 
  scale_x_log10() +
  ylab(expression(frac(Pb[207],Pb[204]))) + 
  theme_bw()