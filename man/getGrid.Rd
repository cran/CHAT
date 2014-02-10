\name{getGrid}
\alias{getGrid}
\title{
Find all the coordinates for canonical points
}
\description{
This function computes the grid of canonical points on a BAF-LRR plot
}
\usage{
getGrid(x0, y0, p, type = 1, Nc = 10, BAF = "all", para = para)
}
\arguments{
  \item{x0}{
x coordinate for the Origin Cluster
}
  \item{y0}{
y coordinate for the Origin Cluster
}
  \item{p}{
numeric, an AGP value. See details.
}
  \item{type}{
integer, ploidy indicator. 1, diploid; 2, tetraploid; 3, hexaploid
}
  \item{Nc}{
integer, maximum number of total copy number to be considered.
}
  \item{BAF}{
output option. BAF either takes the value 'all' or an integer number. If BAF=0, only LOH track will be returned; if BAF=1, only canonical points with configuration (1,nt) will be returned; etc. 
}
  \item{para}{
 list, parameters returned from \code{getPara()}
}
}
\details{
On a BAF-LRR plot, DNA segments with different combinations of minor allele (nb) and total alleles (nt) are located on different positions, namely canonical positions. The coordinates of these positions are affected by both nb, nt and the possible contraction rate towards the origin, which represents the fraction of cells without any copy number alterations in the tumor sample. the input, \code{p} is the contraction rate, later will be called aneuploid genome proportion, or AGP. 
}
\value{
A numeric matrix with two columns: x and y coordinates of canonical positions.
}
\author{
Bo Li
}
\examples{
x0=0.02
y0=0.1
p=0.8
gg=getGrid(x0,y0,p,para=getPara())
## place canonical points on a BAF-LRR plot, with AGP=0.8
plot(0,0,cex=0,xlim=c(0,0.5),ylim=c(-1,3),xlab='BAF',ylab='LRR')
points(gg,pch='*',cex=2,lwd=2)
}