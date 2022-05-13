filter_pb <- filter(pb, culture=="Kura-Arax")

diagramm_1_pb_206(element = As, variable = find_character_id, spectrum = col_find_character, labelling = lab_en_find_character)
diagramm_1_pb_207(element = As, variable = find_character_id, spectrum = col_find_character, labelling = lab_en_find_character)
diagramm_1_pb_208(element = As, variable = find_character_id, spectrum = col_find_character, labelling = lab_en_find_character)

filter_ca <- filter(ca, culture=="Kura-Arax")

diagramm_ca(element_1 = As, element_2 = Sb, variable = find_character_id, spectrum = col_find_character, labelling = lab_en_find_character)
diagramm_box_ca(element = As, variable = find_character_id, spectrum = col_find_character, labelling = lab_en_find_character)


filter_pb <- filter(pb)

diagramm_1_pb_206(element = As, variable = clust_e, spectrum = col_cluster, labelling = lab_cluster)
diagramm_1_pb_207(element = As, variable = clust_e, spectrum = col_cluster, labelling = lab_cluster)
diagramm_1_pb_208(element = As, variable = clust_e, spectrum = col_cluster, labelling = lab_cluster)

diagramm_1_pb_206(element = Ni, variable = clust_e, spectrum = col_cluster, labelling = lab_cluster)
diagramm_1_pb_207(element = Ni, variable = clust_e, spectrum = col_cluster, labelling = lab_cluster)
diagramm_1_pb_208(element = Ni, variable = clust_e, spectrum = col_cluster, labelling = lab_cluster)