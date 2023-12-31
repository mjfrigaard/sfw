% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils-js.R
\name{make_selector}
\alias{make_selector}
\title{Make Selector}
\usage{
make_selector(selector, process_selector = TRUE)
}
\arguments{
\item{selector}{A CSS selector. If no selector
is recognised and \code{process_selector} is set to
\code{TRUE} then it is assumed to be an id.
e.g.: \code{show("hello")} will reveal the element with
\code{id} or \code{inputId} of \code{hello}.}

\item{process_selector}{Whether to pre-process the
\code{selector} argument to ensure a valid CSS selector
is passed.}
}
\description{
Ensure that the output is a valid CSS selector.
}
\examples{
make_selector("hello")

}
\keyword{internal}
