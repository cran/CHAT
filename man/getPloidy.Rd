\name{getPloidy}
\alias{getPloidy}
\title{
Genomewide average ploidy
}
\description{
This function returns the genomewide average ploidy of aneuploid fraction and overall of the sample.
}
\usage{
getPloidy(p, type = 1, sam.dat, oo)
}
\arguments{
  \item{p}{
AGP value. see \code{getGrid()} for details.
}
  \item{type}{
integer, ploidy indicator. 1, diploid; 2, tetraploid; 3, hexaploid
}
  \item{sam.dat}{
numeric matrix, as returned from \code{getSeg()} or \code{getSegChr()}
}
  \item{oo}{
Origin Cluster, as returned from \code{getOrigin()}
}
}
\value{
Ploidy of the overall sample and ploidy of the aneuploid proportion are returned.
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
getPloidy(0.5,sam.dat=dd.dat,oo=oo)
}
}