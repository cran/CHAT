\name{plotBAFLRR}
\alias{plotBAFLRR}
\title{
BAF-LRR plot
}
\description{
Generate a BAF-LRR plot with thorough annotations of canonical positions and data points.
}
\usage{
plotBAFLRR(sam.dat, cali.best, oo, origin = "on", para = para)
}
\arguments{
  \item{sam.dat}{
numeric matrix, as returned from \code{getSeg()} or \code{getSegChr()}
}
  \item{cali.best}{
a list returned from \code{getSumDist()}
}
  \item{oo}{
Origin Cluster, as returned from \code{getOrigin()}
}
  \item{origin}{
if 'on', Origin Cluster will be highlighted on the plot.
}
  \item{para}{
list, parameters returned from \code{getPara()}
}
}
\value{
NULL
}
\author{
Bo Li
}
\examples{
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
cali=getSampleAGP(dd.dat,oo,para=para)
plotBAFLRR(dd.dat,cali,oo,para=para)
}
}