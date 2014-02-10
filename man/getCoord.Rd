\name{getCoord}
\alias{getCoord}
\title{
Computes coordinates of a canonical point
}
\description{
This function calculates the x and y coordinates of a canonical point on BAF-LRR plot.
}
\usage{
getCoord(p, x0, y0, nn, nb, nt)
}
\arguments{
  \item{p}{
numeric, proportion of aneuploid genome for a DNA segment
}
  \item{x0}{
numeric, x coordinate for the Origin Cluster
}
  \item{y0}{
numeric, y coordinate for the Origin Cluster
}
  \item{nn}{
integer, ploidy indicator. 1, diploid; 2, tetraploid; 3, hexaploid
}
  \item{nb}{
integer, number of minor alleles
}
  \item{nt}{
integer, number of total alleles
}
}
\value{
A list of x and y coordinates.
}
\author{
Bo Li
}
\examples{
x0=0.05
y0=0.2
p=0.8
## Calculate the coordinates for copy-neutral-LOH segment
getCoord(p,x0,y0,1,0,2)
}