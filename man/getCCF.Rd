\name{getCCF}
\alias{getCCF}
\title{
CCF estimation main function
}
\description{
This is a wrapper for \code{getSampleCCF()} by allowing batch sample processing.
}
\usage{
getCCF(VCFdir, sAGPfile, output = "new.vcf", nt = FALSE, 
nc = 10, tc = 11, AD = 3, filter = TRUE,TCGA=TRUE)
}
\arguments{
  \item{VCFdir}{
directory where the VCF file for all samples is saved.
}
  \item{sAGPfile}{
Rdata file saved by \code{getsAGP()}
}
  \item{output}{
name of output VCF file.
}
  \item{nt}{
logical, if multi-thread processing is applied. If TRUE, R package 'multicore' must be installed. Currently this option is not supported on Windows system.
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
logical. If TRUE, the 'FILTER' column in the VCF file is assumed to have been pre-processed and for variants passed QC, this field is set 'PASS'.
}
 \item{TCGA}{
 If you are working with The Cancer Genome Atlas datasets, set this to be TRUE. The sample identifier is assumed to be in format described in 

https://wiki.nci.nih.gov/display/TCGA/TCGA+Barcode
 }
}
\details{
	In the return VCF, the field INFO is modified to include all the inferences. The additional fields in the INFO columns of the VCF file include (in exactly this order):
	sample ID, coverage of reference allele in tumor, coverage of alternative allele in tumor, coverage of reference allele in control, coverage of alternative allele in control, CCF estimation, standard deviation of CCF, sAGP, nb, nt and lineage scenario.
}
\value{
NULL. A new VCF file containing all the somatic mutations from all the VCF files will be generated.
}
\author{
Bo Li
}
\examples{
\dontrun{
## This is not executable. User must create their own VCF directory.
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
## CCF estimation
getCCF(VCFdir,'A0SD-sAGP.Rdata','A0SD-AGP.Rdata')
}
}