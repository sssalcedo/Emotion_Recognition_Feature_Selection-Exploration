
install.packages(c("readxl","writexl")) 


library(readxl)
library(writexl)

#---------------Different contexts (GeMaps88)------------------------------
#normalisation
data <- read.csv(file='Cachexia.csv')
head(data[,1:3])
intensity <- as.matrix(data)
head(intensity)

data <- read.csv('input/3SOM_BackE_X_Trimed_eGeMAPSv01b_acoustics.csv', header = TRUE)
head(data[,1:5])
intensity <- as.matrix(data)

#intensity <- abs(intensity)
head(intensity)


matplot(1:3568,intensity,type ="l",lwd=1,xlab='emotions', ylab='intensity')

matplot(1:5,t(intensity),type ="l",lwd=1,xlab='features', ylab='intensity')

logdata <- log(intensity)
head(logdata)
matplot(1:3568,logdata,type ="l",lwd=1,xlab='emotions', ylab='intensity')

matplot(1:5,t(logdata),type ="l",lwd=1,xlab='features', ylab='intensity')
ml= colMeans(logdata)
head(ml)
Xm=sweep(logdata,2,ml,FUN="-")
head(Xm)
ssqtotal <- sum(Xm*Xm)
ssqtotal
USV <- svd(Xm)
T_log <- USV$u %*% diag(USV$d)
P_log <- USV$v
head(T_log)
head(P_log)
npc <- 3
ssqtot <- 0 * (1:npc)
for (i in 1:npc){
  Xest  <- T_log[,1:i] %*% t(P_log[,1:i])
  ssqtot[i] <- 100 * (1-sum((Xm-Xest)*(Xm-Xest))/ssqtotal)
}
ssq=c(ssqtot[1],ssqtot[2:3]-ssqtot[1:2])
data.frame(ssq=ssq,ssqtot=ssqtot)
plot(T_log[1:3568,1],T_log[1:3568,2], pch=1, col="red", xlab= "PC1",ylab ="PC2", main = "tranformation scores")
par(mfrow=c(1,2))
#RMSE <- RMSECV(X1,20,5)
RMSE <- RMSECV(Xm,3,1)
plot(RMSE, xlab="#PC", ylab="RSMECV")

XPCA <- T_log[,1:3] %*% t(P_log[,1:3])
head(XPCA)
write.csv(XPCA,"C:/Users/jesus/Desktop/AMSTERDAM/psychology/Feature-Selection/PCA/output/PCA_eGeMAPSv01b_ScaledX_dutchFemales.csv", row.names = FALSE)
head(Xm)
E <- Xm - XPCA
Res_IND <- rowSums(E*E)
Res_VARS <- colSums(E*E)
par(mfrow=c(1,2))
barplot(Res_IND,main = "residuals per emotion")
barplot(Res_VARS,names.arg=FALSE,main = "residuals per feature")

#points(T[48:77,1],T[48:77,2], pch=1, col="red")
res1 <- Xm - T_log[,1:2] %*% t(P_log[,1:2])
head(res1)
matplot(1:5,res1,type = "l",lwd=1,xlab="",ylab="", main= "no transformation residuals")




m1= colMeans(intensity) 			#calculates column means
X1=sweep(intensity,2,m1,FUN="-")		#subtract the column means
ssqtotal <- sum(X1*X1)			# calculates the sum of squares
USV <- svd(X1)					# see the help for this function
T <- USV$u %*% diag(USV$d)
P <- USV$v
npc <- 3
ssqtot <- 0 * (1:npc)
for (i in 1:npc){
  Xest  <- T[,1:i] %*% t(P[,1:i])
  ssqtot[i] <- 100 * (1-sum((X1-Xest)*(X1-Xest))/ssqtotal)
}
ssq=c(ssqtot[1],ssqtot[2:3]-ssqtot[1:2])
data.frame(ssq=ssq,ssqtot=ssqtot)

par(mfrow=c(1,2))
plot(T[1:2709,1],T[1:2709,2], pch=1, col="red", xlab= "PC1",ylab ="PC2", main = "no tranformation scores")

par(mfrow=c(1,2))
RMSE <- RMSECV(X1,20,5)
plot(RMSE, xlab="#PC", ylab="RSMECV")

XPCA <- T[,1:13] %*% t(P[,1:13])
XPCA
write.csv(XPCA,"C:/Users/jesus/Desktop/AMSTERDAM/psychology/Feature-Selection/PCA/output/PCA_eGeMAPSv01b_ScaledX_dutchFemales.csv", row.names = FALSE)

E <- X1 - XPCA
Res_IND <- rowSums(E*E)
Res_VARS <- colSums(E*E)
par(mfrow=c(1,2))
barplot(Res_IND,main = "residuals per feature")
barplot(Res_VARS,names.arg=FALSE,main = "residuals per emotion")

#points(T[48:77,1],T[48:77,2], pch=1, col="red")
res1 <- X1 - T[,1:2] %*% t(P[,1:2])
matplot(1:77,res1,type = "l",lwd=1,xlab="",ylab="", main= "no transformation residuals")

par(mfrow=c(1,1))
plot(P[,1],P[,2])
text(P[,1],P[,2],1:88)
plot(T_log[1:47,1],T_log[1:47,2], pch=3, col="blue", xlab="PC1", ylab ="PC2", main = "log transformation scores")
points(T_log[48:77,1],T_log[48:77,2], pch=1, 
       , col="red")

