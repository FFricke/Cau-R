library(tidyverse)
library(usethis)
library(gitcreds)
library(cluster)
library(ggdendro)
library(broom)
library(ggrepel)
library(rlang)
library(cowplot)
library(NbClust)
library(factoextra)
library(FactoMineR)
options(scipen = 999)

col_culture <- c(
  "0" = "#888888",
  "1" = "#888888",
  "2" = "#1f78b4",
  "3" = "#b2df8a",
  "4" = "#a6cee3",
  "5" = "#ff7f00",
  "6" = "#888888",
  "7" = "#888888",
  "8" = "#888888",
  "9" = "#fdbf6f",
  "10" = "#fb9a99",
  "11" = "#888888",
  "12" = "#888888",
  "13" = "#888888",
  "14" = "#888888",
  "15" = "#888888",
  "16" = "#6a3d9a",
  "17" = "#ffff99",
  "18" = "#888888",
  "19" = "#888888",
  "20" = "#cab2d6",
  "21" = "#888888",
  "22" = "#33a02c",
  "23" = "#888888",
  "24" = "#e31a1c",
  "25" = "#b15928",
  "1000" = "#888888"
)

lab_dt_culture <- c(
  "0" = "Vermischt",
  "1" = "Sejma-Turbino",
  "2" = "Maykop",
  "3" = "Kura-Arax",
  "4" = "Anatolische & Mesopotamische Kulturen",
  "5" = "Leilatepe",
  "6" = "Martkopi",
  "7" = "Meshoko",
  "8" = "Velikent",
  "9" = "Yamnaya",
  "10" = "Katakombnaya",
  "11" = "Altheim",
  "12" = "Auvernge",
  "13" = "Baden",
  "14" = "Bischeim",
  "15" = "Cham",
  "16" = "Cortaillod",
  "17" = "Glockenbecher",
  "18" = "Jevisovice",
  "19" = "Klassisches Aunjetitz",
  "20" = "Mondsee",
  "21" = "Pfyn",
  "22" = "Schnurbandkeramik",
  "23" = "Stollhof",
  "24" = "Tripolye",
  "25" = "Nordkaukasus",
  "1000" = "Undefiniert"
)

lab_en_culture <- c(
  "0" = "Mixed",
  "1" = "Seima-Turbino",
  "2" = "Maykop",
  "3" = "Kura-Arax",
  "4" = "Anatolian & Mesopotamian Cultures",
  "5" = "Leilatepe",
  "6" = "Martkopi",
  "7" = "Meshoko",
  "8" = "Velikent",
  "9" = "Yamnaya",
  "10" = "Katakombnaya",
  "11" = "Altheim",
  "12" = "Auvernge",
  "13" = "Baden",
  "14" = "Bischeim",
  "15" = "Cham",
  "16" = "Cortaillod",
  "17" = "Bell Beaker",
  "18" = "Jevisovice",
  "19" = "Classic Aunjetitz",
  "20" = "Mondsee",
  "21" = "Pfyn",
  "22" = "Corded Ware",
  "23" = "Stollhof",
  "24" = "Tripolye",
  "25" = "North Caucasian",
  "1000" = "Undefined"
)

culture_id <- list(col_culture, lab_en_culture, lab_dt_culture)
names(culture_id) <- c("col", "en", "dt")

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
  "9" = "#ffff99",
  "1000" = "#888888"
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
  "9" = "elements of chariots",
  "1000" = "Undefined"
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
  "9" = "Wagenbestandteile",
  "1000" = "Undefiniert"
)

find_character_id <- list(col_find_character, lab_en_find_character, lab_dt_find_character)
names(find_character_id) <- c("col", "en", "dt")

col_cluster <- c(
  "1" = "#f8766d",
  "2" = "#7cae00",
  "3" = "#00bfc4",
  "4" = "#c181f1",
  "NA" = "#676767"
)

lab_cluster <- c(
  "1" = "Cluster 1",
  "2" = "Cluster 2",
  "3" = "Cluster 3",
  "4" = "Cluster 4",
  "NA" = "NA"
)

form_cluster <- c (
  "1" = "21",
  "2" = "22",
  "3" = "23",
  "4" = "24"
)

