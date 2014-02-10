\name{getSegPurity}
\alias{getSegPurity}
\title{
Segment-specific AGP inference by sample
}
\description{
This function implements the sAGP inference algorithm, by placing each of the data point onto a BAF-LRR plot. AGP inference must be done in prior.
}
\usage{
getSegPurity(seg.dat, oo, AGP = 1, type = 1, para, rm.thr = 50, ref.dd = NULL)
}
\arguments{
  \item{seg.dat}{
numeric matrix, segmentation data returned from getSegChr() or getSeg()
}
  \item{oo}{
list, origin information returned from getOrigin() or getDiploidOrigin()
}
  \item{AGP}{
numeric, AGP value for the sample being evaluated
}
  \item{type}{
integer, ploidy type of tumors. 1, diploid; 2, tetraploid; 3, hexaploid. 
}
  \item{para}{
list, parameters returned fro getPara.sAGP()
}
  \item{rm.thr}{
integer, segments with number of BAF markers below this threshold will be removed.
}
  \item{ref.dd}{
numeric matrix, in the same format as sam.dd. If given, no copy number estimation will be performed, and only sAGP will be inferred.
}
}
\details{
For a data point A on BAF-LRR plot, the algorithm search through all the canonical lines and find the nearest ones to A. Each canonical line corresponds to the contraction path from a canonical point with (nb, nt) towards the origin, where nb is the number of minor allele and nt the number of total alleles. It then uses an empirical objective function F=nt-2*type+K*|sAGP-AGP|, to determine which line to choose.  sAGP is the estimated aneuploid fraction of the specific segment for a given canonical line and K the constant parameter set in para. The purporse of this function is to find the most parsimonious combination of nb, nt and sAGP, with parsimony meaning close to genome-wide average.
}
\value{
a numeric matrix with following columns: chromosome, start position, end position, LRR value, number of LRR markers, BAF value, number of BAF markers, sAGP, number of minor alleles, number of total alleles.
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
para.s=getPara.sAGP()
para=getPara()
oo=getOrigin(dd.dat,para=para)
sAGP.dat=getSegPurity(dd.dat,oo,AGP=0.5,para=para.s)
}
}