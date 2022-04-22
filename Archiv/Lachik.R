ggplot(Nal, aes(x=pb206_204, y=pb208_204)) + geom_point(aes(colour=culture)) + coord_fixed(ratio = 1)
ggplot(Nal, aes(x=pb206_204, y=pb207_204)) + geom_point(aes(colour=culture)) + coord_fixed(ratio = 1)

ggplot(Nal, aes(x=pb206_204, y=pb208_204)) + geom_point(aes(colour=culture, size=log10(ni))) + coord_fixed(ratio = 1) + scale_radius(range = c(0.1:2))
ggplot(Nal, aes(x=pb206_204, y=pb207_204)) + geom_point(aes(colour=culture, size=log10(ni))) + coord_fixed(ratio = 1) + scale_radius(range = c(0.1:2))

ggplot(Nal, aes(x=pb206_204, y=pb208_204)) + geom_point(aes(colour=culture, size=log10(as))) + coord_fixed(ratio = 1) + scale_radius(range = c(0.1:2))
ggplot(Nal, aes(x=pb206_204, y=pb207_204)) + geom_point(aes(colour=culture, size=log10(as))) + coord_fixed(ratio = 1) + scale_radius(range = c(0.1:2))

ggplot(Nal, aes(x=(1/pb206_204), y=pb208_206)) + geom_point(aes(colour=culture))
ggplot(Nal, aes(x=(1/pb206_204), y=pb207_206)) + geom_point(aes(colour=culture))

ggplot(Nal, aes(x=as, y=pb206_204)) + geom_point(aes(colour=culture)) + scale_x_log10()
ggplot(Nal, aes(x=as, y=pb207_204)) + geom_point(aes(colour=culture)) + scale_x_log10()
ggplot(Nal, aes(x=as, y=pb208_204)) + geom_point(aes(colour=culture)) + scale_x_log10()

ggplot(Nal, aes(x=ni, y=pb206_204)) + geom_point(aes(colour=culture)) + scale_x_log10()
ggplot(Nal, aes(x=ni, y=pb207_204)) + geom_point(aes(colour=culture)) + scale_x_log10()
ggplot(Nal, aes(x=ni, y=pb208_204)) + geom_point(aes(colour=culture)) + scale_x_log10()

ggplot(filter(Nal, culture=="Maykop"), aes(x=pb206_204, y=pb208_204)) + geom_point(aes(colour=site))
ggplot(filter(Nal, culture=="Maykop"), aes(x=pb206_204, y=pb207_204)) + geom_point(aes(colour=site))

ggplot(Nal, aes(x=pb206_204, fill=site, label=site)) + geom_histogram(binwidth = 0.05) + facet_grid(rows = vars(culture))
ggplot(Nal, aes(x=pb207_204, fill=site, label=site)) + geom_histogram(binwidth = 0.01) + facet_grid(rows = vars(culture))
ggplot(Nal, aes(x=pb208_204, fill=site, label=site)) + geom_histogram(binwidth = 0.05) + facet_grid(rows = vars(culture))

##Arslantepe nach Befunden##
ggplot(filter(Cau, site=="Arslantepe"), aes(x=pb206_204, y=pb208_204)) + geom_point(aes(colour=find_character, shape=feature)) + coord_fixed(ratio = 1)
ggplot(filter(Cau, site=="Arslantepe"), aes(x=pb206_204, y=pb207_204)) + geom_point(aes(colour=find_character, shape=feature)) + coord_fixed(ratio = 1)

ggplot(Cau, aes(x=1/as, y=pb206_204, fill=culture, shape=culture)) + geom_point() + scale_x_log10() + scale_shape_manual(values = c(21,22,23,24,3,25))
ggplot(Cau, aes(x=1/as, y=pb207_204, fill=culture, shape=culture)) + geom_point() + scale_x_log10() + scale_shape_manual(values = c(21,22,23,24,3,25))
ggplot(Cau, aes(x=1/as, y=pb208_204, fill=culture, shape=culture)) + geom_point() + scale_x_log10() + scale_shape_manual(values = c(21,22,23,24,3,25))

ggplot(Cau, aes(x=1/ni, y=pb206_204, fill=culture, shape=culture)) + geom_point() + scale_x_log10() + scale_shape_manual(values = c(21,22,23,24,3,25))
ggplot(Cau, aes(x=1/ni, y=pb207_204, fill=culture, shape=culture)) + geom_point() + scale_x_log10() + scale_shape_manual(values = c(21,22,23,24,3,25))
ggplot(Cau, aes(x=1/ni, y=pb208_204, fill=culture, shape=culture)) + geom_point() + scale_x_log10() + scale_shape_manual(values = c(21,22,23,24,3,25))

ggplot(Cau, aes(x=1/pb, y=pb206_204, fill=culture, shape=culture)) + geom_point() + scale_x_log10() + scale_shape_manual(values = c(21,22,23,24,3,25))
ggplot(Cau, aes(x=1/pb, y=pb207_204, fill=culture, shape=culture)) + geom_point() + scale_x_log10() + scale_shape_manual(values = c(21,22,23,24,3,25))
ggplot(Cau, aes(x=1/pb, y=pb208_204, fill=culture, shape=culture)) + geom_point() + scale_x_log10() + scale_shape_manual(values = c(21,22,23,24,3,25))