col_region <- c(
  "1" = "#b2df8a",
  "2" = "#33a02c",
  "3" = "#1f78b4",
  "4" = "#6a3d9a",
  "5" = "#ff7f00",
  "6" = "#888888",
  "7" = "#888888",
  "8" = "#888888",
  "9" = "#888888",
  "10" = "#888888",
  "11" = "#ffff99",
  "12" = "#888888",
  "13" = "#888888",
  "14" = "#888888",
  "15" = "#a6cee3",
  "16" = "#e31a1c",
  "17" = "#fdbf6f",
  "18" = "#cab2d6",
  "19" = "#fb9a99",
  "19" = "#fb9a99",
  "20" = "#888888"
)

lab_dt_region <- c(
  "1" = "Transkaukasus",
  "2" = "Ciskaukasus",
  "3" = "Anatolien",
  "4" = "Syrien & Irak",
  "5" = "Iran",
  "6" = "Israel",
  "7" = "Italien",
  "8" = "Benelux & NW-Deutschland",
  "9" = "SW-Mitteleuropa",
  "10" = "Österreich & Ostalpen",
  "11" = "Polen",
  "12" = "Skandinavien",
  "13" = "Ostdeutschland",
  "14" = "Böhmen & Mähren",
  "15" = "Karpatenbecken",
  "16" = "Ehemaliges Jugoslavien & Albanien",
  "17" = "Griechenland",
  "18" = "Bulgarien & Rumänien",
  "19" = "Ukraine/Südrussische Steppe",
  "20" = "Zypern"
)

lab_en_region <- c(
  "1" = "Transcaucasus",
  "2" = "Ciscaucasus",
  "3" = "Anatolia",
  "4" = "Syria and Iraq",
  "5" = "Iran",
  "6" = "Israel",
  "7" = "Italy",
  "8" = "Benelux-States & NW-Germany",
  "9" = "SW-Middleurope",
  "10" = "Austria & Eastern Alpes",
  "11" = "Poland",
  "12" = "Skandinavia",
  "13" = "E-Germany",
  "14" = "Czechia",
  "15" = "Carpathian Basin",
  "16" = "Former Yugolsavia and Albania",
  "17" = "Greece",
  "18" = "Bulgaria & Rumania",
  "19" = "Ukrainian & Southern-Russian Steppe",
  "20" = "Cyprus"
)

region_id <- list(col_region, lab_en_region, lab_dt_region)
names(region_id) <- c("col", "en", "dt")

col_clust_hard <- c(
  "1" = "#1f78b4",
  "2" = "#33a02b",
  "3" = "#e3211c",
  "4" = "#ff7f00",
  "5" = "#6a3d9a",
  "6" = "#b5683f",
  "7" = "#a6cee3",
  "8" = "#b2df8a",
  "9" = "#fb9a99",
  "10" = "#fdbf6f",
  "11" = "#cab2d6",
  "12" = "#fffd99"
)

lab_dt_clust_hard <- c(
  "1" = "Cluster 1",
  "2" = "Cluster 2",
  "3" = "Cluster 3",
  "4" = "Cluster 4",
  "5" = "Cluster 5",
  "6" = "Cluster 6",
  "7" = "Cluster 7",
  "8" = "Cluster 8",
  "9" = "Cluster 9",
  "10" = "Cluster 10",
  "11" = "Cluster 11",
  "12" = "Cluster 12"
)

lab_en_clust_hard <- c(
  "1" = "Cluster 1",
  "2" = "Cluster 2",
  "3" = "Cluster 3",
  "4" = "Cluster 4",
  "5" = "Cluster 5",
  "6" = "Cluster 6",
  "7" = "Cluster 7",
  "8" = "Cluster 8",
  "9" = "Cluster 9",
  "10" = "Cluster 10",
  "11" = "Cluster 11",
  "12" = "Cluster 12"
)

clust_hard <- list(col_clust_hard, lab_en_clust_hard, lab_dt_clust_hard)
names(clust_hard) <- c("col", "en", "dt")

col_clust_col <- c(
  "1" = "#1f78b4",
  "2" = "#33a02b",
  "3" = "#e3211c",
  "4" = "#ff7f00",
  "5" = "#6a3d9a",
  "6" = "#b5683f",
  "7" = "#a6cee3",
  "8" = "#b2df8a",
  "9" = "#fb9a99",
  "10" = "#fdbf6f",
  "11" = "#cab2d6",
  "12" = "#fffd99"
)

