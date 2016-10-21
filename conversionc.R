# fonction de conversion de concentration x pour volume v : uM (umol/l) --> nb molecules/um2
conv.conc <- function(x,v){ 
  # c1 <- x*10^-6
  c1 <- x
  avogadro <- 6.023*10^23
  # conversion c2--> #molecules/litre
  c2 <- c1 * avogadro
  # conversion litres en um3  c3--> #molecules/um3 
  c3 <- c2 * 1/(1*10^15)
  # conversion um3 en um2 
  conv <- ((3*v/(4*pi))^(1/3))/3
  c4 <- c3*conv
  return(c4)
}
#changer x pour concentration en uM et v volume en um3
conv.conc(x, v)
