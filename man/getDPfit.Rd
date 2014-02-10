\name{getDPfit}
\alias{getDPfit}
\title{
MCMC fitting for single sample
}
\description{
This function implements MCMC with Dirichlet process prior on a numeric vector.
}
\usage{
getDPfit(y, alpha = 0.05, low.thr = 0.05,prior,mcmc)
}
\arguments{
  \item{y}{
input numeric vector, can be either sAGP or CCF from one sample.
}
  \item{alpha}{
significance level.
}
  \item{low.thr}{
values below this threshold in \code{y} will be omitted.
}
\item{prior}{
a list of prior parameters required for \code{DPdensity}. An example is data(prior).
}
\item{mcmc}{
a list of parameters required to run MCMC for \code{DPdensity}. An example is data(mcmc).
}
}
\details{
Three models are evaluated in this function. 0) There is not enough events (n<5) to evaluate which model is true. 1) Normal-Uniform mixture and 2) Normal mixture with unknown number of Guassian peaks. The first model is evaluated by \code{SampleNMM()}, and the second by MCMC fitting. The two models are compared by BIC scores and a P-value is obtained from likelihood ratio test. 
}
\value{
A list is returned. In case of model 0, the list contains:
\item{model}{always 0}
In case of model 1, the list contains:
\item{PA0}{peak information, always equals -1.}
\item{A}{proportion of Uniform component.}
\item{mu}{mean of Normal component.}
\item{sigma}{standard deviation of Normal component.}
\item{P}{P-value}
\item{model}{always 1}
In case of model 2, the list contains:
\item{PA0}{peak information}
\item{x,y}{density function fitted by MCMC.}
\item{P}{P value}
\item{model}{always 2.}
}
\author{
Bo Li
}
\examples{
\donttest{
data(mcmc)
data(prior)
## model 1
y1=c(runif(50),rnorm(100,0.5,0.1))
getDPfit(y1,prior=prior,mcmc=mcmc)$model
## model 2
y2=c(rnorm(100,0.3,0.05),rnorm(100,0.7,0.05))
getDPfit(y2,prior=prior,mcmc=mcmc)$model
}
}