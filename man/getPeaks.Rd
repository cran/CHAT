\name{getPeaks}
\alias{getPeaks}
\title{
Find peaks on a curve
}
\description{
Find all the local maxima and their corresponding positions in a given curve.
}
\usage{
getPeaks(x, y, sep = 8, thr = 0.01)
}
\arguments{
  \item{x}{
x coordinates for the curve.
}
  \item{y}{
y coordinates for the curve.
}
  \item{sep}{
number of initial split of the curve.
}
  \item{thr}{
sensitivity threshold to call a local maxima.
}
}
\value{
numeric matrix with two columns: position of peaks and peak values.
}
\author{
Bo Li
}
\examples{
Y=c(rnorm(50,0.4,0.05),rnorm(50,0.8,0.05))
fit=density(Y)
getPeaks(fit$x,fit$y)
}