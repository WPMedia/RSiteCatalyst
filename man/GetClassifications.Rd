% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/GetClassifications.R
\name{GetClassifications}
\alias{GetClassifications}
\title{Get Classifications for Selected Report Suite Elements}
\usage{
GetClassifications(reportsuite.ids, elements = c())
}
\arguments{
\item{reportsuite.ids}{Single report suite id or list of report suites}

\item{elements}{Optional. List of existing elements you want to use in combination with an additional metric}
}
\value{
Data frame
}
\description{
Retrieves a list of classifications (associated with the specified element) for each of the specified report suites.
}
\details{
Retrieves a list of classifications (associated with the specified element) for each of the specified report suites.
Function attempts to flatten classifications as best as possible; may return data frame having a nested list as a column if classification
is sufficiently complex.
}
\examples{
\dontrun{

classifications <- GetClassifications(c("prod", "dev"), "trackingcode")

}
}

