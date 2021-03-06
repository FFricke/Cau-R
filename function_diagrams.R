manual <- function(spectrum, labelling)
{
scale_fill_manual(values = c(spectrum), labels = c(labelling))
}
  
diagramm_ca <- function(data, element_1, element_2, variable)
  {
  ggplot(
    data = filter_ca, aes(x={{element_1}}, y={{element_2}})) +
    geom_point(shape=21,
               aes(fill={{variable}})) +
    scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1) + 
    theme_bw() +
    guides(fill=guide_legend(title=NULL))
}

diagramm_hist_ca <- function(data, element, variable)
{
  ggplot(
    data = filter_ca, aes(x={{element}})) +
    geom_histogram(
      aes(fill={{variable}})) +
    scale_x_log10() + 
    theme_bw() +
    guides(fill=guide_legend(title=NULL)) +
    facet_grid(rows = vars({{variable}}))
}

diagramm_box_ca <- function(data, element, variable)
{
  ggplot(
    data = filter_ca, aes(x={{element}})) +
    geom_boxplot(
      aes(fill={{variable}})) +
    theme_bw() +
    guides(fill=guide_legend(title=NULL)) +
    facet_grid(rows = vars({{variable}}))
}


diagramm_pb_207 <- function(data, variable)
{
  ggplot(data=filter_pb,  aes(x=pb206_204, y=pb207_204)) +
    geom_point(shape=21,
               aes(fill={{variable}})) +
    coord_fixed(ratio = 1) +
    xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[207],Pb[204]))) + 
    theme_bw() + 
    guides(fill=guide_legend(title=NULL))
}

diagramm_pb_208 <- function(data, variable)
{
  ggplot(data=filter_pb, aes(x=pb206_204, y=pb208_204)) +
    geom_point(shape=21,
               aes(fill={{variable}})) +
    coord_fixed(ratio = 1) +
    xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[208],Pb[204]))) + 
    theme_bw() + 
    guides(fill=guide_legend(title=NULL))
}

diagramm_1_pb_206 <- function(data, element, variable)
{
  ggplot(
    data = filter_pb, aes(x=1/{{element}}, y=pb206_204)) +
    geom_point(shape=21,
               aes(fill={{variable}})) +
    scale_x_log10() +
    ylab(expression(frac(Pb[206],Pb[204]))) + 
    theme_bw() +
    guides(fill=guide_legend(title=NULL))
}
  
diagramm_1_pb_207 <- function(data, element, variable)
{
  ggplot(
    data = filter_pb, aes(x=1/{{element}}, y=pb207_204)) +
    geom_point(shape=21,
               aes(fill={{variable}})) +
    scale_x_log10() +
    ylab(expression(frac(Pb[207],Pb[204]))) + 
    theme_bw() +
    guides(fill=guide_legend(title=NULL))
}
  
diagramm_1_pb_208 <- function(data, element, variable)
{
  ggplot(
    data = filter_pb, aes(x=1/{{element}}, y=pb208_204)) +
    geom_point(shape=21,
               aes(fill={{variable}})) +
    scale_x_log10() +
    ylab(expression(frac(Pb[208],Pb[204]))) + 
    theme_bw() +
    guides(fill=guide_legend(title=NULL))
}
