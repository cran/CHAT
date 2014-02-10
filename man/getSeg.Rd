\name{getSeg}
\alias{getSeg}
\title{
Perform DNA segmentation and calculate folded BAF and logR ratios.
}
\description{
The function is a wrapper for \code{getSegChr()}, which calculates the folded BAF and logR ratios for each chromosome.
}
\usage{
getSeg(BAFfilePath, logRfilePath, sam.col=5, control=TRUE, 
thr.hets=0.1, bin = 500, savefile, data.type='copy',cbs=FALSE,
controlOne=0,nt=FALSE)
}
\arguments{
  \item{BAFfilePath}{
character string, full path to directory where all BAF files are located.
}
  \item{logRfilePath}{
character string, full path to directory where all LRR files are located.
}
 \item{sam.col}{
the index of the column in BAF or LRR files where the first sample starts.
}
  \item{control}{
If TRUE, each tumor sample is paired with normal immediately after it. The columns of the data file is organized : sample_1, control_1, sample_2, control_2 .... If FALSE, each sample serves the control of itself.
  }
  \item{thr.hets}{
 lower threshold of calling homozygous markers. BAF<=thr.hets or BAF>=1-thr.hets are considered homozygous.
  }
  \item{bin}{
integer, number of markers in each bin.
}
  \item{savefile}{
character string, Rdata file to be saved in working directory.
}
  \item{data.type}{
character string chosen from c('copy', 'log'). If 'copy', the value for LRR markers represent the copy number of SNPs. If 'log', the value is log2 based copy number intensity.
  }
  \item{cbs}{
 if TRUE, circular binary segmentation will be performed using R package 'DNAcopy', instead of binned segmentation.
  }
    \item{controlOne}{
default 0. If assigned, must be an integer number indicating the index of one control sample in the sample list. This control will be used for all the samples.
  }
    \item{nt}{
 logic, if TRUE, multi-thread processing will be used. Require R package \code{multicore}. Not supported on Windows system.
  }
}
\details{
The input format for BAF and LRR files are the same and as follows: 1) in the directory, there are n tab-deliminated plain text files, where n is the number of chromosomes, with file name chrN.txt, N=1,2,...22. sex and mitochondria chromosomes are currently not included in the analysis. No other file should be included. 2) for tumor/normal paired design (\code{control}=TRUE), each plain text file must have the following fields:
Marker-ID, chromosome, start position, end position, Tumor 1, Paired-normal 1, Tumor 2, Paired-normal 2, ..., etc. For study with tumors matched with one control sample, the order of samples is not required.
It is not necessary to sort the genomic positions beforehand.
}
\value{
NULL. An Rdata file with variable name 'dd.dat' will be saved in the working directory with following fields: sample-ID, chromosome, start position, end position, LRR value, number of LRR markers, BAF value, number of BAF markers. The saved file can be immediately used in downstream analysis.
}
\author{
Bo Li
}
\seealso{
\code{\link{getSegChr}}
}
\examples{
\dontrun{
	getSeg(directory_to_BAF_files, directory_to_LRR_files, bin=1000)
}
}