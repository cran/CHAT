\name{MergeBreakPointsByChr}
\alias{MergeBreakPointsByChr}
\title{
Merge break points from two sets
}
\description{
Two sets of break points from one chromosome, typically from B-allele frequency and logR ratios respectively are inputs, and this function merges the two sets as one.
}
\usage{
MergeBreakPointsByChr(chr, id, seg.B, seg.L, map.chr, thr = 5)
}
\arguments{
\item{chr}{chromosome number}
\item{id}{sample identifier}
\item{seg.B}{
segmentation matrix for BAF as returned by \code{segment()} from 'DNAcopy'
}
\item{seg.L}{
segmentation matrix for LRR as returned by \code{segment()} from 'DNAcopy'
}
\item{map.chr}{
SNP positions or starting position of aCGH markers.
}
\item{thr}{
if two break points are located within \code{thr} number of markers, they will be merged.
}
}
\value{
a new matrix with merged segmentations.
}
\author{
Bo Li
}
\examples{
seg.L<-cbind('temp',1,matrix(c(1,10,11,100,101,120),ncol=2,byrow=TRUE))
seg.B<-cbind('temp',1,matrix(c(1,11,12,60,61,120),ncol=2,byrow=TRUE))
map.chr<-1:130
MergeBreakPointsByChr(1,'temp',seg.B,seg.L,map.chr)
}