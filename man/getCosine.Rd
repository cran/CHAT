\name{getCosine}
\alias{getCosine}
\title{
Computes cosine value of the angle for two vectors.
}
\description{
This function implements the Law of Cosines to compute the cosine value of two vectors on BAF-LRR plot.
}
\usage{
getCosine(v1, v2)
}
\arguments{
  \item{v1}{
numeric vector
}
  \item{v2}{
numeric vector
}
}
\value{
numeric cosine value
}
\author{
Bo Li
}
\examples{
## See what happens to vectors with 45 degree angle
v1=c(1,1)
v2=c(1,0)
getCosine(v1,v2)
}