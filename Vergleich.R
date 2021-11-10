##Pb##

ggplot(
  data = NULL, aes(x=pb207_204, y=pb206_204)) +
  geom_point(
    data=filter(Cau, culture=="Kura-Arax" | culture=="Maykop"), 
    aes(colour=culture)) +
  geom_point(
    data=Nahal_Mishmar, 
    aes(colour=site)) +
  geom_point(
    data=filter(Cau, site=="Arslantepe"), 
    aes(colour=site))  + 
  coord_fixed(ratio = 1)

ggplot(
  data = NULL, aes(x=pb208_204, y=pb206_204)) +
  geom_point(
    data=filter(Cau, culture=="Kura-Arax" | culture=="Maykop"), 
    aes(colour=culture)) +
  geom_point(
    data=Nahal_Mishmar, 
    aes(colour=site)) +
  geom_point(
    data=filter(Cau, site=="Arslantepe"), 
    aes(colour=site))  + 
  coord_fixed(ratio = 1)

##1/as - Pb##

ggplot(
  data = NULL, aes(x=1/as, y=pb206_204)) +
  geom_point(
    data=filter(Cau, culture=="Kura-Arax" | culture=="Maykop"), 
    aes(colour=culture)) +
  geom_point(
    data=Nahal_Mishmar, 
    aes(colour=site)) +
  geom_point(
    data=filter(Cau, site=="Arslantepe"), 
    aes(colour=site)) +
  scale_x_log10()

ggplot(
  data = NULL, aes(x=1/as, y=pb207_204)) +
  geom_point(
    data=filter(Cau, culture=="Kura-Arax" | culture=="Maykop"), 
    aes(colour=culture)) +
  geom_point(
    data=Nahal_Mishmar, 
    aes(colour=site)) +
  geom_point(
    data=filter(Cau, site=="Arslantepe"), 
    aes(colour=site)) +
  scale_x_log10()

ggplot(
  data = NULL, aes(x=1/as, y=pb208_204)) +
  geom_point(
    data=filter(Cau, culture=="Kura-Arax" | culture=="Maykop"), 
    aes(colour=culture)) +
  geom_point(
    data=Nahal_Mishmar, 
    aes(colour=site)) +
  geom_point(
    data=filter(Cau, site=="Arslantepe"), 
    aes(colour=site)) +
  scale_x_log10()

##1/sb - Pb##

ggplot(
  data = NULL, aes(x=1/sb, y=pb206_204)) +
  geom_point(
    data=filter(Cau, culture=="Kura-Arax" | culture=="Maykop"), 
    aes(colour=culture)) +
  geom_point(
    data=Nahal_Mishmar, 
    aes(colour=site)) +
  geom_point(
    data=filter(Cau, site=="Arslantepe"), 
    aes(colour=site)) +
  scale_x_log10()

ggplot(
  data = NULL, aes(x=1/sb, y=pb207_204)) +
  geom_point(
    data=filter(Cau, culture=="Kura-Arax" | culture=="Maykop"), 
    aes(colour=culture)) +
  geom_point(
    data=Nahal_Mishmar, 
    aes(colour=site)) +
  geom_point(
    data=filter(Cau, site=="Arslantepe"), 
    aes(colour=site)) +
  scale_x_log10()

ggplot(
  data = NULL, aes(x=1/sb, y=pb208_204)) +
  geom_point(
    data=filter(Cau, culture=="Kura-Arax" | culture=="Maykop"), 
    aes(colour=culture)) +
  geom_point(
    data=Nahal_Mishmar, 
    aes(colour=site)) +
  geom_point(
    data=filter(Cau, site=="Arslantepe"), 
    aes(colour=site)) +
  scale_x_log10()

##1/pb - Pb##

ggplot(
  data = NULL, aes(x=1/pb, y=pb206_204)) +
  geom_point(
    data=filter(Cau, culture=="Kura-Arax" | culture=="Maykop"), 
    aes(colour=culture)) +
  geom_point(
    data=Nahal_Mishmar, 
    aes(colour=site)) +
  geom_point(
    data=filter(Cau, site=="Arslantepe"), 
    aes(colour=site)) +
  scale_x_log10()

ggplot(
  data = NULL, aes(x=1/pb, y=pb207_204)) +
  geom_point(
    data=filter(Cau, culture=="Kura-Arax" | culture=="Maykop"), 
    aes(colour=culture)) +
  geom_point(
    data=Nahal_Mishmar, 
    aes(colour=site)) +
  geom_point(
    data=filter(Cau, site=="Arslantepe"), 
    aes(colour=site)) +
  scale_x_log10()

ggplot(
  data = NULL, aes(x=1/pb, y=pb208_204)) +
  geom_point(
    data=filter(Cau, culture=="Kura-Arax" | culture=="Maykop"), 
    aes(colour=culture)) +
  geom_point(
    data=Nahal_Mishmar, 
    aes(colour=site)) +
  geom_point(
    data=filter(Cau, site=="Arslantepe"), 
    aes(colour=site)) +
  scale_x_log10()

##Doppellogs##

ggplot(
  data = NULL, aes(x=as, y=sb)) +
  geom_point(
    data=filter(Cau, culture=="Kura-Arax" | culture=="Maykop"), 
    aes(colour=culture)) +
  geom_point(
    data=Nahal_Mishmar, 
    aes(colour=site)) +
  geom_point(
    data=filter(Cau, site=="Arslantepe"), 
    aes(colour=site)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1)

ggplot(
  data = NULL, aes(x=as, y=ni)) +
  geom_point(
    data=filter(Cau, culture=="Kura-Arax" | culture=="Maykop"), 
    aes(colour=culture)) +
  geom_point(
    data=Nahal_Mishmar, 
    aes(colour=site)) +
  geom_point(
    data=filter(Cau, site=="Arslantepe"), 
    aes(colour=site)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1)

ggplot(
  data = NULL, aes(x=ag, y=ni)) +
  geom_point(
    data=filter(Cau, culture=="Kura-Arax" | culture=="Maykop"), 
    aes(colour=culture)) +
  geom_point(
    data=Nahal_Mishmar, 
    aes(colour=site)) +
  geom_point(
    data=filter(Cau, site=="Arslantepe"), 
    aes(colour=site)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1)

ggplot(
  data = NULL, aes(x=ag, y=ni)) +
  geom_point(
    data=filter(Cau, culture=="Kura-Arax" | culture=="Maykop"), 
    aes(colour=culture)) +
  geom_point(
    data=filter(Cau, main=="cu", site=="Arslantepe" | site=="Nahal Mishmar"), 
    aes(colour=site)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1)

ggplot(
  data = NULL, aes(x=ag, y=ni)) +
  geom_point(
    data=filter(Cau, culture=="Kura-Arax" | culture=="Maykop"), 
    aes(colour=culture)) +
  geom_point(
    data=filter(Cau, main=="cu", site=="Arslantepe" | site=="Nahal Mishmar"), 
    aes(colour=site)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1)

ggplot(
  data = NULL, aes(x=as, y=fe)) +
  geom_point(
    data=filter(Cau, culture=="Kura-Arax" | culture=="Maykop"), 
    aes(colour=culture)) +
  geom_point(
    data=Nahal_Mishmar, 
    aes(colour=site)) +
  geom_point(
    data=filter(Cau, site=="Arslantepe"), 
    aes(colour=site)) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1)