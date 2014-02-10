\name{getHets}
\alias{getHets}
\title{
Obtain germline heterozygous markers
}
\description{
Remove uninformative germline homozygous markers for a DNA segment.
}
\usage{
getHets(baf, paired.baf = NULL, thr = 0.18)
}
\arguments{
  \item{baf}{
numeric vector, original B-allele frequency from a cancer DNA segment
}
  \item{paired.baf}{
numeric vector, original B-allele frequency from a paired normal DNA segment, with exactly the same length as baf. See details.
}
  \item{thr}{
numeric, threshold to call germline heterozygous markers.
}
}
\details{
When paired.baf is given, any marker has germline BAF>=1-thr or BAF<=thr are considered as homozygous. If paired.baf is missing, then in non-LOH regions, the method uses the same criteria to select heterozygous markers; in LOH regions, 1/3 of the markers are randomly selected as germline heterozygous. 
}
\value{
a vector of indices indicating the positions of heterozygous markers in input baf. 
}
\author{
Bo Li
}
\examples{
library(CHAT)
data(A0SD.BAF)
baf=A0SD.BAF[1:1000,5]
paired.baf=A0SD.BAF[1:1000,6]
vv=getHets(baf,paired.baf)
}