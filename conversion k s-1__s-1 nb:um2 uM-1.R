# CONVERSTION DE CONSTANTE k en s-1 --> s-1 #/um2 uM-1
# ETAPE 1 : 1 #/um2 = x? uM pour volume de y
# fonction de conversion de concentration x : nb molecules/um2 --> uM (umol/l) pour volume de v
conv.conc <- function(x,v){ 
  c1 <- x
  # c1 molecule/um2 converti en c2 molecule/um3 pour volume v 
  conv <- ((3*v/(4*pi))^(1/3))/3
  c2 <- c1/conv
  # c2 (molecule/um3)  converti en c3 (molecule/litre)
  c3 <-  c2 *10^15 
  # c3 (molecule/litre) converti en c4 (umol/litre, soit uM)
  avogadro <- 6.023*10^23
  c4 <-  (c3/avogadro)/(10^-6)
  # resultat est c4 la concentration en uM correspondante a x molecule/um2 pour volume v
  return(c4)
}
# taux de conversion 'rate' = c1 #/um2 divisé par uM, donc rate est en uM-1 #/um2
rate <- 1/conv.conc(1,0.09)

# ETAPE 2
# constante k en s-1 fois rate en uM-1 #/um2, donc k est en s-1 #/um2 uM-1
k <- 0.17
resultat <- rate * k
resultat
