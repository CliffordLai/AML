# Change to your working directory
setwd("D:/BACKUPDROPBOX/NewtermPHD/TERM7/Financial Data/Anti-Money Laundering Project Data")


# Read PCA data
pcaX <- read.csv("PCA.csv")
loading <- read.csv("loadingMatrix.csv")

# Check it, there are 15 components
str(pcaX)
head(pcaX)

# Check how those components are made of
loading


# We only need to use the first 3 PC's
ID <- pcaX[,1]
pcaX <- pcaX[,2:4]

# Plot it with rgl and add the correct labels
library(rgl)
clusterFirstHalf <- read.csv("Clusters_FirstHalf.csv")
print("Correct clusters")
sort(table(clusterFirstHalf$Cluster.Number))

lab <- paste("PC", 1:3)
plot3d(pcaX[1:50000,],
       xlab=lab[1],ylab=lab[2],zlab=lab[3],
       col=clusterFirstHalf$Cluster.Number,alpha=0.6)
legend3d("topright", legend = 1:8, pch=rep(16,8),
         col =1:8,  inset=c(0.02),cex=1.2)

