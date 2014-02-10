\name{getsAGP}
\alias{getsAGP}
\title{
Segment-specific AGP estimation main function
}
\description{
This function is a wrapper of \code{getSegPurity()} and performs sAGP estimation by batch of samples.
}
\usage{
getsAGP(para)
}\arguments{
  \item{para}{
list, parameters returned from \code{getPara.sAGP()}
}
}
\value{
A numeric matrix with name 'new.dd' inherited from \code{getSeg()} or \code{getSegChr()} with additional columns: sAGP, nb and nt is saved in the current working directory.
}
\author{
Bo Li
}
\examples{
\donttest{
data(A0SD.BAF)
data(A0SD.LRR)
## DNA segmentation
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
## AGP estimation
getAGP(para=para)
para.s=getPara.sAGP()
para.s$inputdata='A0SDseg.Rdata'
para.s$purityfile='A0SD-AGP.txt'
para.s$savedata='A0SD-sAGP.Rdata'
## sAGP estimation
getsAGP(para=para.s)
}
}