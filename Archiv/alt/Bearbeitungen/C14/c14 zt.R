filter_c14_zt <- filter(c14, zt_type_id==6)
filter_c14_zt <- filter(filter_c14_zt, zt_id==3 | zt_id==5)

c14_zt_Maykop_early <- calibrate(x=filter_c14_zt$cra, errors=filter_c14_zt$error, calCurves = 'intcal20')
c14_zt_Maykop_early_sum <- spd(c14_zt_Maykop_early, timeRange = c(8000,3500))
plot(c14_zt_Maykop_early_sum, calendar='BCAD')

filter_c14_zt <- filter(c14, zt_type_id==6)
filter_c14_zt <- filter(filter_c14_zt, zt_id==4 | zt_id==6)

c14_zt_Maykop_late <- calibrate(x=filter_c14_zt$cra, errors=filter_c14_zt$error, calCurves = 'intcal20')
c14_zt_Maykop_late_sum <- spd(c14_zt_Maykop_late, timeRange = c(8000,3500))
plot(c14_zt_Maykop_late_sum, calendar='BCAD')

filter_c14_zt <- filter(c14, zt_type_id==6)
filter_c14_zt <- filter(filter_c14_zt, zt_id==1)

c14_zt_Katakombnaya_early <- calibrate(x=filter_c14_zt$cra, errors=filter_c14_zt$error, calCurves = 'intcal20')
c14_zt_Katakombnaya_early_sum <- spd(c14_zt_Katakombnaya_early, timeRange = c(8000,3500))
plot(c14_zt_Katakombnaya_early_sum, calendar='BCAD')

filter_c14_zt <- filter(c14, zt_type_id==6)
filter_c14_zt <- filter(filter_c14_zt, zt_id==2)

c14_zt_Katakombnaya_late <- calibrate(x=filter_c14_zt$cra, errors=filter_c14_zt$error, calCurves = 'intcal20')
c14_zt_Katakombnaya_late_sum <- spd(c14_zt_Katakombnaya_late, timeRange = c(8000,3500))
plot(c14_zt_Katakombnaya_late_sum, calendar='BCAD')
