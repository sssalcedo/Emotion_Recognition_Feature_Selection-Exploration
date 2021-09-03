
install.packages(c("readxl","writexl")) 
install.packages("kohonen")

library(kohonen) # used for SOM
library(datasets) # For the Iris data
library(cluster) # used for pam
library(readxl)
library(kohonen) # used for SOM
library(writexl)
library(fossil)
#---------------Different contexts (GeMaps88)------------------------------
#normalisation

library(datasets) # For the Iris data

library(cluster) # used for pam

data <- read.csv('inputs-Trimed/Triumph_awe_BackE_Trimed_eGeMAPSv01b_acoustics.csv', header = TRUE)

head(data)
X = as.matrix(data[,-1])
Y = as.numeric(data$labels)
head(X)
head(Y)

pam.Euc <- pam(X,2,diss = FALSE)
table(pam.Euc$cluster,data$labels)

rand.index(pam.Euc$cluster,Y)
adj.rand.index(pam.Euc$cluster,Y)

library(data.table)
library(stringi)
library("writexl")
library(dplyr)
library("tidyverse")
library(tibble)
# https://drive.google.com/drive/my-drive
