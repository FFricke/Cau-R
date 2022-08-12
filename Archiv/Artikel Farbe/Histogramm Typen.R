ggplot(filter(ca, main=="cu", culture=="Maykop"), 
       aes(x=As, fill=find_character  )) + 
  geom_histogram(binwidth = 0.5) +
  facet_grid(rows= vars(find_character_id)) + 
 # scale_x_log10() + 
  theme_bw()

ggplot(filter(ca, main=="cu", culture=="Maykop"), 
       aes(x=SUMME, fill=find_character  )) + 
  geom_histogram(binwidth = 0.5) +
  facet_grid(rows= vars(find_character_id)) + 
  # scale_x_log10() + 
  theme_bw()