lab_dt_clust_col <- c(
  "1" = "Cluster 1",
  "2" = "Cluster 2",
  "3" = "Cluster 3",
  "4" = "Cluster 4",
  "5" = "Cluster 5",
  "6" = "Cluster 6",
  "7" = "Cluster 7",
  "8" = "Cluster 8",
  "9" = "Cluster 9",
  "10" = "Cluster 10",
  "11" = "Cluster 11",
  "12" = "Cluster 12"
)

lab_en_clust_col <- c(
  "1" = "Cluster 1",
  "2" = "Cluster 2",
  "3" = "Cluster 3",
  "4" = "Cluster 4",
  "5" = "Cluster 5",
  "6" = "Cluster 6",
  "7" = "Cluster 7",
  "8" = "Cluster 8",
  "9" = "Cluster 9",
  "10" = "Cluster 10",
  "11" = "Cluster 11",
  "12" = "Cluster 12"
)

clust_col <- list(col_clust_col, lab_en_clust_col, lab_dt_clust_col)
names(clust_col) <- c("col", "en", "dt")

col_mclust <- c(
  "0" = "#888888",
  "1" = "#1f78b4",
  "2" = "#33a02b",
  "3" = "#e3211c",
  "4" = "#ff7f00",
  "5" = "#6a3d9a",
  "6" = "#b5683f",
  "7" = "#a6cee3",
  "8" = "#b2df8a",
  "9" = "#fb9a99",
  "10" = "#fdbf6f",
  "11" = "#cab2d6",
  "12" = "#fffd99"
)

lab_dt_mclust <- c(
  "0" = "Keine Cluster",
  "1" = "Cluster 1",
  "2" = "Cluster 2",
  "3" = "Cluster 3",
  "4" = "Cluster 4",
  "5" = "Cluster 5",
  "6" = "Cluster 6",
  "7" = "Cluster 7",
  "8" = "Cluster 8",
  "9" = "Cluster 9",
  "10" = "Cluster 10",
  "11" = "Cluster 11",
  "12" = "Cluster 12"
)

lab_en_mclust <- c(
  "0" = "no Cluster",
  "1" = "Cluster 1",
  "2" = "Cluster 2",
  "3" = "Cluster 3",
  "4" = "Cluster 4",
  "5" = "Cluster 5",
  "6" = "Cluster 6",
  "7" = "Cluster 7",
  "8" = "Cluster 8",
  "9" = "Cluster 9",
  "10" = "Cluster 10",
  "11" = "Cluster 11",
  "12" = "Cluster 12"
)

mclust <- list(col_mclust, lab_en_mclust, lab_dt_mclust)
names(mclust) <- c("col", "en", "dt")

col_mclust_group <- c(
  "0" = "#888888",
  "1" = "#1f78b4",
  "2" = "#33a02b",
  "3" = "#e3211c",
  "4" = "#ff7f00",
  "5" = "#6a3d9a",
  "6" = "#b5683f",
  "7" = "#a6cee3",
  "8" = "#b2df8a",
  "9" = "#fb9a99",
  "10" = "#fdbf6f",
  "11" = "#cab2d6",
  "12" = "#fffd99"
)

lab_dt_mclust_group <- c(
  "0" = "Keine Gruppe",
  "1" = "Gruppe 1",
  "2" = "Gruppe 2",
  "3" = "Gruppe 3",
  "4" = "Gruppe 4",
  "5" = "Gruppe 5",
  "6" = "Gruppe 6",
  "7" = "Gruppe 7",
  "8" = "Gruppe 8",
  "9" = "Gruppe 9",
  "10" = "Gruppe 10",
  "11" = "Gruppe 11",
  "12" = "Gruppe 12"
)

lab_en_mclust_group <- c(
  "0" = "no Group",
  "1" = "Group 1",
  "2" = "Group 2",
  "3" = "Group 3",
  "4" = "Group 4",
  "5" = "Group 5",
  "6" = "Group 6",
  "7" = "Group 7",
  "8" = "Group 8",
  "9" = "Group 9",
  "10" = "Group 10",
  "11" = "Group 11",
  "12" = "Group 12"
)

mclust_group <- list(col_mclust_group, lab_en_mclust_group, lab_dt_mclust_group)
names(mclust_group) <- c("col", "en", "dt")