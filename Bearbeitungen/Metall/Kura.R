Kura <- filter(ca, culture=="Kura-Arax")

ggplot(Kura,
       aes(x=As, y=Sb)) +
  geom_point(aes(colour=find_character)) +
  scale_x_log10() + scale_y_log10() +  coord_fixed(ratio = 1)

ggplot(Kura,
       aes(x=As, y=Ni)) +
  geom_point(aes(colour=find_character)) +
  scale_x_log10() + scale_y_log10() +  coord_fixed(ratio = 1)