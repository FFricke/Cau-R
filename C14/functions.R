spd_all <- function(dataframe, min, max)
{
  
  spd(calibrate(dataframe$cra, dataframe$error),
      timeRange = (c(max, min)))
}

combine_all <- function(dataframe)
{
  combine(calibrate(x=dataframe$cra, errors=dataframe$error), fixIDs = TRUE)
}

idea <- function(dataframe, min, max, level)
{
  output.idea <- spd(calibrate(dataframe$cra, dataframe$error),
                     timeRange = (c(max, min))
  )$grid
  output.idea$avg[output.idea$PrDens>=level] <- dataframe$avg
  output.idea$avg[output.idea$PrDens<level] <- 0
  output.idea$median[output.idea$PrDens>=level] <- dataframe$median
  output.idea$median[output.idea$PrDens<level] <- 0
  output.idea$onesigma_1[output.idea$PrDens>=level] <- dataframe$onesigma_1
  output.idea$onesigma_1[output.idea$PrDens<level] <- 0
  output.idea$onesigma_2[output.idea$PrDens>=level] <- dataframe$onesigma_2
  output.idea$onesigma_2[output.idea$PrDens<level] <- 0
  output.idea$twosigma_1[output.idea$PrDens>=level] <- dataframe$twosigma_1
  output.idea$twosigma_1[output.idea$PrDens<level] <- 0
  output.idea$twosigma_2[output.idea$PrDens>=level] <- dataframe$twosigma_2
  output.idea$twosigma_2[output.idea$PrDens<level] <- 0
  output.idea$count[output.idea$PrDens>=level] <- 1
  output.idea$count[output.idea$PrDens<level] <- 0
  print(output.idea)
}

idea.2 <- function(dataframe, min, max, level)
{
  expl.idea.x <- unique(dataframe$site_id)
  map(expl.idea.x,
      ~idea(
        filter(dataframe, site_id==.x), min, max, level))
}

idea.3 <- function(dataframe, min, max, level)
{
  output.idea.3.1 <- idea.2(dataframe, min, max, level)
  output.idea.3.2 <- Reduce(f = "+", output.idea.3.1)
  output.idea.3.2$calBP <-  output.idea.3.2$calBP/length(output.idea.3.1)
  output.idea.3.2$median <- output.idea.3.2$median/output.idea.3.2$count
  output.idea.3.2$avg <- output.idea.3.2$avg/output.idea.3.2$count
  output.idea.3.2$onesigma_1 <- output.idea.3.2$onesigma_1/output.idea.3.2$count
  output.idea.3.2$onesigma_2 <- output.idea.3.2$onesigma_2/output.idea.3.2$count
  output.idea.3.2$twosigma_1 <- output.idea.3.2$twosigma_1/output.idea.3.2$count
  output.idea.3.2$twosigma_2 <- output.idea.3.2$twosigma_2/output.idea.3.2$count
  output.idea.3.2$avg <- replace(output.idea.3.2$avg, is.na(output.idea.3.2$avg), 0)
  output.idea.3.2$median <- replace(output.idea.3.2$median, is.na(output.idea.3.2$median), 0)
  output.idea.3.2$onesigma_1 <- replace(output.idea.3.2$onesigma_1, is.na(output.idea.3.2$onesigma_1), 0)
  output.idea.3.2$onesigma_2 <- replace(output.idea.3.2$onesigma_2, is.na(output.idea.3.2$onesigma_2), 0)
  output.idea.3.2$twosigma_1 <- replace(output.idea.3.2$twosigma_1, is.na(output.idea.3.2$twosigma_1), 0)
  output.idea.3.2$twosigma_2 <- replace(output.idea.3.2$twosigma_2, is.na(output.idea.3.2$twosigma_2), 0)
  print(output.idea.3.2)
}

idea_plot <- function(dataframe)
{
  plot(dataframe$calBP, dataframe$PrDens/dataframe$count)
}

idea.4 <- function(dataframe, min, max, level)
{
  output.idea.4.1 <- dataframe
  output.idea.4.2 <- map(unique(na.omit(output.idea.4.1$culture_id)), ~idea.3(filter(output.idea.4.1, culture_id==.x), min, max, level))
  output.idea.4.3 <- Reduce(f = "+", output.idea.4.2)
  output.idea.4.3$calBP <-  output.idea.4.3$calBP/length(output.idea.4.2)
  output.idea.4.3$median <- output.idea.4.3$median/output.idea.4.3$count
  output.idea.4.3$avg <- output.idea.4.3$avg/output.idea.4.3$count
  output.idea.4.3$onesigma_1 <- output.idea.4.3$onesigma_1/output.idea.4.3$count
  output.idea.4.3$onesigma_2 <- output.idea.4.3$onesigma_2/output.idea.4.3$count
  output.idea.4.3$twosigma_1 <- output.idea.4.3$twosigma_1/output.idea.4.3$count
  output.idea.4.3$twosigma_2 <- output.idea.4.3$twosigma_2/output.idea.4.3$count
  output.idea.4.3$avg <- replace(output.idea.4.3$avg, is.na(output.idea.4.3$avg), 0)
  output.idea.4.3$median <- replace(output.idea.4.3$median, is.na(output.idea.4.3$median), 0)
  output.idea.4.3$onesigma_1 <- replace(output.idea.4.3$onesigma_1, is.na(output.idea.4.3$onesigma_1), 0)
  output.idea.4.3$onesigma_2 <- replace(output.idea.4.3$onesigma_2, is.na(output.idea.4.3$onesigma_2), 0)
  output.idea.4.3$twosigma_1 <- replace(output.idea.4.3$twosigma_1, is.na(output.idea.4.3$twosigma_1), 0)
  output.idea.4.3$twosigma_2 <- replace(output.idea.4.3$twosigma_2, is.na(output.idea.4.3$twosigma_2), 0)
  print(output.idea.4.3)
}

spd.sigma <- function(dataframe)
{
  output.1.spd.sigma <- spd_all(dataframe, 2000, 10000)
  output.1.spd.sigma$grid$PrDens <- output.1.spd.sigma$grid$PrDens/nrow(dataframe)
  output.2.spd.sigma <- output.1.spd.sigma$grid
  output.2.spd.sigma$BC <- output.2.spd.sigma$calBP - 1950
  output.2.spd.sigma$SumPrDens <- cumsum(output.2.spd.sigma$PrDens)
  output.3.spd.sigma <- filter(output.2.spd.sigma, SumPrDens>0.1585 & SumPrDens<0.8415)
  output.4.spd.sigma <- filter(output.2.spd.sigma, SumPrDens>0.046 & SumPrDens<0.977)
  output.5.spd.sigma <- filter(output.2.spd.sigma, SumPrDens>0.0015 & SumPrDens<0.9985)
  output.6.spd.sigma <- c("1-sigma", max(output.3.spd.sigma$BC), min(output.3.spd.sigma$BC))
  output.7.spd.sigma <- c("2-sigma", max(output.4.spd.sigma$BC), min(output.4.spd.sigma$BC))
  output.8.spd.sigma <- c("3-sigma", max(output.5.spd.sigma$BC), min(output.5.spd.sigma$BC))
  output.9.spd.sigma <- cbind(output.6.spd.sigma, output.7.spd.sigma, output.8.spd.sigma)
  print(output.9.spd.sigma)
}
