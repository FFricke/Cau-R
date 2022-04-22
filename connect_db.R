library(odbc)
library(DBI)
con <- dbConnect(odbc(),
                 Driver = "PostgreSQL",
                 Server = "archmetal.nerdnose.net",
                 Database = "postgres",
                 UID = "postgres",
                 PWD = "Postgresfo24",
                 Port = 5432)