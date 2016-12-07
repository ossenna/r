#conversion um3 en um2 pour epine (sphere)
# inscrire volume en um3
v <- 0.01
r <- (3*v / (4*pi))^(1/3)
S <- 4*pi*r^2
S

# conversion inverse
S <- 0.1257
r <- sqrt(S/(4*pi))
v <- (r^3)*4*pi/3
v