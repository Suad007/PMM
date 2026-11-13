# HÜ 2026-11-10 – R-Tooling
# CSV einlesen und die Daten als Excel-Datei wieder ins R-Projekt schreiben
# Autor: Suad Bajraktarovic
# Abgabe: 2026-11-17

library(tidyverse)
library(writexl)

# 1) CSV einlesen (Pfad relativ zum RStudio-Projekt)
m <- read_csv("data/betriebsdaten.csv")

# Alternativ mit Base R (ohne tidyverse):
# m <- read.csv("data/betriebsdaten.csv")

# 2) Daten als Excel-Datei ins Projekt zurückschreiben.
#    write_xlsx() stammt aus dem Paket "writexl" und benötigt kein Java.
write_xlsx(m, "data/betriebsdaten.xlsx")

# 3) Kontrolle: die erzeugte Excel-Datei wieder einlesen
m_excel <- readxl::read_excel("data/betriebsdaten.xlsx")
m_excel

# Alternative zu writexl (falls gewünscht):
# openxlsx::write.xlsx(m, "data/betriebsdaten.xlsx")
