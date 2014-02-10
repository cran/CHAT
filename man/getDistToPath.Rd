\name{getDistToPath}
\alias{getDistToPath}
\title{
Find nearest distance from a data point to a canonical line
}
\description{
For a given point on BAF-LRR plot and a given canonical line, this function finds the nearest point on the line to the data point.
}
\usage{
getDistToPath(x0, y0, x, y, type, nb, nt, strictness = 1.1, 
thr = 0.001, is.scaling = F, BAF.scale = 8)
}
\arguments{
  \item{x0}{
x coordinate for the Origin Cluster
}
  \item{y0}{
y coordinate for the Origin Cluster
}
  \item{x}{
x coordinate for the data point
}
  \item{y}{
y coordinate for the data point
}
  \item{type}{
integer, ploidy indicator. 1, diploid; 2, tetraploid; 3, hexaploid
}
  \item{nb}{
number of minor alleles
}
  \item{nt}{
number of total alleles
}
  \item{strictness}{
noise tolerance for points with sAGP around 1. See \code{getPara.sAGP()} for details.
}
  \item{thr}{
numeric, see details.
}
  \item{is.scaling}{
logic. If TRUE, the function will rescale the BAF values so that it has the same dimension as LRR.
}
  \item{BAF.scale}{
numeric. If is.scaling is TRUE, this is the value to rescale BAF values.
}
}
\details{
For a given data point A, and a canonical line L, this function first finds a point X on L that is closest to A, and designates the distance from A to X is the closest distance from A to L. This step is achieved by sequentially split the period of L and select the half that is closer to A. The argument \code{thr} is the sensitivity threshold to find X during this step.
}
\value{
A list representing a canonical line and containing the following elements:
\item{p.min}{sAGP value of the nearest point (X) on L to the data point (A).}
\item{dist}{distance from A to X.}
\item{x.min}{x coordinate of X.}
\item{y.min}{y coordinate of X.}
}
\author{
Bo Li
}
\examples{
x0=0.05
y0=0.2
x=0.15
y=0.45
## Find X on canonical line for hemizygous amplification:
getDistToPath(x0,y0,x,y,1,1,3)
}