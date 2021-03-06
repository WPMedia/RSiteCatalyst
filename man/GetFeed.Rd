% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/GetFeed.R
\name{GetFeed}
\alias{GetFeed}
\title{Get Data Feed Detail for a specific feed}
\usage{
GetFeed(feed.id)
}
\arguments{
\item{feed.id}{Data Feed ID}
}
\value{
Data frame
}
\description{
Returns structure of a data feed, including column header names
}
\details{
This function requires a single data feed id (obtained from GetFeeds)
}
\examples{
\dontrun{

#Get info for feed #110980
feed <- GetFeed("110980")


}
}

