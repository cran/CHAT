\name{ApproxBIC}
\alias{ApproxBIC}
\title{
Approximate BIC calculation
}
\description{
Calculate approximate BIC for a given distribution and number of free parameters in the model.
}
\usage{
ApproxBIC(Y, fit.x, fit.y, n)
}
\arguments{
  \item{Y}{
input data vector, distribution of which is estimated.
}
  \item{fit.x}{
x coordinates of the fitted probability density function for \code{Y}
}
  \item{fit.y}{
y coordinates of the fitted probability density function for \code{Y}
}
  \item{n}{
number of parameters in the model
}
}
\details{
This function is a follow-up of MCMC fitting of a complicated distribution. \code{fit.x} and \code{fit.y} come from the fitting of Dirichlet process prior on sAGP or CCF distributions.
}
\value{
numeric, BIC score.
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
BIC=ApproxBIC(Y,fit$x1,fit$dens,length(prior))
}
}