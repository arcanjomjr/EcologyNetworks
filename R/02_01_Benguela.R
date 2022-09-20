#This is a graph taken from Yodzis, P (1998) Local trophodynamics and the 
#interaction of marine mammals and fisheries in the Benguela ecosystem. 
#Journal of Animal Ecology

# RCurl allows to use http requests
library(RCurl)

# Benguela's graph comes in a edgelist format
# Each line has the format
# i j
# That means the node i is conected to node j

# Downloads Bengela's graph edgelist representation
x <- getURL("https://raw.githubusercontent.com/mlurgi/networks_for_r/master/datasets/benguela.edgelist")

# Tranform the \n into new lines
benguela.EL <- read.table(text = x) 

# Transforms the list into a matrix 203x2
benguela.EL <- as.matrix(benguela.EL)

# dim(benguela.EL)

# Creates an adjacency matrix called benguela.AM, containing only zeros
benguela.AM <- matrix(0, max(benguela.EL), max(benguela.EL))

# Introduce ones to the matrix to represent interactions between species
# Each line of benguela.EL has the form i j, it makes the position (i,j)
# of the matrix being equal to 1.
benguela.AM[benguela.EL] <- 1

# species richness
S <- dim(benguela.AM)[1]

# equivalently
S0 <- max(benguela.EL)

# number of links
L <- sum(benguela.AM)
