\name{getCanonicalLines}
\alias{getCanonicalLines}
\title{
Regression lines on canonical points with same number of minor alleles
}
\description{
This function performs linear regression on canonical points with same number of minor alleles. This is an approximation of the real data grid to achieve faster computational speed.
}
\usage{
getCanonicalLines(oo, p, type = 1, para)
}
\arguments{
  \item{oo}{
Origin Cluster, returned by \code{getOrigin()}
}
  \item{p}{
numeric, AGP value. see \code{getGrid()} for details.
}
  \item{type}{
integer, ploidy indicator. 1, diploid; 2, tetraploid; 3, hexaploid
}
  \item{para}{
 list, parameters returned from \code{getPara()}
}
}
\value{
A list including the following elements:
\item{b}{slope of the line}
\item{k}{intercept of the line}
\item{oo}{Origin Cluster}
}
\author{
Bo Li
}
\examples{
oo=NULL
oo$x0=0.02
oo$y0=0.1
oo$list=c()
cali=getCanonicalLines(oo,0.8,para=getPara())
}