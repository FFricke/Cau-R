##Diagramme für chemische Analysen##
 
scatter_dlog <- function(data, x, y, var)
  {
  ggplot(
    data = data, aes(x = .data[[x]], y = .data[[y]])) +
    geom_point(shape=21,
               aes(fill={{var}})) +
    scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1) + 
    theme_bw() +
    theme(legend.position = "bottom", legend.direction = "horizontal") +
    guides(fill=guide_legend(title=NULL)) +
    scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
}

range_dlog <- function(data, x, y, var, xmin, xmax, ymin, ymax)
{
  ggplot(
    data = data, aes(x = .data[[x]], y = .data[[y]])) +
    geom_point(shape=21,
               aes(fill={{var}})) +
    geom_errorbar(aes(ymin = ymin, ymax = ymax)) +
    geom_errorbar(aes(ymin = xmin, ymax = xmax)) +
    scale_x_log10() + scale_y_log10() + coord_fixed(ratio = 1) + 
    theme_bw() +
    theme(legend.position = "bottom", legend.direction = "horizontal") +
    guides(fill=guide_legend(title=NULL)) +
    scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
}

scatter_xlog <- function(data, x, y, var)
{
  ggplot(
    data = data, aes(x = .data[[x]], y = .data[[y]])) +
    geom_point(shape=21,
               aes(fill={{var}})) +
    scale_x_log10() +
    theme_bw() +
    theme(legend.position = "bottom", legend.direction = "horizontal") +
    guides(fill=guide_legend(title=NULL)) +
    scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
}

scatter <- function(data, x, y, var)
{
  ggplot(
    data = data, aes(x = .data[[x]], y = .data[[y]])) +
    geom_point(shape=21,
               aes(fill={{var}})) +
    coord_fixed(ratio = 1) + 
    theme_bw() +
    theme(legend.position = "bottom", legend.direction = "horizontal") +
    guides(fill=guide_legend(title=NULL)) +
    scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force) 
}
  
histo_log <- function(data, x, var, bin)
{
  ggplot(
    data = data, aes(x = .data[[x]])) +
    geom_histogram(binwidth = bin,
      aes(fill={{var}})) +
    scale_x_log10() + 
    theme_bw() +
    theme(legend.position = "none") +
    guides(fill=guide_legend(title=NULL)) +
    scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
}

histo <- function(data, x, var, bin)
{
  ggplot(
    data = data, aes(x = .data[[x]])) +
    geom_histogram(binwidth = bin,
                   aes(fill={{var}})) + 
    theme_bw() +
    theme(legend.position = "bottom", legend.direction = "horizontal") +
    guides(fill=guide_legend(title=NULL)) +
    scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
}

box_log <- function(data, x, var)
{
  ggplot(
    data = data, aes(x = .data[[x]])) +
    geom_boxplot(
      aes(fill={{var}})) +
    scale_x_log10() + 
    theme_bw() +
    guides(fill=guide_legend(title=NULL))+
    scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
}

box <- function(data, x, var)
{
  ggplot(
    data = data, aes(x = .data[[x]])) +
    geom_boxplot(
      aes(fill={{var}})) +
    theme_bw() +
    guides(fill=guide_legend(title=NULL))+
    scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
}

bar <- function(data, x, var)
{
  ggplot(
    data = data, aes(.data[[x]])) +
    geom_bar(aes(fill={{var}})) + 
    theme_bw() +
    theme(legend.position = "bottom", legend.direction = "horizontal") +
    guides(fill=guide_legend(title=NULL)) +
    scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
}

##Pb-Isotopendiagrasmme##


diagramm_pb_207 <- function(data, var)
{
  ggplot(data=data,  aes(x=pb206_204, y=pb207_204)) +
    geom_point(shape=21,
               aes(fill={{var}})) +
    coord_fixed(ratio = 1) +
    xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[207],Pb[204]))) + 
    theme_bw() + 
    guides(fill=guide_legend(title=NULL)) +
    scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
}

diagramm_pb_208 <- function(data, var)
{
  ggplot(data=data, aes(x=pb206_204, y=pb208_204)) +
    geom_point(shape=21,
               aes(fill={{var}})) +
    coord_fixed(ratio = 1) +
    xlab(expression(frac(Pb[206],Pb[204]))) + ylab(expression(frac(Pb[208],Pb[204]))) + 
    theme_bw() + 
    guides(fill=guide_legend(title=NULL)) +
    scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
}


##Vermischungsdiagramme##
##1/Pb-Isotopen-Diagramme##

diagramm_1_pb_206 <- function(data, x, var)
{
  ggplot(
    data = data, aes(x=1/{{x}}, y=pb206_204)) +
    geom_point(shape=21,
               aes(fill={{var}})) +
    scale_x_log10() +
    ylab(expression(frac(Pb[206],Pb[204]))) + 
    theme_bw() +
    guides(fill=guide_legend(title=NULL)) #
  scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
}
  
diagramm_1_pb_207 <- function(data, x, var)
{
  ggplot(
    data = data, aes(x=1/{{x}}, y=pb207_204)) +
    geom_point(shape=21,
               aes(fill={{var}})) +
    scale_x_log10() +
    ylab(expression(frac(Pb[207],Pb[204]))) + 
    theme_bw() +
    guides(fill=guide_legend(title=NULL)) +
    scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
}
  
diagramm_1_pb_208 <- function(data, x, var)
{
  ggplot(
    data = data, aes(x=1/{{x}}, y=pb208_204)) +
    geom_point(shape=21,
               aes(fill={{var}})) +
    scale_x_log10() +
    ylab(expression(frac(Pb[208],Pb[204]))) + 
    theme_bw() +
    guides(fill=guide_legend(title=NULL)) +
    scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
}

##x/Pb-Isotopen-Diagramme##

diagramm_el_pb_206 <- function(data, x, var)
{
  ggplot(
    data = data, aes(x={{x}}/Pb, y=pb206_204)) +
    geom_point(size = 2,
               aes(fill={{var}}, shape={{var}})) +
    scale_x_log10() +
    ylab(expression(frac(Pb[206],Pb[204]))) + 
    theme_bw() +
    guides(fill=guide_legend(title=NULL)) +
    scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
}

diagramm_el_pb_207 <- function(data, x, var)
{
  ggplot(
    data = data, aes(x={{x}}/Pb, y=pb207_204)) +
    geom_point(size = 2,
               aes(fill={{var}}, shape={{var}})) +
    scale_x_log10() +
    ylab(expression(frac(Pb[207],Pb[204]))) + 
    theme_bw() +
    guides(fill=guide_legend(title=NULL)) +
    scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
}

diagramm_el_pb_208 <- function(data, x, var)
{
  ggplot(
    data = data, aes(x={{x}}/Pb, y=pb208_204)) +
    geom_point(size = 2,
               aes(fill={{var}}, shape={{var}})) +
    scale_x_log10() +
    ylab(expression(frac(Pb[208],Pb[204]))) + 
    theme_bw() +
    guides(fill=guide_legend(title=NULL)) +
    scale_fill_manual(values = c(var$col), labels = c(var$en), limits = force)
}
