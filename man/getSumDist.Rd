\name{getSumDist}
\alias{getSumDist}
\title{
Compute the summation of distances
}
\description{
Canonical positions are set on a BAF-LRR plot with given AGP value. This function finds the distance from each data point to its nearest canonical position and returns the summation.
}
\usage{
getSumDist(oo, p, sam.dat, method = "both", type = 1, para)
}
\arguments{
  \item{oo}{
Origin Cluster, as returned from \code{getOrigin()}
}
  \item{p}{
AGP value. see \code{getGrid()} for details.
}
  \item{sam.dat}{
numeric matrix, as returned from \code{getSeg()} or \code{getSegChr()}
}
  \item{method}{
string, chosen from 'both','logR' and 'BAF', the column(s) from sam.dat to weigh the distance from a data point to canonical positions. If 'logR' or 'BAF', number of LRR or BAF markers will be used as weight. If 'both', geometric average of both numbers will be used.
}
  \item{type}{
integer, ploidy indicator. 1, diploid; 2, tetraploid; 3, hexaploid
}
  \item{para}{
 list, parameters returned from \code{getPara()}
}
}
\value{
A list inherited from the list returned from \code{getCanonicalLines()}, with extra elements being:
\item{SD}{sum of distances}
\item{clist}{indices of data points close to at least one regression line.}
\item{plist}{indices of data points close to at least one canonical position.}
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
cali=getSumDist(oo,0.5,dd.dat,para=para)
}
}