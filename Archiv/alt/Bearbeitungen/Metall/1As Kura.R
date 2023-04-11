filter_pb <- filter(pb, culture=="Kura-Arax")

ggplot(
  data = filter_pb, aes(x=1/As, y=pb206_204)) +
  geom_point(shape=21,
    aes(fill=find_character)) +
  scale_x_log10() +
  ylab(expression(frac(Pb[206],Pb[204]))) + 
  theme_bw() +
  scale_fill_manual(values = c(col_find_character)) 

ggplot(
  data = filter_pb, aes(x=1/As, y=pb207_204)) +
  geom_point(shape=21,
    aes(fill=find_character)) +
  scale_x_log10() +
  ylab(expression(frac(Pb[207],Pb[204]))) + 
  theme_bw() +
  scale_fill_manual(values = c(col_find_character)) 

ggplot(
  data = filter_pb, aes(x=1/As, y=pb208_204)) +
  geom_point(shape=21,
    aes(fill=find_character)) +
  scale_x_log10() +
  ylab(expression(frac(Pb[208],Pb[204]))) + 
  theme_bw() +
  scale_fill_manual(values = c(col_find_character)) 
