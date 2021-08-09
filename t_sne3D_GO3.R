install.packages("Rtsne")
install.packages("scatterplot3d")
install.packages("rgl")
install.packages("magick")
install.packages("webshot2")
install.packages("plot3D")
install.packages("ggplot2")

library(magick)
library(Rtsne)
library(ggplot2)
library(readxl)

setwd ("C:/Users/jesus/Desktop/AMSTERDAM/psychology/Feature-Exploration/tSNE/code")
gemaps_88 <- read_excel("C:/Users/jesus/Desktop/AMSTERDAM/psychology/Feature-Exploration/tSNE/code/BE_eGeMAPSv01b_acoustics_dutchFemales.xlsx")

#---------------Different contexts (GeMaps88)------------------------------
#normalisation
gemaps_88[, c(4:31)] <- sapply(gemaps_88[, c(4:31)], as.numeric)
c_matrix <- as.matrix(gemaps_88 [,4:31])
X <- normalize_input(c_matrix)
colMeans(X)
range(X)
X
#Rtsne dimensions
tsne_out <- Rtsne(X, pca = TRUE,check_duplicates = FALSE, dims=3, perplexity=30,theta=0.5, verbose=TRUE, max_iter = 5000)
colors = c('positivesurprise' = 'yellow', 'admiration' = 'springgreen', 'amae' = 'aliceblue', 'amusement' = 'aquamarine', 'awe' = 'magenta1', 'determination' = 'darkorange2', 'elevation' = 'dodgerblue', 'euphoria' = 'darkolivegreen2', 'excitement' = 'deepskyblue2', 'gratitude' = 'darkgreen', 'hope' = 'darkgoldenrod3', 'inspiration' = 'brown3', 'interest' = 'cyan3', 'lust' = 'cornsilk4', 'moved' = 'blue1', 'pride' = 'cornflowerblue', 'relief' = 'coral2', 'respected' = 'chocolate4', 'schadenfreude' = 'chocolate','sensualpleasure' = 'chartreuse','tenderness' = 'cadetblue','triumph' = 'bisque2')


#2D scatter plot
tiff("tsne2D_1withR.tiff", units="in", width=8, height=6, res=300)
plot(tsne_out$Y, main="tSNE", xlab="tSNE dimension 1", ylab="tSNE dimension 2", "cex.main"=1.2, "cex.lab"=1.0, col=colors[gemaps_88$Emotion_Category], cex=1.1, pch=19) 
legend("bottomright",  c('positivesurprise', 'admiration', 'amae', 'amusement', 'awe', 'determination', 'elevation', 'euphoria', 'excitement', 'gratitude', 'hope', 'inspiration', 'interest', 'lust', 'moved' , 'pride', 'relief', 'respected', 'schadenfreude','sensualpleasure','tenderness','triumph')
, fill = c('yellow','springgreen', 'aliceblue', 'aquamarine', 'magenta1', 'darkorange2', 'dodgerblue', 'darkolivegreen2','deepskyblue2', 'darkgreen', 'darkgoldenrod3', 'brown3', 'cyan3', 'cornsilk4','blue1','cornflowerblue','coral2', 'chocolate4', 'chocolate','chartreuse','cadetblue','bisque2')
, cex = 0.7)
dev.off()

#text with 2D scatter plot to check audio IDs
tiff("tsne2D_text_withR.tiff", units="in", width=8, height=6, res=300)
plot(tsne_out$Y, main="tSNE", xlab="tSNE dimension 1", ylab="tSNE dimension 2", "cex.main"=1.5, "cex.lab"=1.0, col=colors[gemaps_88$Emotion_Category], 
     cex=0.5, pch=19) 
text(tsne_out$Y, labels=gemaps_88$Emotion_Category, col=colors[gemaps_88$Emotion_Category], cex = 0.7)
dev.off()

#3D scatter plot
library(scatterplot3d)
tiff("tsne3D_10.tiff", units="in", width=8, height=6, res=300)
scatterplot3d(x=tsne_out$Y[,1],y=tsne_out$Y[,2],z=tsne_out$Y[,3], 
              color = colors[gemaps_88$Emotion_Category], pch = 19, main = "tsne", 
              xlab="tSNE dimension 1", ylab="tSNE dimension 2", zlab="tSNE dimension 3")
legend("topright",  c('positivesurprise', 'admiration', 'amae', 'amusement', 'awe', 'determination', 'elevation', 'euphoria', 'excitement', 'gratitude', 'hope', 'inspiration', 'interest', 'lust', 'moved' , 'pride', 'relief', 'respected', 'schadenfreude','sensualpleasure','tenderness','triumph'), 
       fill = c('yellow','springgreen', 'aliceblue', 'aquamarine', 'magenta1', 'darkorange2', 'dodgerblue', 'darkolivegreen2','deepskyblue2', 'darkgreen', 'darkgoldenrod3', 'brown3', 'cyan3', 'cornsilk4','blue1','cornflowerblue','coral2', 'chocolate4', 'chocolate','chartreuse','cadetblue','bisque2'), cex = 0.8)
dev.off()


#print the dimensions together with general context
d_tsne = as.data.frame(tsne_out$Y)
write.csv(d_tsne,"C:/Users/jesus/Desktop/AMSTERDAM/psychology/Feature-Selection/tSNE/code/d_tsne2.csv", row.names = FALSE)

