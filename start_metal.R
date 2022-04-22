library(tidyverse)
library(usethis)
library(gitcreds)
library(cluster)
library(ggdendro)
library(broom)
library(ggrepel)
library(rlang)
options(scipen = 999)
col_culture <- c(
  "Vergleichsraum Sued" = "#a6cee3",
  "Maykop" = "#1f78b4",
  "Kura-Arax" = "#b2df8a",
  "Corded Ware" = "#33a02c",
  "Katakombnaya" = "#fb9a99",
  "Tripolye" = "#e31a1c",
  "Yamnaya" = "#fdbf6f",
  "Leilatepe" = "#ff7f00",
  "Mondsee" = "#cab2d6",
  "Cortaillod" = "#6a3d9a",
  "Bell-Beaker" = "#ffff99",
  "Stollhof" = "#b15928"
)
col_find_character <- c(
  "axes and adzes" = "#a6cee3",
  "elements of dress/jewelry" ="#1f78b4",
  "awls, chisels and other tools" = "#b2df8a",
  "daggers and other blades" = "#33a02c",
  "vessels" = "#fb9a99",
  "lances and other tips" = "#e31a1c",
  "ingots and casting-rests" = "#fdbf6f",
  "unknown" = "#ff7f00",
  "maceheads" = "#cab2d6",
  "rivets" = "#6a3d9a",
  "elements of chariots" = "#ffff99"
)
col_cluster <- c(
  "1" = "#f8766d",
  "2" = "#7cae00",
  "3" = "#00bfc4",
  "4" = "#00bfc4",
  "NA" = "#676767"
)