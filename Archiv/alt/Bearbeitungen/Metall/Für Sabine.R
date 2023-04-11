filter_ca <- filter(ca, culture_id =="2")
diagramm_ca(data = filter_ca, element_1 = As, element_2 = Ni, variable = culture_id, spectrum = col_culture, labelling = lab_en_culture)

filter_ca <- filter(ca, culture_id =="3")
diagramm_ca(data = filter_ca, element_1 = As, element_2 = Ni, variable = culture_id, spectrum = col_culture, labelling = lab_en_culture)

filter_ca <- filter(ca, culture_id =="25")
diagramm_ca(data = filter_ca, element_1 = As, element_2 = Ni, variable = culture_id, spectrum = col_culture, labelling = lab_en_culture)

filter_ca <- filter(ca, culture_id =="9")
diagramm_ca(data = filter_ca, element_1 = As, element_2 = Ni, variable = culture_id, spectrum = col_culture, labelling = lab_en_culture)

filter_ca <- filter(ca, culture_id =="10")
diagramm_ca(data = filter_ca, element_1 = As, element_2 = Ni, variable = culture_id, spectrum = col_culture, labelling = lab_en_culture)


diagramm_ca(data = filter_ca, element_1 = As, element_2 = Sb, variable = culture_id, spectrum = col_culture, labelling = lab_en_culture)
diagramm_ca(data = filter_ca, element_1 = As, element_2 = Fe, variable = culture_id, spectrum = col_culture, labelling = lab_en_culture)
diagramm_ca(data = filter_ca, element_1 = Sb, element_2 = Ni, variable = culture_id, spectrum = col_culture, labelling = lab_en_culture)

filter_ca<- filter(ca, culture_id =="2" | culture_id =="3" | culture_id =="9" | culture_id =="10" | culture_id =="25")

diagramm_hist_ca(data = filter_ca, element = As, variable = culture_id)
diagramm_hist_ca(data = filter_ca, element = Ni, variable = culture_id)
diagramm_hist_ca(data = filter_ca, element = Sb, variable = culture_id)