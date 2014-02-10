\name{plotIdentifiableZone}
\alias{plotIdentifiableZone}
\title{
Plot Identifiable Zone on sAGP-SAF plot
}
\description{
This function generates diagnostic identifiable zones on sAGP-SAF plot.
}
\usage{
plotIdentifiableZone(nt, nb,add=FALSE,legend=TRUE,title=TRUE)
}
\arguments{
  \item{nt}{
integer, number of total alleles.
}
  \item{nb}{
integer, number of minor allele.
}
 \item{add}{
 logic, if TRUE, areas of identifiable zones will be overlaid onto the current active device.
 }
 \item{legend}{
 logic, if TRUE, legend indicating scenario A1, A2, B and C will be added to the plot.
 }
 \item{title}{
 logic, if TRUE, values of nt and nb will be titled to the plot.
 }
}
\details{
To estimate Cancer Cell Fraction using two known quantities: segment-specific AGP (sAGP) of the DNA segment that mutation occurred on and somatic allele frequency (SAF) of the mutation, it is helpful to learn how different temporal order scenarios affect the inference. This function places the uniquely identifiable regions as well overlapping, unidentifiable regions on sAGP-SAF plot to visually diagnose how well the four temporal scenarios can be separated.
}
\value{
NULL
}
\author{
Bo Li
}
\examples{
par(mfrow=c(1,3),mar=c(4,4,1,0))
## hemizygous deletion
plotIdentifiableZone(1,0)
## cn-LOH
plotIdentifiableZone(2,0)
## hemizygous amplification
plotIdentifiableZone(3,1)
}