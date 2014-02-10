\name{getPermutation}
\alias{getPermutation}
\title{
Null distribution for estimated AGP.
}
\description{
This function performs weighted bootstrap on segmentation data to obtain null distribution of estimated AGP.
}
\usage{
getPermutation(sam.dat, oo, Np = 100, type = 1, para)
}
\arguments{
  \item{sam.dat}{
numeric matrix, as returned from \code{getSeg()} or \code{getSegChr()}
}
  \item{oo}{
Origin Cluster, as returned from \code{getOrigin()}
}
  \item{Np}{
integer, number of bootstraps.
}
  \item{type}{
integer, ploidy indicator. 1, diploid; 2, tetraploid; 3, hexaploid
}
  \item{para}{
 list, parameters returned from \code{getPara()}
}
}
\value{
A numeric vector containing all the bootstrap AGP values from Np times of resampling.
}
\author{
Bo Li
}
\examples{
## Slow. Run with caution.
\donttest{
data(A0SD.BAF)
data(A0SD.LRR)
seg.dat=c()
for(CHR in c(8,9,10)){
	baf=A0SD.BAF[A0SD.BAF[,2]==CHR,]
	lrr=A0SD.LRR[A0SD.LRR[,2]==CHR,]
	x=getSegChr(baf,lrr)
	seg.dat=rbind(seg.dat,x)
}
dd.dat=seg.dat[,2:8]
rownames(dd.dat)=seg.dat[,1]
mode(dd.dat)='numeric'
para=getPara()
oo=getOrigin(dd.dat,para=para)
p.null=getPermutation(dd.dat,oo,para=para)
}
}