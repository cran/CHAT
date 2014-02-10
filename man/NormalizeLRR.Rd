\name{NormalizeLRR}
\alias{NormalizeLRR}
\title{
Normalize LRR values
}
\description{
This function performs correction on both negative and positive LRR values, based on factors given in getPara().
}
\usage{
NormalizeLRR(x, para)
}
\arguments{
  \item{x}{
numeric matrix, typically one sample from the complete data matrix returned from getSeg().
}
  \item{para}{
list, parameters returned by getPara().
}
}
\value{
A new numeric data matrix with LRR normalized.
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
NormalizeLRR(x,para=para)
}
}