\name{getSampleCCF}
\alias{getSampleCCF}
\title{
CCF estimation by sample.
}
\description{
Finds the Cancer Cell Fraction values of each somatic mutations in one sample.
}
\usage{
getSampleCCF(id, dd, VCFdir, thr.coverage = 10, upper.cov=0.99, 
nc = 10, tc = 11, AD = 3, filter = TRUE, TCGA=TRUE)
}
\arguments{
  \item{id}{
sample identifier. Must be appearing in the VCF file name.
}
  \item{dd}{
numeric matrix, as returned from \code{getSegPurity()} or \code{getsAGP()}
}
  \item{VCFdir}{
directory where the VCF file for the input sample is saved.
}
  \item{thr.coverage}{
variants with coverage below this threshold will be removed.
}
 \item{upper.cov}{
sites with coverage above this percentile will be removed.
 }
\item{nc}{
the column index in VCF file which coverage information for normal control sample is placed.
}
\item{tc}{
the column index in VCF file which coverage information for tumor sample is placed.
}
\item{AD}{
the index of Allele Depth field placed in a ';' deliminated string of sample coverage information.
}
\item{filter}{
logical. If TRUE, the 'FILTER' column in the VCF file is pre-processed and for variants passed QC, this field is set 'PASS'.
}
 \item{TCGA}{
 If you are working with The Cancer Genome Atlas datasets, set this to be TRUE. The sample identifier is assumed to be in format described in 
 
 https://wiki.nci.nih.gov/display/TCGA/TCGA+Barcode
 }
}
\value{
a matrix in the format of VCF file for all somatic mutations with updated 'INFO' field. The additional information include:
sample ID, coverage of reference allele in tumor, coverage of alternative allele in tumor, coverage of reference allele in control, coverage of alternative allele in control, CCF estimation, standard deviation of CCF, sAGP, nb, nt and lineage scenario.
}
\author{
Bo Li
}
\examples{
\dontrun{
## This is not executable. User must create their own VCF directory.
id='TCGA.A1.A0SD'
VCFdir='VCF/'
## Slow. Run with caution.
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
load('A0SD-sAGP.Rdata')
getSampleCCF(id,new.dd,VCFdir)
}
}