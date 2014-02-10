\name{findRobustPeaks}
\alias{findRobustPeaks}
\title{
Find well-separated peaks
}
\description{
This function is a follow-up of \code{getPeaks()} by merging closely located ambiguous peaks together.
}
\usage{
findRobustPeaks(fit, thr = 1.5)
}
\arguments{
  \item{fit}{
a density fit returned by \code{density()}
}
  \item{thr}{
threshold to separate adjacent peaks. See details.
}
}
\details{
If two peaks are closely located, one way to tell if they are actually one peak or otherwise is by comparing the peak height with peak width. By assuming both peaks are normally distributed, this is equivalent to compare the peak height with the height of the local minima (h) between them. \code{thr} is the minimum ratio of the lower peak height over h. If this ratio is larger than \code{thr}, the two peaks are considered separated.
}
\value{
a numeric matrix in the same format as returned by \code{getPeaks()}
}
\author{
Bo Li
}
\examples{
\donttest{
data(mcmc)
data(prior)
library(DPpackage)
Y=c(rnorm(40,0.4,0.05),rnorm(40,0.8,0.05))
vv=which(Y>0.05&Y<1)
fit=DPdensity(Y,status=TRUE,mcmc=mcmc,prior=prior)
findRobustPeaks(fit)
}
}