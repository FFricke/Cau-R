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
  "4" = "#a6cee3",
  "2" = "#1f78b4",
  "3" = "#b2df8a",
  "22" = "#33a02c",
  "10" = "#fb9a99",
  "24" = "#e31a1c",
  "9" = "#fdbf6f",
  "5" = "#ff7f00",
  "20" = "#cab2d6",
  "16" = "#6a3d9a",
  "17" = "#ffff99",
  "23" = "#b15928"
)

lab_dt_culture <- c(
  "4" = "Anatolische & Mesopotamische Kulturen",
  "2" = "Maykop",
  "3" = "Kura-Arax",
  "22" = "Schnurbandkeramik",
  "10" = "Katakombnaya",
  "24" = "Tripolye",
  "9" = "Yamnaya",
  "5" = "Leilatepe",
  "20" = "Mondsee",
  "16" = "Cortaillod",
  "17" = "Glockenbecher",
  "23" = "Stollhof"
)

lab_en_culture <- c(
  "4" = "Anatolian & Mesopotamian Cultures",
  "2" = "Maykop",
  "3" = "Kura-Arax",
  "22" = "Corded Ware",
  "10" = "Katakombnaya",
  "24" = "Tripolye",
  "9" = "Yamnaya",
  "5" = "Leilatepe",
  "20" = "Mondsee",
  "16" = "Cortaillod",
  "17" = "Bell-Beaker",
  "23" = "Stollhof"
)

col_find_character <- c(
  "2" = "#a6cee3",
  "1" ="#1f78b4",
  "4" = "#b2df8a",
  "3" = "#33a02c",
  "6" = "#fb9a99",
  "5" = "#e31a1c",
  "7" = "#fdbf6f",
  "0" = "#ff7f00",
  "10" = "#cab2d6",
  "8" = "#6a3d9a",
  "9" = "#ffff99"
)

lab_en_find_character <- c(
  "2" = "axes and adzes",
  "1" = "elements of dress/jewelry",
  "4" = "awls, chisels and other tools",
  "3" = "daggers and other blades",
  "6" = "vessels",
  "5" = "lances and other tips",
  "7" = "ingots and casting-rests",
  "0" = "unknown",
  "10" = "maceheads",
  "8" = "rivets",
  "9" = "elements of chariots"
)

lab_dt_find_character <- c(
  "2" = "Äxte und Beile",
  "1" = "Trachtbestandteile",
  "4" = "Pfrieme, Meißel und andere Geraete",
  "3" = "Dolche und andere Klingen",
  "6" = "Gefäße",
  "5" = "Lanzen und andere Spitzen",
  "7" = "Barren und Gussreste",
  "0" = "unbekannt",
  "10" = "Streitkolben",
  "8" = "Nieten",
  "9" = "Wagenbestandteile"
)

col_cluster <- c(
  "1" = "#f8766d",
  "2" = "#7cae00",
  "3" = "#00bfc4",
  "4" = "#00bfc4",
  "NA" = "#676767"
)

lab_cluster <- c(
  "1" = "Cluster_1",
  "2" = "Cluster 2",
  "3" = "Cluster 3",
  "4" = "Cluster 4",
  "NA" = "NA"
)

col_region <- c(
  "15" = "#a6cee3",
  "3" = "#1f78b4",
  "1" = "#b2df8a",
  "2" = "#33a02c",
  "19" = "#fb9a99",
  "16" = "#e31a1c",
  "17" = "#fdbf6f",
  "5" = "#ff7f00",
  "18" = "#cab2d6",
  "4" = "#6a3d9a",
  "11" = "#ffff99"
)

lab_dt_region <- c(
  "15" = "Karpatenbecken",
  "3" = "Anatolien",
  "1" = "Transkaukasus",
  "2" = "Ciskaukasus",
  "19" = "Ukraine/Südrussische Steppe",
  "16" = "Ehemaliges Jugoslavien & Albanien",
  "17" = "Griechenland",
  "5" = "Iran",
  "18" = "Bulgarien & Rumänien",
  "4" = "Syrien & Irak",
  "11" = "Polen"
)

lab_en_region <- c(
  "15" = "Caparthians",
  "3" = "Anatolia",
  "1" = "Transcaucasia",
  "2" = "Ciscaucasia",
  "19" = "Ukraine/Southern Russian Steppe",
  "16" = "Former Jugoslavia & Albania",
  "17" = "Greece",
  "5" = "Iran",
  "18" = "Bulgaria & Rumania",
  "4" = "Syria & Iraq",
  "11" = "Poland"
)