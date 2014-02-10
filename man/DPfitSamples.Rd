\name{DPfitSamples}
\alias{DPfitSamples}
\title{
MCMC fitting of sAGP values
}
\description{
This function is a wrapper for \code{getDPfit()} by analyzing batch samples for sAGP values.
}
\usage{
DPfitSamples(dd, alpha = 0.05, low.thr = 0.05, min.peaksize = 10, prior, mcmc, nt=FALSE)
}
\arguments{
  \item{dd}{
numeric matrix, returned from \code{getsAGP} or \code{getSegPurity()}
}
  \item{alpha}{
significant level.
}
  \item{low.thr}{
values below this threshold in sAGP will be omitted.
}
  \item{min.peaksize}{
minimum number of segments each peak must contain.
}
\item{prior}{
a list of prior parameters required for \code{DPdensity}. An example is data(prior).
}
\item{mcmc}{
a list of parameters required to run MCMC for \code{DPdensity}. An example is data(mcmc).
}
\item{nt}{
logic. If TRUE, multi-thread processing is performed and R package \code{multicore} is required. This is currently not supported on Windows system.
}
}
\value{
A list containing the following elements:
\item{DD}{input \code{dd} with additional peak information.}
\item{Labels}{a vector assigning each sample to model 0, 1 or  2. See \code{getDPfit()} for more details.}
\item{Pval}{P value}
\item{par}{parameters fitted for the distribution of sAGP value from each sample.}
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
## Perform MCMC fitting
load('A0SD-sAGP.Rdata')
data(mcmc)
data(prior)
temp=DPfitSamples(new.dd,prior=prior,mcmc=mcmc)
}
}