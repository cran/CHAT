\name{getAGP}
\alias{getAGP}
\title{
AGP estimation main function
}
\description{
This function is a wrapper for \code{getSampleAGP()} by taking multiple samples and perform batch estimation.
}
\usage{
getAGP(para)
}
\arguments{
  \item{para}{
list, parameters returned from \code{getPara()}
}
}
\value{
A tab-delinimated plain text file with the following fields:
sample ID, estimated AGP, (standard deviation), percent genome with CNA, percent on point, percent on regression line, ploidy type, tumor ploidy, overall ploidy, percent of genome amplified, percent of genome deleted, percent of genome with hemizygous deletion, percent of genome with cn-LOH, (95 percent CI lower boundary),(median),(95 percent CI higher boundary).
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
save(dd.dat,file='A0SDseg.Rdata')
para=getPara()
para$datafile='A0SDseg.Rdata'
para$savefile='A0SD-AGP.txt'
para$is.normalize=FALSE
getAGP(para=para)
}
}