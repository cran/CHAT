\name{getLOH}
\alias{getLOH}
\title{
Fraction of loss-of-heterozygosity
}
\description{
This function returns the fraction of loss-of-heterozygosity regions in the genome
}
\usage{
getLOH(cali, sam.dat, para)
}
\arguments{
  \item{cali}{
list, returned by \code{getSumDist()}
}
  \item{sam.dat}{
numeric matrix, as returned from \code{getSeg()} or \code{getSegChr()}
}
  \item{para}{
 list, parameters returned from \code{getPara()}
}
}
\value{
list, inherited from \code{getSumDist()} with additional elements:
\item{del.loh}{fraction of LOH with deletions}
\item{cn.loh}{fraction of copy neutral LOH}
\item{amp.3}{fraction of hemizygous amplification}
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
getLOH(cali,dd.dat,para=para)
}
}