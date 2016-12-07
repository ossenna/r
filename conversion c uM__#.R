# fonction de conversion de concentration x pour volume v : uM (umol/l) --> nb molecules
conv.conc <- function(x,v){ 
  c1 <- x*10^-6
  avogadro <- 6.023*10^23
  # conversion c2--> #molecules/litre
  c2 <- c1 * avogadro
  # conversion litres en um3  c3--> #molecules/um3 
  c3 <- c2 * 1/(1*10^15)
  c4 <- c3*v
  return(c4)
}
#changer x pour concentration en uM et v volume en um3
hehe<- c(4.45E-01,	1.81E-02,	2.67E-06,
         4.45E-01,	4.53E-02,	3.67E-06)
conv.conc(0.15, 0.09)
      
         