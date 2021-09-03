
install.packages(c("readxl","writexl")) 
install.packages("kohonen")

library(kohonen) # used for SOM
library(datasets) # For the Iris data
library(cluster) # used for pam
library(readxl)
library(writexl)

#---------------Different contexts (GeMaps88)------------------------------
#normalisation
install.packages("fossil")
install.packages("kohonen")
library(kohonen) # used for SOM
library(datasets) # For the Iris data
library(fossil)
library(cluster) # used for pam

data <- read.csv('inputs-Trimed/Triumph_tenderness_BackE_Trimed_eGeMAPSv01b_acoustics.csv', header = TRUE)

head(data)
df = as.matrix(data[,-1])
labels = as.numeric(data$labels)
labels 
head(df)
head(labels)


data(iris)
summary(iris)
X = as.matrix(iris[,-5])
Y = as.numeric(iris$Species)
head(X)
head(Y)

c1 = 10
c2 = 7

kohmap <- som(as.matrix(df), grid = somgrid(c1, c2, "hexagonal"), rlen=300000)
par(mfrow = c(1,1))
plot(kohmap, type="changes")
plot(kohmap, type="dist.neighb")



par(mfrow = c(1,2))
counts <- plot(kohmap, type="counts", shape = "straight")

plot(kohmap, type="dist.neighb")
# par(mfrow = c(1,1))
similarities <- plot(kohmap, type="quality", palette.name = terrain.colors) 

plot(kohmap, type = "mapping",labels = as.integer(labels), col = as.integer(labels),main = "mapping plot")

par(mfrow = c(1,1))
plot(kohmap, type="codes", shape="straight",main="profiles")


library(data.table)
library(stringi)
library("writexl")
library(dplyr)
library("tidyverse")
library(tibble)
# https://drive.google.com/drive/my-drive
