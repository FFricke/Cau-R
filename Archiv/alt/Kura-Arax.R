

##1/As##
ggplot(filter(Cau, culture=="Kura-Arax"),
       aes(y=pb206_204, x=1/As, colour=find_character)) +
  geom_point() +
  scale_x_log10()

ggplot(filter(Cau, culture=="Kura-Arax"),
       aes(y=pb207_204, x=1/As, colour=find_character)) +
  geom_point() +
  scale_x_log10()

ggplot(filter(Cau, culture=="Kura-Arax"),
       aes(y=pb208_204, x=1/As, colour=find_character)) +
  geom_point() +
  scale_x_log10()

##1/Sb##
ggplot(filter(Cau, culture=="Kura-Arax"),
       aes(y=pb206_204, x=1/sb, colour=find_character)) +
  geom_point() +
  scale_x_log10()

ggplot(filter(Cau, culture=="Kura-Arax"),
       aes(y=pb207_204, x=1/sb, colour=find_character)) +
  geom_point() +
  scale_x_log10()

ggplot(filter(Cau, culture=="Kura-Arax"),
       aes(y=pb208_204, x=1/sb, colour=find_character)) +
  geom_point() +
  scale_x_log10()

##1/Ni##
ggplot(filter(Cau, culture=="Kura-Arax"),
       aes(y=pb206_204, x=1/ni, colour=find_character)) +
  geom_point() +
  scale_x_log10()

ggplot(filter(Cau, culture=="Kura-Arax"),
       aes(y=pb207_204, x=1/ni, colour=find_character)) +
  geom_point() +
  scale_x_log10()

ggplot(filter(Cau, culture=="Kura-Arax"),
       aes(y=pb208_204, x=1/ni, colour=find_character)) +
  geom_point() +
  scale_x_log10()

##1/Pb##
ggplot(filter(Cau, culture=="Kura-Arax"),
       aes(y=pb206_204, x=1/pb, colour=find_character)) +
  geom_point() +
  scale_x_log10()

ggplot(filter(Cau, culture=="Kura-Arax"),
       aes(y=pb207_204, x=1/pb, colour=find_character)) +
  geom_point() +
  scale_x_log10()

ggplot(filter(Cau, culture=="Kura-Arax"),
       aes(y=pb208_204, x=1/pb, colour=find_character)) +
  geom_point() +
  scale_x_log10()