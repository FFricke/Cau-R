    ggplot(
      filter(Cau, culture=="Kura-Arax"|culture=="Maykop"|culture=="Katakombnaya"|culture=="Yamnaya"), 
      aes(x=as, fill=culture)) +
      geom_histogram() +
      facet_grid(rows = vars(culture)) + scale_x_log10()
    
    ggplot(
      filter(Cau, culture=="Kura-Arax"|culture=="Maykop"|culture=="Katakombnaya"|culture=="Yamnaya"), 
      aes(x=ni, fill=culture)) +
      geom_histogram() +
      facet_grid(rows = vars(culture)) + scale_x_log10()
    
    ggplot(
      filter(Cau, culture=="Kura-Arax"|culture=="Maykop"|culture=="Katakombnaya"|culture=="Yamnaya"), 
      aes(x=sb, fill=culture)) +
      geom_histogram() +
      facet_grid(rows = vars(culture)) + scale_x_log10()
    
    ggplot(
      filter(Cau, culture=="Kura-Arax"|culture=="Maykop"|culture=="Katakombnaya"|culture=="Yamnaya"), 
      aes(x=as, y=ni, colour=culture)) +
      geom_point() +
      scale_x_log10() + scale_y_log10()
    
    ggplot(
      filter(Cau, culture=="Kura-Arax"|culture=="Maykop"|culture=="Katakombnaya"|culture=="Yamnaya"), 
      aes(x=as, y=sb, colour=culture)) +
      geom_point() +
      scale_x_log10() + scale_y_log10()
    
    ggplot(
      filter(Cau, culture=="Kura-Arax"|culture=="Maykop"|culture=="Katakombnaya"|culture=="Yamnaya"), 
      aes(x=as, y=fe, colour=culture)) +
      geom_point() +
      scale_x_log10() + scale_y_log10()