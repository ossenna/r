## pour les donnees de mon modele REACTION DIRECTE (kf)

# constante de diffusion Dout selon Czondor et al. (0.2 um2/s)
D_out1 <- 0.2
# crossSectionArea : zone d'intersection entre le cou de rayon r et la dendrite
CSA1 <-  0.63
#dist entre les deux compartiments
dist1 <- 0.5451
#volume/surface finale
V1 <- 0.656

kf <- D1*(CSA1)/(dist1*V1)


## pour les donnees de mon modele REACTION INVERSE (kr)
D2 <- 0.2
# crossSectionArea
CSA2 <-  CSA1

#dist entre les deux compartiments
dist2 <- dist1

#volume/surface final
V2 <- 0.31416

kr <- D2*(CSA2)/(dist2*V2)
kf
kr
