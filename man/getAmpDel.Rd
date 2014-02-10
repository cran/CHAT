\name{getAmpDel}
\alias{getAmpDel}
\title{
Fraction of amplification or deletion in the genome
}
\description{
This function returns the fraction of amplified or deleted regions in the genome.
}
\usage{
getAmpDel(oo, sam.dat)
}
\arguments{
  \item{oo}{
Origin Cluster, as returned from \code{getOrigin()}
}
  \item{sam.dat}{
numeric matrix, as returned from \code{getSeg()} or \code{getSegChr()}
}
}
\value{
a vector containing two numeric numbers: fraction of amplification and deletion.
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
getAmpDel(oo,dd.dat)
}
}