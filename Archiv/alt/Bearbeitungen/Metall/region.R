##Doppellogs##

filter_ca_region <- filter(ca, region_id==1 | region_id==2 | region_id==3 | region_id==4 | region_id==5 | region_id==19 | region_id==11 | region_id==18 | region_id==15 | region_id==16 | region_id==17)
                             
ggplot(
  data = filter_ca_region, aes(x=As, y=Sb)) +
  geom_point(
    aes(colour=region)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1) + 
  theme_bw()

ggplot(
  data = filter_ca_region, aes(x=As, y=Ni)) +
  geom_point(
    aes(colour=region)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1) + 
  theme_bw()


ggplot(
  data = filter_ca_region, aes(x=Ag, y=Ni)) +
  geom_point(
    aes(colour=region)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1) + 
  theme_bw()

##Box-Plots##

##As##
ggplot(
  data = filter_ca_region, aes(x=As)) +
  geom_boxplot(
    aes(colour=region)) +
  scale_x_log10() + facet_grid(rows = vars(region))


ggplot(
  data = filter_ca_region, aes(x=As)) +
  geom_boxplot(
    aes(colour=region)) +
  facet_grid(rows = vars(region)) + xlim(0,25)

##Ni##
ggplot(
  data = filter_ca_region, aes(x=Ni)) +
  geom_boxplot(
    aes(colour=region)) +
  scale_x_log10() + facet_grid(rows = vars(region)) 

##Sb##
ggplot(
  data = filter_ca_region, aes(x=Sb)) +
  geom_boxplot(
    aes(colour=region)) +
  scale_x_log10() + facet_grid(rows = vars(region)) 
