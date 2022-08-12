filter_c14 <- filter(c14, culture_en=="Maykop")
c14_Maykop <-calibrate(x=filter_c14$cra, errors=filter_c14$error, calCurves = 'intcal20')
c14_Maykop_sum <- spd(c14_Maykop, timeRange = c(8000,3500))
plot(c14_Maykop_sum, calendar='BCAD')

filter_c14 <- filter(c14, culture_en=="Kura-Arax")
c14_KuraArax <- calibrate(x=filter_c14$cra, errors=filter_c14$error, calCurves = 'intcal20')
c14_KuraArax_sum <- spd(c14_KuraArax, timeRange = c(8000,3500))
plot(c14_KuraArax_sum, calendar='BCAD')

filter_c14 <- filter(c14, culture_en=="Tripolye")
c14_Tripolye <-calibrate(x=filter_c14$cra, errors=filter_c14$error, calCurves = 'intcal20')
c14_Tripolye_sum <- spd(c14_Tripolye, timeRange = c(8000,3500))
plot(c14_Tripolye_sum, calendar='BCAD')

filter_c14 <- filter(c14, culture_en=="Yamnaya")
c14_Yamnaya <-calibrate(x=filter_c14$cra, errors=filter_c14$error, calCurves = 'intcal20')
c14_Yamnaya_sum <- spd(c14_Yamnaya, timeRange = c(8000,3500))
plot(c14_Yamnaya_sum, calendar='BCAD')

filter_c14 <- filter(c14, culture_en=="Katakombnaya")
c14_Katakombnaya <-calibrate(x=filter_c14$cra, errors=filter_c14$error, calCurves = 'intcal20')
c14_Katakombnaya_sum <- spd(c14_Katakombnaya, timeRange = c(8000,3500))
plot(c14_Katakombnaya_sum, calendar='BCAD')

filter_c14 <- filter(c14, site=="Arsantepe")
c14_Arsantepe <-calibrate(x=filter_c14$cra, errors=filter_c14$error, calCurves = 'intcal20')
c14_Arsantepe_sum <- spd(c14_Arsantepe, timeRange = c(8000,3500))
plot(c14_Arsantepe_sum, calendar='BCAD')

filter_c14 <- filter(c14, site=="Shengavit")
c14_Shengavit <-calibrate(x=filter_c14$cra, errors=filter_c14$error, calCurves = 'intcal20')
c14_Shengavit_sum <- spd(c14_Shengavit, timeRange = c(8000,3500))
plot(c14_Shengavit_sum, calendar='BCAD')

filter_c14 <- filter(c14, site=="Nahal Mishmar")
c14_NahalMishmar <-calibrate(x=filter_c14$cra, errors=filter_c14$error, calCurves = 'intcal20')
c14_NahalMishmar_sum <- spd(c14_NahalMishmar, timeRange = c(8000,3500))
plot(c14_NahalMishmar_sum, calendar='BCAD')

filter_c14<-filter(c14, !is.na(culture_en))
filter_c14<-filter(c14, culture_en=="Maykop" | culture_en=="Kura-Arax")
c14_stack <- stackspd(x= calibrate(x=filter_c14$cra, errors = filter_c14$error, calCurves = 'intcal20'), group = filter_c14$culture_en, timeRange = c(6500,3500))
plot(c14_stack, calendar='BCAD')

filter_c14<-filter(c14, !is.na(culture_en))
filter_c14<-filter(c14, culture_en=="Yamnaya" | culture_en=="Katakombnaya")
c14_stack <- stackspd(x= calibrate(x=filter_c14$cra, errors = filter_c14$error, calCurves = 'intcal20'), group = filter_c14$culture_en, timeRange = c(6500,3500))
plot(c14_stack, calendar='BCAD')

group_by(c14, culture_en) %>%
  calibrate(x=c14$cra, errors=c14$error, calCurves = 'intcal20')