install.packages("plot3Drgl")
library(plot3D)
library(rgl)
library(plot3Drgl)

#add the Contextgeneral as a forth column in dtsne2 and read it 
d_tsne2 <- read_excel("C:/Users/jesus/Desktop/AMSTERDAM/psychology/Feature-Selection/tSNE/code/d_tsne2.xlsx")
head(d_tsne2)
d_tsne2 <- data.frame(V1 = d_tsne2$V1,             # Create example data
                      V2 = d_tsne2$V2,V3 =d_tsne2$V3)
head(d_tsne2)
d_tsne2[, c(1:3)] <- sapply(d_tsne2[, c(1:3)], as.numeric)
head(d_tsne2)
d_tsne2$Emotion_Category<-factor(d_tsne2$Emotion_Category, levels = cut('positivesurprise', 'admiration', 'amae', 'amusement', 'awe', 'determination', 'elevation', 'euphoria', 'excitement', 'gratitude', 'hope', 'inspiration', 'interest', 'lust', 'moved' , 'pride', 'relief', 'respected', 'schadenfreude','sensualpleasure','tenderness','triumph'))



#tiff("context5.tiff", units="in", width=8, height=6, res=300)

install.packages("plotly")
library(plotly)
fig <- plot_ly(d_tsne2, x=d_tsne2$V1,y=d_tsne2$V2,z=d_tsne2$V3, color = ~d_tsne2$Emotion_Category, text=gemaps_88$Emotion_Category, 
               colors =c('yellow','springgreen', 'aliceblue', 'aquamarine', 'magenta1', 'darkorange2', 'dodgerblue', 'darkolivegreen2','deepskyblue2', 'darkgreen', 'darkgoldenrod3', 'brown3', 'cyan3', 'cornsilk4','blue1','cornflowerblue','coral2', 'chocolate4', 'chocolate','chartreuse','cadetblue','bisque2'))
fig <- fig %>% add_markers()
fig <- fig %>% layout(scene = list(xaxis = list(title = 'dimension 1'),
                                   yaxis = list(title = 'dimension 2'),
                                   zaxis = list(title = 'dimension 3')))
fig
htmltools::save_html(
  html = htmltools::as.tags(
    x = plotly::toWebGL(fig),
    standalone = TRUE),
  file = "tsne3d_plotly.html")

legend("topright", c('positivesurprise', 'admiration', 'amae', 'amusement', 'awe', 'determination', 'elevation', 'euphoria', 'excitement', 'gratitude', 'hope', 'inspiration', 'interest', 'lust', 'moved' , 'pride', 'relief', 'respected', 'schadenfreude','sensualpleasure','tenderness','triumph'), 
       fill = c('yellow','springgreen', 'aliceblue', 'aquamarine', 'magenta1', 'darkorange2', 'dodgerblue', 'darkolivegreen2','deepskyblue2', 'darkgreen', 'darkgoldenrod3', 'brown3', 'cyan3', 'cornsilk4','blue1','cornflowerblue','coral2', 'chocolate4', 'chocolate','chartreuse','cadetblue','bisque2'), cex = 0.8)

#dev.off()


#3d interactive plot animated
library(plot3D)
library(rgl)
library(plot3Drgl)

par3d(windowRect = c(120, 130, 900, 900))
plot3d(x=tsne_out$Y[,1],y=tsne_out$Y[,2],z=tsne_out$Y[,3],
       col = colors[gemaps_88$Emotion_Category],
       type="s",radius=0.5, xlab="tSNE dimension 1", ylab="tSNE dimension 2", zlab="tSNE dimension 3", size = 5)
#text3d(tsne_out$Y[,1],tsne_out$Y[,2],tsne_out$Y[,3], gemaps_88$AudioID, cex = 0.7)
legend3d("topright", c('positivesurprise', 'admiration', 'amae', 'amusement', 'awe', 'determination', 'elevation', 'euphoria', 'excitement', 'gratitude', 'hope', 'inspiration', 'interest', 'lust', 'moved' , 'pride', 'relief', 'respected', 'schadenfreude','sensualpleasure','tenderness','triumph'), fill = c('yellow','springgreen', 'aliceblue', 'aquamarine', 'magenta1', 'darkorange2', 'dodgerblue', 'darkolivegreen2','deepskyblue2', 'darkgreen', 'darkgoldenrod3', 'brown3', 'cyan3', 'cornsilk4','blue1','cornflowerblue','coral2', 'chocolate4', 'chocolate','chartreuse','cadetblue','bisque2'),cex=1.5, inset=c(0), pch=16)
rgl.snapshot('3dplot.png', fmt = 'png')

rglwidget()
htmlwidgets::saveWidget(rglwidget(), "tsne2.html")


play3d( spin3d( axis = c(0, 0, 1), rpm = 20), duration = 10 )
movie3d(
  movie="3dAnimatedScatterplot", 
  spin3d( axis = c(0, 0, 1), rpm = 7),
  duration = 20, 
  dir = "Users/jesus/Desktop/AMSTERDAM/psychology/Feature-Selection/tSNE/3Dplots",
  type = "gif", 
  clean = TRUE
)


