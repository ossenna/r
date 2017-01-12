
D1 <- 0.2
# crossSectionArea 
CSA1 <- 0.78069
  
#dist entre les deux compartiments 
dist1 <- 0.09759+0.87575

#volume/surface finale (PSD)
V1 <- 0.097

kf <- D1*(CSA1)/(dist1*V1)



## pour les donnees de mon modele REACTION INVERSE (kr)
D2 <- 0.054
# crossSectionArea 
CSA2 <-  CSA1

#dist entre les deux compartiments (moitié de ray + 1um rayon dendrite)
dist2 <- dist1

#volume/surface dendrite 2*pi*r*h - cou épine pi*r^2
V2 <- 0.97

kr <- D2*(CSA2)/(dist2*V2)
kf
kr
