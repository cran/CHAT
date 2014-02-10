\name{getSampleAGP}
\alias{getSampleAGP}
\title{
AGP inference by sample
}
\description{
This function performs AGP inference based on canonical positions on BAF-LRR plot for one sample.
}
\usage{
getSampleAGP(sam.dat, oo, para)
}
\arguments{
  \item{sam.dat}{
numeric matrix, as returned from \code{getSeg()} or \code{getSegChr()}
}
  \item{oo}{
Origin Cluster, as returned from \code{getOrigin()}
}
  \item{para}{
 list, parameters returned from \code{getPara()}
}
}
\details{
AGP values and possible ploidy types of the input sample are screened for best combination which minimizes the total summation of distances from observed data points to the grid of theoretical canonical positions.
}
\value{
A list inherited from the output of \code{getSumDist()} with additional elements:
\item{percent.on.track}{For quality control, percent of genome close to at least one regression line.}
\item{percent.on.point}{For quality control, percent of genome close to at least one canonical point.}
\item{percent.change}{For quanlity control, percent of genome with CNA.}
\item{sam.p}{estimated AGP of the sample}
\item{type}{estimated ploidy type of the sample}
If \code{is.perm} is set TRUE in \code{para}, additional elements are included:
\item{conf.int}{95 percent confident interval of estimated AGP}
\item{std}{standard deviation of estimated AGP}
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
getSampleAGP(dd.dat,oo,para=para)
}
}