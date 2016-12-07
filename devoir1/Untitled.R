## Devoir 1 - Question 2
## Étape 0. Indiquer l'espace de travail et charger les données dans la matrice D
##
setwd("~/Desktop/R_mydirectory/devoir1")
D <- matrix(scan("Q2_donnees.dat"),10,10,byrow=TRUE)
D

## Étape 1. Ordonner les gènes en décroissant de différentiel d’expression
  # Calculer la différence des moyennes pour chaque gène, dans chaque groupe
  diff <- abs(rowMeans(D[,1:5]) - rowMeans(D[,6:10]))
  diff2 <- cbind(D, diff)

  # Mettre en ordre décroissant 
  diff2dec <- diff2[order(diff2[,11], decreasing= TRUE),]

## Étape 2. Marche aléatoire avec le sous-groupe étudié G1, G3, G6; soit diff2dec[c(1,3,6),] 

  # Définitions de paramètres n (nombre de données) et g (nombre de données dans le sous-ensemble)
  n <- 10
  g <- 3 
  
  # Valeur d'un pas positif
pp <- sqrt((n-g)/g)
pp
  # Valeur d'un pas négatif
pn <- -sqrt(g/(n-g))
pn

  # Marche avec les pas calculés
x <- vector(mode="numeric", length = 11)
x
 for(i in 2:length(x)){
 if(c(diff2dec[i-1,]) == c(diff2dec[1,])){
   x[i] <- x[i-1]+pp
   print(x)
 } else if(c(diff2dec[i-1,]) == c(diff2dec[3,])){
   x[i] <- x[i-1]+pp
   print(x)
 } else if(c(diff2dec[i-1,]) == c(diff2dec[6,])){
   x[i] <- x[i-1]+pp
   print(x)
 } else {
   x[i] <- x[i-1]+pn
   print(x)
 }
 } 



  # Représentation graphique de la marche et du supremum
sup <- max(x)
plot(x, ylim =c(0,3), type="b", col=ifelse(x==sup, "darkseagreen", "darkseagreen4"), 
     pch=ifelse(x==sup, 18, 1), cex=ifelse(x==sup, 1.5, 1))

  # Score d'enrichissement
scoreD <- sqrt(n)*sup

## Étape 3: Permuter les données et calculer leur suprema


permu <- c(1:10)
cnt <- 1
mat1 <- matrix(0, ncol=12, byrow=FALSE) 
mat1

repeat{
  permusam <- sample(permu, 3)
  cnt <- cnt+1
  
  y <- vector(mode="numeric", length = 12)
  y
  for(i in 2:11){
    if(c(diff2dec[i-1,]) == c(diff2dec[permusam[1],])){
      y[i] <- y[i-1]+pp
    } else if(c(diff2dec[i-1,]) == c(diff2dec[permusam[2],])){
      y[i] <- y[i-1]+pp
    } else if(c(diff2dec[i-1,]) == c(diff2dec[permusam[3],])){
      y[i] <- y[i-1]+pp
    } else {
      y[i] <- y[i-1]+pn

    } 
   y[12] <- c(max(y))
  } 
  mat1 <- rbind(mat1,y)

  
  if(cnt == 100) {
    break
    }
}
mat1

test <- 0
for(i in 1:100){
      if(mat1[i,12] < scoreD) {
 test <- test +1
      }
}
test