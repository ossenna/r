## Devoir 1 - Question 1
## Étape 0. Indiquer l'espace de travail et charger les données dans la matrice D
setwd("~/Desktop/R_mydirectory/devoir1")
D <- matrix(scan("Q1_donnees.dat"),15,9,byrow=TRUE)

## Étape 1. Centrer les données sur la moyenne en créant la matrice dprime
dprime <- D-rowMeans(D)

## Étape 2. Calculer la matrice de covariance de dprime, appelée "A"
A <- (1/length(dprime)) * dprime %*% t(dprime)

## Étape 3. Trouver les valeurs et vecteurs propres unitaires de A, en ordre décroissant (ce que R fait automatiquement)
  # Valeurs propres
valpropres <- eigen(A)$values
  # Vecteurs propres
vectpropres <- eigen(A)$vectors
  # Taux de variance expliquée
varexpl <- valpropres/sum(valpropres)

## Étape 4. Créer la matrice W des vecteurs propres unitaires jusqu'à 90% de variance expliquée et en ordre décroissant, 
## puis calculer la matrice transposée orthogonale  qui permettra la rotation des données initiales
z <- cumsum(varexpl)
for (i in 1:length(varexpl)) {
  if (z[i] < .90) {
   (cumsum(varexpl[1:(i+1)]))
   W <- (vectpropres[,1:(i+1)])
  print(W)
  }
}

  # Matrice transposée Wt
Wt <- t(W)

## Étape 5. Calculer la matrice transformée dpca en multipliant la matrice centrée dprime avec la matrice de rotation, Wt
dpca <- Wt %*% dprime

## Étape 6. Visualisation des données et constatation des groupes principaux
datadpca <- as.data.frame(t(dpca))
colnames(datadpca) <- c("dimension1", "dimension2")
plot(datadpca)

## Utilisation de ggplot pour le graphique inséré dans le rapport.
#p <- ggplot(datadpca, aes(dimension1, dimension2, color=dimension1))
#p+geom_point()

