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
conv.conc(1,0.01)

# fonction de conversion de constante de vitesse k : uM-1*s-1 --> nb molecules/um2*s-1*uM-2
conv.cons <- function(x){
  taux <- conv.conc(1, 0.01)
  k <- x / taux
  return(k)
}
conv.cons(0.0012)
  
