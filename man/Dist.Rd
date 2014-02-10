\name{Dist}
\alias{Dist}
\title{
Distance from point to a line
}
\description{
Compute point to line distance, internal use.
}
\usage{
Dist(x0, y0, A, B, C)
}
\arguments{
  \item{x0}{
x coordinate of the point
}
  \item{y0}{
y coordinate of the point
}
  \item{A,B,C}{
coefficient for a line Ax+By+C=0.
}
}
\value{
numeric value of the distance
}
\author{
Bo Li
}
\examples{
x0=0.12
y0=0.45
d=Dist(x0,y0,1,1,-0.2)
}