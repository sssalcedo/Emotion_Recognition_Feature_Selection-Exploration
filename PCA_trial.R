

library(readxl)

data <- read.csv(file='Cachexia.csv')
head(data[,1:3])
intensity <- as.matrix(data)
par(mfrow=c(1,2))
matplot(1:77,intensity,type ="l",lwd=1,xlab='individuals', ylab='intensity')
matplot(1:63,t(intensity),type ="l",lwd=1,xlab='metabolites', ylab='intensity')


logdata <- log(intensity)
sqrtdata <- sqrt(intensity)
par(mfrow=c(1,3))
hist(intensity[,1])
hist(sqrtdata[,1])
hist(logdata[,1])

head(intensity)
head(logdata)

m1= colMeans(intensity) 			#calculates column means
X1=sweep(intensity,2,m1,FUN="-")		#subtract the column means
ssqtotal <- sum(X1*X1)			# calculates the sum of squares
USV <- svd(X1)					# see the help for this function
T <- USV$u %*% diag(USV$d)
P <- USV$v
npc <- 10
ssqtot <- 0 * (1:npc)
for (i in 1:npc){
  Xest  <- T[,1:i] %*% t(P[,1:i])
  ssqtot[i] <- 100 * (1-sum((X1-Xest)*(X1-Xest))/ssqtotal)
}
ssq=c(ssqtot[1],ssqtot[2:10]-ssqtot[1:9])
data.frame(ssq=ssq,ssqtot=ssqtot)

ml= colMeans(logdata)
Xm=sweep(logdata,2,ml,FUN="-")
ssqtotal <- sum(Xm*Xm)
USV <- svd(Xm)
T_log <- USV$u %*% diag(USV$d)
P_log <- USV$v
ssqtot <- 0 * (1:npc)
for (i in 1:npc){
  Xest  <- T_log[,1:i] %*% t(P_log[,1:i])
  ssqtot[i] <- 100 * (1-sum((Xm-Xest)*(Xm-Xest))/ssqtotal)
}
ssq=c(ssqtot[1],ssqtot[2:10]-ssqtot[1:9])
data.frame(ssq=ssq,ssqtot=ssqtot)
