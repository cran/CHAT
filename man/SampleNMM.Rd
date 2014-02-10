\name{SampleNMM}
\alias{SampleNMM}
\title{
Normal-Uniform mixture model fitting
}
\description{
This function fits the distribution of a input vector with mixture of Normal and Uniform distributions and returns the BIC score for the model.
}
\usage{
SampleNMM(Y)
}
\arguments{
  \item{Y}{
input vector. In the context of subclonality inference, \code{Y} can either be sAGP or CCF values from one sample.
}
}
\details{
The model is: Y~ A*U(0,1)+(1-A)*Normal(mu,sigma), where A, mu and sigma are parameters to be fitted.
}
\value{
a list containing the following elements:
\item{BIC}{BIC score from the model.}
\item{fit}{a vector containing three numbers, in the order of fitted A, mu and sigma.}
}
\author{
Bo Li
}
\examples{
Y=c(rnorm(100,0.5,0.3),runif(100,0,1))
SampleNMM(Y)
}