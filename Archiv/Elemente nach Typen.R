##Äxte und Beile##

ggplot(filter(Cau, culture=="Maykop", find_character=="Aexte und Beile"), aes(x=as, fill=find_character)) + geom_histogram(binwidth = .1) + scale_x_log10()
ggplot(filter(Cau, culture=="Maykop", find_character=="Aexte und Beile"), aes(x=as, fill=find_character)) + geom_histogram(binwidth = .5) 
ggplot(filter(Cau, culture=="Maykop", find_character=="Aexte und Beile"), aes(x=as, fill=type)) + geom_histogram(binwidth = .1) + facet_grid(rows = vars(type)) + scale_x_log10()
ggplot(filter(Cau, culture=="Maykop", find_character=="Aexte und Beile"), aes(x=as, fill=type)) + geom_histogram(binwidth = .5) + facet_grid(rows = vars(type))

##Dolche##

ggplot(filter(Cau, culture=="Maykop", find_character=="Dolche und andere Klingen"), aes(x=as, fill=type)) + geom_histogram(binwidth = .1) +  scale_x_log10()
ggplot(filter(Cau, culture=="Maykop", find_character=="Dolche und andere Klingen", as>0.3), aes(x=as, fill=type)) + geom_histogram(binwidth = 0.1) +  scale_x_log10()
ggplot(filter(Cau, culture=="Maykop", find_character=="Dolche und andere Klingen"), aes(x=as, fill=type)) + geom_histogram(binwidth = .5) 

##Trachtbestandteile##

ggplot(filter(Cau, culture=="Maykop", find_character=="Trachtbestandteile"), aes(x=as, fill=type)) + geom_histogram(binwidth = .25) + facet_grid(rows = vars(type)) + scale_x_log10()
ggplot(filter(Cau, culture=="Maykop", find_character=="Trachtbestandteile"), aes(x=as, fill=type)) + geom_histogram(binwidth = .5) + facet_grid(rows = vars(type))
ggplot(filter(Cau, culture=="Maykop", find_character=="Trachtbestandteile"), aes(x=ni, fill=type)) + geom_histogram(binwidth = .1) + facet_grid(rows = vars(type)) + scale_x_log10()
ggplot(filter(Cau, culture=="Maykop", find_character=="Trachtbestandteile"), aes(x=as, y=ni, colour=type)) + geom_point() + scale_y_log10() + scale_x_log10()
ggplot(filter(Cau, culture=="Maykop", find_character=="Trachtbestandteile"), aes(x=as, y=ni, colour=type)) + geom_point() 


##Pfrieme, Meissel und andere Geraete##

ggplot(filter(Cau, culture=="Maykop", find_character=="Pfrieme, Meissel und andere Geraete"), aes(x=as, fill=type)) + geom_histogram(binwidth = .1) + facet_grid(rows = vars(type)) + scale_x_log10()
ggplot(filter(Cau, culture=="Maykop", find_character=="Pfrieme, Meissel und andere Geraete"), aes(x=ni, fill=type)) + geom_histogram(binwidth = .1) + facet_grid(rows = vars(type)) + scale_x_log10()

##Gefäße##

ggplot(filter(Cau, culture=="Maykop", find_character=="Gefaesse"), aes(x=as, fill=type)) + geom_histogram(binwidth = .1) + facet_grid(rows = vars(type)) + scale_x_log10()
ggplot(filter(Cau, culture=="Maykop", find_character=="Gefaesse"), aes(x=as, fill=type)) + geom_histogram(binwidth = .5) + facet_grid(rows = vars(type))
ggplot(filter(Cau, culture=="Maykop", find_character=="Gefaesse"), aes(x=as, y=ni, colour=type)) + geom_point() + scale_y_log10() + scale_x_log10()
ggplot(filter(Cau, culture=="Maykop", find_character=="Gefaesse"), aes(x=as, y=ni, colour=type)) + geom_point() 
ggplot(filter(Cau, culture=="Maykop"), aes(x=as, y=ni, colour=find_character)) + geom_point() + scale_y_log10() + scale_x_log10()
