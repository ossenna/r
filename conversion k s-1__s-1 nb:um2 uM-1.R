# CONVERSTION DE CONSTANTE k en s-1 --> s-1 #/um2 uM-1
# ETAPE 1 : 1 #/um2 = x? uM pour volume de y
# fonction de conversion de concentration x : nb molecules/um2 --> uM (umol/l) pour volume de v
conv.conc <- function(x,v){ 
  c1 <- x
  # conversion um2 en um3 
  conv <- ((3*v/(4*pi))^(1/3))/3
  c2 <- c1/conv
  c3 <-  c2 *10^15
  avogadro <- 6.023*10^23
  c4 <-  (c3/avogadro)/(10^-6)
  return(c4)
}
# 1 #/um2 pour volume de y :
rate <- 1/conv.conc(1,0.09)

# ETAPE 2
# constante a convertir
k <- 0.17
resultat <- rate * k
resultat
