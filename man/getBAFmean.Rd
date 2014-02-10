\name{getBAFmean}
\alias{getBAFmean}
\title{
Compute mean of BAF
}
\description{
Using bi-modal Guassian fitting to calculate folded B-allele-frequency.
}
\usage{
getBAFmean(bb)
}
\arguments{
  \item{bb}{
numeric vector, original B-allele-frequency data from a given DNA segment.
}
}
\value{
a numeric number for folded BAF estimate.
}
\author{
Bo Li
}
\examples{
## generate BAF values symmetric around 0.5, resembling real data in a CNA region
y1<-rnorm(100,0.3,0.1)
y2<-rnorm(100,0.7,0.1)
y<-c(y1,y2)
## compute folded BAF
getBAFmean(y)

## generate BAF values distributed around 0.5, resembling real data in a non-CNA region
y<-rnorm(200,0.5,0.2)
## compute folded BAF
getBAFmean(y)
}