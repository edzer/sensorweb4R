% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/distance-matrix.R
\docType{methods}
\name{distance-matrix-methods}
\alias{distance}
\alias{distance,DistanceStation-method}
\alias{distance-matrix-methods}
\alias{distanceMatrix}
\alias{distanceMatrix,SpatialPoints-method}
\alias{distanceMatrix,Station-method}
\alias{nearest}
\alias{nearest,Station,Station-method}
\alias{nearest,Station,missing-method}
\alias{readDistanceMatrix}
\alias{saveDistanceMatrix}
\title{Distance matrix methods}
\usage{
saveDistanceMatrix(dm, file)

readDistanceMatrix(file)

distance(x)

\S4method{distance}{DistanceStation}(x)

nearest(x, all, dm = NULL, n = 1, ...)

\S4method{nearest}{Station,Station}(x, all, dm = NULL, n = 1,
  filter.fun = NULL, ...)

\S4method{nearest}{Station,missing}(x, all, dm = NULL, n = 1,
  filter.fun = NULL, ...)

distanceMatrix(x, ...)

\S4method{distanceMatrix}{SpatialPoints}(x, ...)

\S4method{distanceMatrix}{Station}(x, ...)
}
\arguments{
\item{dm}{The distance matrix.}

\item{file}{the file to save to or read from}

\item{x}{For \code{distanceMatrix}: The object to create a distance matrix for.\cr
For \code{nearest}: the object to calculate the nearest neighbors for.}

\item{all}{The possible nearest neighbors for \code{x}. For the
\linkS4class{Station} method, \code{all} can be omitted.
In that case, \code{all} will default to \code{stations(endpoint(x))}.}

\item{n}{The number of nearest objects that should be returned.}

\item{filter.fun}{A function returning a \code{logical} vector to subset
\code{all} and to allow only specific elements of \code{all}
to be considered for the calculation.}

\item{dm}{The distance matrix for the objects (generated if missing).}
}
\value{
For \code{nearest}: a subset of \code{all} orderd by their distance
to \code{x}, enriched with an additional distance attribute.

For \code{distanceMatrix} and \code{readDistanceMatrix}: a distance
matrix of class \code{dist}.

For \code{distance}: a numeric vector containing the distance in meters.
}
\description{
Methods to calculate distances between objects and to find the geographically
nearest neighbor(s) between objects.
}
\details{
\code{nearest} calculates the nearest objects of \code{all} in relation
to \code{x}. The distance matrix can be supplied using the \code{dm}
parameter and can be calculated using \code{distanceMatrix}. As this
computation is quite expensive the distance matrix can be saved and read
using \code{saveDistanceMatrix} and \code{readDistanceMatrix}.

\code{nearest} returns the same class or a subclass of \code{all}. The
returned vector or vectorized object is sorted by their distance to
\code{x}. Additionally the distance can be obtained using \code{distance}.

The distance is calculated using computations on an ellipsoid and the
returned value is in meters.
}
\examples{
endpoint <- example.endpoints()[2]
sta.all <- stations(endpoint)
station <- sample(sta.all, 1)
dm <- distanceMatrix(sta.all)
sta.near <- nearest(station, stations = sta.all, dm = dm, n = 5)
distance(sta.near)
\dontrun{
saveDistanceMatrix(dm, 'distance_matrix.rds')
sta.near <- nearest(station, stations = sta.all,
                    dm = readDistanceMatrix('distance_matrix.rds'))
}
}

