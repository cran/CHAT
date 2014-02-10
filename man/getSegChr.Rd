\name{getSegChr}
\alias{getSegChr}
\title{
Perform binned DNA segmentation by chromosome
}
\description{
This function computes folded BAF and logR ratios for binned DNA segments for a given chromosome.
}
\usage{
getSegChr(bb.chr = NULL, ll.chr = NULL, sam.col=5, control=TRUE, 
thr.hets=0.1, bin = 1000, data.type='copy',controlOne=0)
}
\arguments{
  \item{bb.chr}{
numeric matrix, original B-allele frequency for a given chromosome for all samples. 
}
  \item{ll.chr}{
numeric matrix, original logR ratio for a given chromosome for all samples.
}
 \item{sam.col}{
the index of the column in BAF or LRR files where the first sample starts
}
  \item{control}{
If TRUE, each tumor sample is paired with normal immediately after it. The columns of the data file is organized : sample_1, control_1, sample_2, control_2 .... If FALSE, each sample serves the control of itself.
  }
  \item{thr.hets}{
 lower threshold of calling homozygous markers. BAF<=thr.hets or BAF>=1-thr.hets are considered homozygous.
  }
  \item{bin}{
integer, number of markers contained in each bin.
}
  \item{data.type}{
character string chosen from c('copy', 'log'). If 'copy', the value for LRR markers represent the copy number of SNPs. If 'log', the value is log2 based copy number intensity.
  }
  \item{controlOne}{
default 0. If positive, must be an integer number indicating the index of one control sample in the sample list. This control will be used for all the samples.
  }
}
\value{
a matrix containing the following columns: chromosome, start position, end position, median LRR value, number of LRR markers, folded BAF value, number of germline heterozygous BAF markers, with row names being sample ID. 
}
\author{
Bo Li
}
\seealso{
\code{\link{getSeg}}
}
\examples{
library(CHAT)
data(A0SD.BAF)
data(A0SD.LRR)
CHR=8
chr8.baf=A0SD.BAF[which(A0SD.BAF[,2]==CHR),]
chr8.lrr=A0SD.LRR[which(A0SD.LRR[,2]==CHR),]
dd=getSegChr(chr8.baf,chr8.lrr)
print(dd[1:4,])
}