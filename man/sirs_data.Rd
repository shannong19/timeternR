% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{sirs_data}
\alias{sirs_data}
\title{Example of SIRS model generated  from the \code{pomp} package.}
\format{
The object is a data frame.
}
\usage{
sirs_data
}
\description{
This is a deterministic SIRS model where 
the infection parameter \eqn{\beta = 0.2} and the recovery from infection parameter is
parameter is \eqn{\gamma = 0.1}.  The recovery to susceptible parameter is \eqn{\eta = .05}.  The initial number of susceptible is \eqn{S(0) = 990}
and the initial number of infectious is \eqn{I(0)=10}.  There are 100 steps.
So in summary, \eqn{S^\prime = -\beta SI / N + \eta R}, \eqn{I^\prime = \beta S I /N -\gamma I}
and \eqn{R^\prime = \gamma I - \eta R}.
}
\examples{
library(ggplot2)
library(tidyr)
head(sirs_data)
if(tidyr_new_interface()){
  ggplot(data = sirs_data \%>\%
         tidyr::pivot_longer(-c(time, .id)),
          aes(x = time, y = value,
                                                group = name,
                                                 col = name)) + geom_line()
}
}
\keyword{datasets}