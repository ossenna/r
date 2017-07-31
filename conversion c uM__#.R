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
conv.conc(5.42, 0.08116)
      
         

# fonction inverse de conversion de concentration x pour volume v :  nb molecules --> uM (umol/l) 
conv.conc <- function(x,v){ 
  # conversion x # --> #molecules/um3
  c1 <- x/v
  # conversion um3 en litres : c1 #molecules/um3 -->  c2 #molecules/litres
  c2 <- c1*10^15
  # conversion #molecules en mol : c2 #molecules/lites --> c3 mol/litres
  avogadro <- 6.023*10^23
  c3 <- c2 / avogadro
  # converstion de Mol à uMol
  c4 <- c3/(10^-6)
  return(c4)
}
#changer x pour concentration en uM et v volume en um3
conv.conc(500, 0.7854)



c1 <- 3270
# conversion um3 en litres : c1 #molecules/um3 -->  c2 #molecules/litres
c2 <- c1*10^15
# conversion #molecules en mol : c2 #molecules/lites --> c3 mol/litres
avogadro <- 6.023*10^23
c3 <- c2 / avogadro
# converstion de Mol à uMol
c4 <- c3/(10^-6)
c4