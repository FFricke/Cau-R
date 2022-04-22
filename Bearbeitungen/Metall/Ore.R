##Einfacher Punktplot##
ggplot(Ore, aes(x=pb206_204, y=pb207_204, fill=mountain, colour=mountain, shape=mountain)) + geom_point()  + coord_fixed(ratio = 1) + scale_shape_manual(values = c(24,25,22,9,10,8,7,21)) + xlim(17.8, 19.5) + ylim(15.5, 15.9)
ggplot(Ore, aes(x=pb206_204, y=pb208_204, fill=mountain, colour=mountain, shape=mountain)) + geom_point()  + coord_fixed(ratio = 1) + scale_shape_manual(values = c(24,25,22,9,10,8,7,21)) + xlim(17.8, 19.5) + ylim(37.75, 39.25)

ggplot(Ore, aes(x=pb206_204, y=pb207_204, colour=mountain)) + geom_point()  + coord_fixed(ratio = 1) 
ggplot(Ore, aes(x=pb206_204, y=pb208_204, colour=mountain)) + geom_point()  + coord_fixed(ratio = 1) 

ggplot(filter(Ore, mountain=="Greater Caucasus" | mountain=="Lesser Caucasus" | mountain=="Pontus" | mountain=="Taurus" | mountain=="Zagros" | mountain=="Elbrus"), aes(x=pb206_204, y=pb207_204, fill=mountain, colour=mountain, shape=mountain)) + geom_point()  + coord_fixed(ratio = 1) + scale_shape_manual(values = c(24,25,22,9,10,8,7,21)) + xlim(17.8, 19.5) + ylim(15.5, 15.9)
ggplot(filter(Ore, mountain=="Greater Caucasus" | mountain=="Lesser Caucasus" | mountain=="Pontus" | mountain=="Taurus" | mountain=="Zagros" | mountain=="Elbrus"), aes(x=pb206_204, y=pb208_204, fill=mountain, colour=mountain, shape=mountain)) + geom_point()  + coord_fixed(ratio = 1) + scale_shape_manual(values = c(24,25,22,9,10,8,7,21)) + xlim(17.8, 19.5) + ylim(37.75, 39.25)

ggplot(filter(Ore, mountain=="Greater Caucasus" | mountain=="Lesser Caucasus" | mountain=="Pontus" | mountain=="Taurus"), aes(x=pb206_204, y=pb207_204, colour=mountain)) + geom_point()  + coord_fixed(ratio = 1)
ggplot(filter(Ore, mountain=="Greater Caucasus" | mountain=="Lesser Caucasus" | mountain=="Pontus" | mountain=="Taurus"), aes(x=pb206_204, y=pb208_204, colour=mountain)) + geom_point()  + coord_fixed(ratio = 1) 

ggplot(filter(Ore, mountain=="Zagros" | mountain=="East Iranian Range" | mountain=="Kuhrud" | mountain=="Elbrus"), aes(x=pb206_204, y=pb207_204, colour=mountain)) + geom_point()  + coord_fixed(ratio = 1)
ggplot(filter(Ore, mountain=="Zagros" | mountain=="East Iranian Range" | mountain=="Kuhrud" | mountain=="Elbrus"), aes(x=pb206_204, y=pb208_204, colour=mountain)) + geom_point()  + coord_fixed(ratio = 1) 

##Punktplot mit KDE##
ggplot(Ore, aes(x=pb206_204, y=pb207_204)) + geom_density_2d(h=.23, aes(colour=mountain)) + geom_point(aes(colour=mountain))  + coord_fixed(ratio = 1)
ggplot(Ore, aes(x=pb206_204, y=pb208_204)) + geom_density_2d(h=0.32, aes(colour=mountain)) + geom_point(aes(colour=mountain)) + coord_fixed(ratio = 1)

##Histogramme##                                                              
ggplot(Ore, aes(x=pb206_204, fill=region)) + geom_histogram(binwidth = 0.05) + facet_grid(rows = vars(mountain))
ggplot(Ore, aes(x=pb207_204, fill=region)) + geom_histogram(binwidth = 0.01) + facet_grid(rows = vars(mountain))
ggplot(Ore, aes(x=pb208_204, fill=region)) + geom_histogram(binwidth = 0.05) + facet_grid(rows = vars(mountain))

##Box-Plots##
ggplot(Ore, aes(x=pb206_204)) + geom_boxplot() + facet_grid(rows = vars(mountain))
ggplot(Ore, aes(x=pb207_204)) + geom_boxplot() + facet_grid(rows = vars(mountain))
ggplot(Ore, aes(x=pb208_204)) + geom_boxplot() + facet_grid(rows = vars(mountain))

##KDM mit allem##
ggplot(NULL, aes(x=pb206_204, y=pb207_204)) + geom_density_2d(data=filter(Ore, mountain=="Greater Caucasus" | mountain=="Lesser Caucasus" | mountain=="Pontus" | mountain=="Taurus"), h=0.23, alpha=0.5, aes(colour=mountain)) + geom_point(data=Nal, aes(fill=culture, shape=culture)) + scale_linetype_manual(values = c("twodash", "solid", "longdash")) + scale_shape_manual(values = c(21:22:23:24)) + coord_fixed(ratio = 1)
ggplot(NULL, aes(x=pb206_204, y=pb208_204)) + geom_density_2d(data=filter(Ore, mountain=="Greater Caucasus" | mountain=="Lesser Caucasus" | mountain=="Pontus" | mountain=="Taurus"), h=0.32, alpha=0.5, aes(colour=mountain)) + geom_point(data=Nal, aes(fill=culture, shape=culture)) + scale_linetype_manual(values = c("twodash", "solid", "longdash")) + scale_shape_manual(values = c(21:22:23:24)) + coord_fixed(ratio = 1)


##KDM mit Maykop##
ggplot(NULL, aes(x=pb206_204, y=pb207_204)) + geom_density_2d(data=Ore, h=0.23, alpha=0.5, aes(colour=mountain)) + geom_point(data=filter(Nal, culture=="Maykop"), aes(fill=site, shape=site)) + scale_linetype_manual(values = c("twodash", "solid", "longdash")) + scale_shape_manual(values = c(21:22:23:24)) + coord_fixed(ratio = 1)
ggplot(NULL, aes(x=pb206_204, y=pb208_204)) + geom_density_2d(data=Ore, h=0.32, alpha=0.5, aes(colour=mountain)) + geom_point(data=filter(Nal, culture=="Maykop"), aes(fill=site, shape=site)) + scale_linetype_manual(values = c("twodash", "solid", "longdash")) + scale_shape_manual(values = c(21:22:23:24)) + coord_fixed(ratio = 1)

##KDM mit Kuru Arax##
ggplot(NULL, aes(x=pb206_204, y=pb207_204)) + geom_density_2d(data=Ore, h=0.23, alpha=0.5, aes(colour=mountain)) + geom_point(data=filter(Nal, culture=="Kuru-Arax"), aes(colour=site)) + coord_fixed(ratio = 1)
ggplot(NULL, aes(x=pb206_204, y=pb208_204)) + geom_density_2d(data=Ore, h=0.32, alpha=0.5, aes(colour=mountain)) + geom_point(data=filter(Nal, culture=="Kuru-Arax"), aes(colour=site)) + coord_fixed(ratio = 1)
