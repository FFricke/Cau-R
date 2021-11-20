library(odbc)
con <- dbConnect(odbc(),
                 Driver = "PostgreSQL Driver",
                 Server = "192.168.178.32",
                 Database = "postgres",
                 UID = "postgres",
                 PWD = "?Post!gres,fo24",
                 Port = 5432)