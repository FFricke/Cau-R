histo_log(ca, "As", culture_id, 0.1) + facet_grid(rows = )

histo_log_fac(ca, "As", culture_id, 0.1, region_id)

ca_filter <- filter(ca, mclust=="16")
  histo_fac(ca_filter, "Sn", find_character_id, 0.5, find_character_id)
  histo(ca_filter, "Sn", find_character_id, 0.25) + xlim(0, 15)

ca_filter <- filter(ca, Sn>=0.1)
  histo_log(ca_filter, "Sn", find_character_id, 0.05)  + geom_density(aes(y=0.05*..count..))  
    
ca_filter <- filter(ca, Sn>=0.75)
  histo(ca_filter, "Sn", find_character_id, 0.25)  + geom_density(aes(y=0.25*..count..)) + xlim(0,15)
  
ca_filter <- filter(ca, As>=0.01)  
  histo_log(ca_filter, "As", find_character_id, 0.05) + geom_density(aes(y=0.05*..count..))

ca_filter <- filter(ca)
  histo(ca_filter, "As", find_character_id, 0.25) + geom_density(aes(y=0.25*..count..)) + xlim(0,15)
  

  