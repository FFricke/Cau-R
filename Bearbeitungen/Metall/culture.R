##Doppellogs##

filter_ca_culture <- filter(ca, culture=="Maykop" | culture=="Corded Ware" | culture=="Kura-Arax" | culture=="Katakombnaya" | culture=="Yamnaya" | culture=="Tripolye" | culture=="Mondsee" | culture=="Altheim" | culture=="Pfyn" | culture=="Cham")

ggplot(
  data = filter_ca_culture, aes(x=As, y=Sb)) +
  geom_point(
    aes(colour=culture)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1) + 
  theme_bw() +
  scale_colour_manual(values = c(col_culture)) 

ggplot(
  data = filter_ca_culture, aes(x=As, y=Ni)) +
  geom_point(
    aes(colour=culture)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1) + 
  theme_bw() +
  scale_colour_manual(values = c(col_culture)) 


ggplot(
  data = filter_ca_culture, aes(x=Ag, y=Ni)) +
  geom_point(
    aes(colour=culture)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1) + 
  theme_bw() +
  scale_colour_manual(values = c(col_culture)) 

##Box-Plots##

##As##
ggplot(
  data = filter_ca_culture, aes(x=As)) +
  geom_boxplot(
    aes(fill=culture)) +
  scale_x_log10() + facet_grid(rows = vars(culture)) +
  scale_fill_manual(values = c(col_culture)) 


ggplot(
  data = filter_ca_culture, aes(x=As)) +
  geom_boxplot(
    aes(fill=culture)) +
facet_grid(rows = vars(culture)) + xlim(0,25) +
  scale_fill_manual(values = c(col_culture)) 

##Ni##
ggplot(
  data = filter_ca_culture, aes(x=Ni)) +
  geom_boxplot(
    aes(fill=culture)) +
  scale_x_log10() + facet_grid(rows = vars(culture)) +
  scale_fill_manual(values = c(col_culture)) 

##Sb##
ggplot(
  data = filter_ca_culture, aes(x=Sb)) +
  geom_boxplot(
    aes(fill=culture)) +
  scale_x_log10() + facet_grid(rows = vars(culture)) +
  scale_fill_manual(values = c(col_culture)) 
