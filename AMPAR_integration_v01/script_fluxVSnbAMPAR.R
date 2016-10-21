## Script de calcul du flux d'AMPAR en fonction du nombre total de recepteurs synaptiques
## data : simulation0 AMPAR_integration_v01 - Vcell
## comparaison avec Fig.5b, model 2 de Hayer&Bhalla2005

setwd("~/Desktop/R_mydirectory/AMPAR_integration_v01")
dat <- read.csv("AMPAR_int_v01", header=TRUE, sep="")
# fonction de conversion de concentration x pour volume v : uM (umol/l) --> nb molecules
conv.conc <- function(x,v){ 
  c1 <- x*10^-6
  avogadro <- 6.023*10^23
  # conversion c2--> #molecules/litre
  c2 <- c1 * avogadro
  # conversion litres en um3  c3--> #molecules/um3 
  c3 <- c2 * 1/(1*10^15)
  # nb molecules/um3 * volume = nombre de molecules 
  c4 <- c3*v
  return(c4)
}
dat$AMPAR <- conv.conc(dat$AMPAR,0.09)
dat$AMPAR_P <- conv.conc(dat$AMPAR_P,0.09)
dat$AMPAR_PP <- conv.conc(dat$AMPAR_PP,0.09)

dat$mAMPAR <- dat$mAMPAR*1.5
dat$mAMPAR_P <- dat$mAMPAR_P*1.5
dat$mAMPAR_PP <- dat$mAMPAR_PP*1.5

#nb de recepteurs total
dat$nbrecp <- dat$AMPAR + dat$AMPAR_P + dat$AMPAR_PP + dat$mAMPAR + dat$mAMPAR_P + dat$mAMPAR_PP

#flux
dat$flux <- conv.conc(dat$J__01_AMPAR_Transport,0.09)
plot(dat$nbrecp, dat$flux, xlab="# of synaptic AMPAR", ylab="AMPAR flux (#/sec)")