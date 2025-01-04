library(tidyverse) 
library(httr) 
library(rvest) 
library(rstudioapi)
library(sqldf)
library(ggplot2)
library(questionr)

Escarpins_df <- read.csv("/Users/moualeumanickleolin/Desktop/TD R/resultats/Escarpins_df.csv", sep = ";")


# Etape d'analyse des données avec SQL

# Nombre Escarpins present sur le site de Carel chaussure
sqldf("select count (nom) as NombreEscarpins
      from Escarpins_df ")

sqldf("select DISTINCT (id) as NombreEscarpins
      from Escarpins_df ")


#  Carel chaussure Escarpins Max/MIN prix 
sqldf("SELECT Nom, MIN(Prix) AS EscarpinLeMoinsCher, SousTitre
       FROM Escarpins_df")
sqldf("SELECT Nom, MAX(Prix) AS EscarpinLePlusCher, SousTitre
       FROM Escarpins_df")
# La moyenne des prix des Escarpins  chez Carel chaussure 
sqldf("SELECT  AVG(Prix) AS EscarpinsPrixMoyen
       FROM Escarpins_df")
# Calcule de l'étendu des prix des Escarpins  chez Carel chaussure 

sqldf("SELECT MAX(Prix) - MIN(Prix) AS EtenduDesPrix
       FROM Escarpins_df")
#calcule du mode
sqldf("SELECT Prix, COUNT(*) AS Frequency
                          FROM Escarpins_df
                          GROUP BY Prix
                          ORDER BY Frequency DESC
                          LIMIT 1")



#  Création Boxplot
ggplot(Escarpins_df_NA , aes(x = "", y = Prix)) +
  geom_boxplot(fill = "lightgreen", color = "black") +
  labs(title = "Boxplot des Prix des Escarpins",
       x = " ",
       y = "Prix (en euros)") +
  scale_y_continuous(breaks = seq(350, 555, by = 25)) + 
  theme_minimal()
# hey manick
