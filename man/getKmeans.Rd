\name{getKmeans}
\alias{getKmeans}
\title{
K-means clustering of data points
}
\description{
Performs canonical K-means clustering of data points on BAF-LRR plot. (Internal use)
}
\usage{
getKmeans(sam.dat, iter.max = 10, para)
}
\arguments{
  \item{sam.dat}{
numeric matrix, segmentation file returned by getSegChr() or getSeg()
}
  \item{iter.max}{
integer, maximum number of iteration to be performed before convergence
}
  \item{para}{
a list of parameters returned by getPara()
}
}
\value{
a kmeans object for internal use.
}
\author{
Bo Li
}
\examples{
para=getPara()
\dontrun{
data(A0SD.BAF)
data(A0SD.LRR)
chr8.baf=A0SD.BAF[A0SD.BAF[,2]==8,]
chr8.lrr=A0SD.LRR[A0SD.LRR[,2]==8,]
x=getSegChr(chr8.baf,chr8.lrr)
getKmeans(x,para=para)
}
}