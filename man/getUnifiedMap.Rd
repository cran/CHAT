\name{getUnifiedMap}
\alias{getUnifiedMap}
\title{
Merge adjacent break points
}
\description{
Two sets of break points from one chromosome, typically from B-allele frequency and logR ratios respectively are inputs, and this function uses input from LRR as template to adjust break point positions in BAF if they are close enough to one of the LRR break points.
}
\usage{
getUnifiedMap(seg.L.chr, seg.B.chr, map.chr, thr = 5)
}
\arguments{
\item{seg.L.chr}{
break point positions from LRR segmentation.
}
\item{seg.B.chr}{
break point positions from BAF segmentation.
}
\item{map.chr}{
SNP positions or starting position of aCGH markers.
}
\item{thr}{
if two break points are located within \code{thr} number of markers, they will be merged.
}
}
\details{
Each set of break points contains even number, increasing integers, alternating between start and end positions of a DNA segment.
}
\value{
a vector containing the merged break point positions.
}
\author{
Bo Li
}
\examples{
seg.L<-c(1,10,11,100,101,120)
seg.B<-c(1,11,12,60,61,120)
map.chr<-1:130
getUnifiedMap(seg.L,seg.B,map.chr)
}