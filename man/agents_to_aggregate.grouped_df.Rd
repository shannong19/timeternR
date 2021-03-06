% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/agent-to-aggregate.R
\name{agents_to_aggregate.grouped_df}
\alias{agents_to_aggregate.grouped_df}
\title{generalized function to convert raw agent based data to aggregate data
for grouped_data (preforms per group)}
\usage{
\method{agents_to_aggregate}{grouped_df}(
  agents,
  states,
  death = NULL,
  birth = NULL,
  min_max_time = c(0, NA),
  integer_time_expansion = TRUE
)
}
\arguments{
\item{agents}{grouped data.frame with individual agent information}

\item{states}{Name-variable pairs of the form
\code{states = c(col1, col2, col3)}, that describe which columns contain the
time one entered the state. Do not include column for original state. These
need to be ordered, for example: for an SIR model, with columns
"\code{tI}" and "\code{tR}" expressing the time the individual became
infected and recovered (respectively), we want "\code{states = c(tI, tR)}".}

\item{death}{string for column with death time information (default
\code{NULL})}

\item{birth}{string for column with birth time information (default
\code{NULL})}

\item{min_max_time}{vector (length 2) of minimum and maximum integer time,
the second value can be \code{NA} - and if so, we estimate maximum time from
the data.}

\item{integer_time_expansion}{boolean if every integer time point in the 
range of \code{min_max_time} should be presented in the aggregation output.
If \code{FALSE} (default is \code{TRUE}), then lines will only include those
time points where}
}
\value{
grouped dataset with aggregated information per group, We label
classes "\code{X\{i\}}" for i in \code{0:(length(states))}.
}
\description{
This function converts data on an agent-based level (1 row = 1 agent)
relative when an agent is in each state and aggregates it, so that the user
can know how many agents are in each state at a given time point (integer
based). This function takes \code{grouped_df} \code{data.frame}s (from
\pkg{dplyr}) and aggregates within grouping parameters and also
provides the columns associated with the grouping.
}
\details{
note that all parameters related to name columns can also be in a
  string format. More details can be found in \code{agents_to_aggregate}'s
  documentation.
}
\examples{
library(dplyr)

max_time <- 100
agents_g <- hagelloch_raw \%>\%
  filter(SEX \%in\% c("female", "male")) \%>\% group_by(SEX)
sir_group <- agents_to_aggregate(agents_g, states = c(tI, tR),
                                 min_max_time = c(0, max_time))
agents <- agents_g \%>\%
  filter(SEX == "female") \%>\% ungroup()
sir_group1 <- agents_to_aggregate(agents, states = c(tI, tR),
                                 min_max_time = c(0, max_time))
sir_group_1 <- sir_group \%>\% filter(SEX == "female")
assertthat::are_equal(sir_group1,
                      sir_group_1 \%>\% ungroup \%>\% select(t, X0, X1, X2))
}
