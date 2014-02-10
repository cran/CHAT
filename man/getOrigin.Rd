\name{getOrigin}
\alias{getOrigin}
\title{
Inference of Origin Cluster
}
\description{
This function performs K-means on BAF-LRR plot and assign a subset of data points to the Origin Cluster using the concept of consensus clustering.
}
\usage{
getOrigin(sam.dat, ntry = 10, concensus.thr = 0.6, para)
}
\arguments{
  \item{sam.dat}{
numeric matrix, as returned from getSegChr() or getSeg(), with one sample included.
}
  \item{ntry}{
integer, number of attempts to perform K-means.
}
  \item{concensus.thr}{
numeric, rate of concensus required to be included in to Origin Cluster. A data point needs to be assigned to the Origin Cluster >= ntry*concensus.thr times to be included.
}
  \item{para}{
a list of parameters returned from getPara().
}
}
\details{
The Origin Cluster represents the unchanged genome in a tumor sample, and it is important for downstream inference. This function implement a two-step approach to accurately assign the membership to data points. First, it performs concensus clustering on the data points and find a minimum set of the Origin Cluster. It then expands the set by iteratively including more data points into it as long as the new point is close to the centroid of the Cluster.
}
\value{
a list containing the following elements:
\item{x0}{the x coordinate of the Origin Cluster centroid}
\item{y0}{the y coordinate of the Origin Cluster centroid}
\item{list}{indices of the segments belong to Origin Cluster in sam.dat.}
}
\author{
Bo Li
}
\examples{
para=getPara()
\donttest{
data(A0SD.BAF)
data(A0SD.LRR)
chr8.baf=A0SD.BAF[A0SD.BAF[,2]==8,]
chr8.lrr=A0SD.LRR[A0SD.LRR[,2]==8,]
x=getSegChr(chr8.baf,chr8.lrr)
dd.dat=x[,2:8]
rownames(dd.dat)=x[,1]
mode(dd.dat)='numeric'
oo=getOrigin(dd.dat,para=para)

## See what it looks like on a BAF-LRR plot
plot(dd.dat[,6],dd.dat[,4],pch=19,cex=0.3,xlab='BAF',ylab='LRR',xlim=c(0,0.5),ylim=c(-1,1))
points(x[oo$list,6],dd.dat[oo$list,4],pch=19,cex=0.3,col='yellow')
}
}