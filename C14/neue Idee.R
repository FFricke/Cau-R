all <- idea.3(byCultures, min=3000, max=8000, level=0.002)
maykop <- idea.3(filter(byCultures, culture_id=="2"), min=3000, max=8000, level=0.002)
kura_arax <- idea.3(filter(byCultures, culture_id=="3"), min=3000, max=8000, level=0.002)
sued <- idea.3(filter(byCultures, culture_id=="4"), min=3000, max=8000, level=0.002)
all <- idea.3(byCultures, 3000, 8000, 0.002)
tripolye <- idea.3(filter(byCultures, culture_id=="24"), 3000, 8000, 0.002)
katakombnaya <- idea.3(filter(byCultures, culture_id=="10"), 3000, 8000, 0.002)
yamnaya <- idea.3(filter(byCultures, culture_id=="9"), 3000, 8000, 0.002)

cultures <- list(maykop, kura_arax)

ggplot(data = NULL, aes(x=calBP, y=log10(median))) +
  geom_point(data=tripolye, aes(color="tripolye")) + 
  geom_point(data=maykop, aes(color="maykop")) + 
  geom_point(data=kura_arax, aes(color="kura_arax")) +
  geom_point(data=sued, aes(color="sued")) +
  geom_point(data=katakombnaya, aes(color="katakombnaya")) +
  geom_point(data=yamnaya, aes(color="yamnaya"))

ggplot(data = NULL, aes(x=calBP, y=avg)) +
  geom_point(data=tripolye, aes(color="tripolye")) + 
  geom_point(data=maykop, aes(color="maykop")) + 
  geom_point(data=kura_arax, aes(color="kura_arax")) +
  geom_point(data=sued, aes(color="sued")) +
  geom_point(data=katakombnaya, aes(color="katakombnaya")) +
  geom_point(data=yamnaya, aes(color="yamnaya"))

anatolia <- idea.4(filter(byCultures, region_id=="3"), min=3000, max=8000, level=0.002)
ciscaucasus <- idea.4(filter(byCultures, region_id=="2"), min=3000, max=8000, level=0.002)
transcaucasus <- idea.4(filter(byCultures, region_id=="1"), min=3000, max=8000, level=0.002)
iran <- idea.4(filter(byCultures, region_id=="5"), min=3000, max=8000, level=0.002)
irak <- idea.4(filter(byCultures, region_id=="4"), min=3000, max=8000, level=0.002)
uk_ru <- idea.4(filter(byCultures, region_id=="19"), min=3000, max=8000, level=0.002)


ggplot(data = NULL, aes(x=calBP, y=log10(median))) +
  geom_point(data=anatolia, aes(color="anatolia")) + 
  geom_point(data=ciscaucasus, aes(color="ciscaucasus")) + 
  geom_point(data=transcaucasus, aes(color="transcaucasus")) +
  geom_point(data=iran, aes(color="iran")) +
  geom_point(data=irak, aes(color="irak")) + 
  geom_point(data=irak, aes(color="uk_ru"))
 

