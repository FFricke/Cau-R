##Doppellogs##
doppellog <- function(data, element_1, element_2, variable, spectrum){
ggplot(
  data = data, aes(x={{element_1}}, y={{element_2}})) +
  geom_point(shape=21,
    aes(fill={{variable}})) +
  scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1) + 
  theme_bw() +
  scale_fill_manual(values = c(spectrum)) + 
    guides(fill=guide_legend(title=NULL))
    }
