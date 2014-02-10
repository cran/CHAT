\name{getDiploidOrigin}
\alias{getDiploidOrigin}
\title{
Estimate diploid origin in higher ploidy  samples
}
\description{
In higher ploidy samples, the Origin Cluster estimated by getOrigin() usually represents the fraction of genome with balanced gains. This function estimates the position of the unchanged diploid genome on BAF-LRR plot.
}
\usage{
getDiploidOrigin(dd, oo, para)
}
\arguments{
  \item{dd}{
numeric matrix, as returned from getSegPurity()
}
  \item{oo}{
list, returned from getOrigin()
}
  \item{para}{
list, returned from getPara.sAGP()
}
}
\value{
a new list for diploid genome fraction, in the same format as input oo.
}
\author{
Bo Li
}