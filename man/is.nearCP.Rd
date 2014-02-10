\name{is.nearCP}
\alias{is.nearCP}
\title{
Near canonical position
}
\description{
Given coordinates of a data point and canonical position grid, this function tells if the data point is close to at least one canonical positions on the BAF-LRR plot.
}
\usage{
is.nearCP(seg.x, seg.y, gg, para)
}
\arguments{
  \item{seg.x}{
x coordinate of the data point.
}
  \item{seg.y}{
y coordinate of the data point.
}
  \item{gg}{
canoincal position grid as returned from \code{getGrid()}
}
  \item{para}{
 list, parameters returned from \code{getPara()}
}
}
\value{
logical
}
\author{
Bo Li
}
\examples{
x0=0.02
y0=0.1
p=0.8
gg=getGrid(x0,y0,p,para=getPara())
is.nearCP(0.42,0.1,gg,para=getPara())
}