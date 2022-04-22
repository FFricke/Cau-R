##Doppellogs##

ggplot(Klady,
       aes(x=as, y=ni)) +
  geom_point() + 
  coord_fixed(ratio = 1)

ggplot(Klady,
       aes(x=as, y=ni)) +
  geom_point() + 
  scale_x_log10() + scale_y_log10()

ggplot(Klady,
       aes(x=as, y=fe)) +
  geom_point() 

ggplot(Klady,
       aes(x=as, y=fe)) +
  geom_point() + 
  scale_x_log10() + scale_y_log10()

##nach Typen##

ggplot(Klady,
       aes(x=as, fill=find_character)) +
  geom_histogram(binwidth = 0.5) +
  facet_grid(rows = vars(find_character))
