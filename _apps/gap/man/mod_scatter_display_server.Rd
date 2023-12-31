% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mod_scatter_display.R
\name{mod_scatter_display_server}
\alias{mod_scatter_display_server}
\title{Scatter plot display module (server)}
\usage{
mod_scatter_display_server(id, var_inputs)
}
\arguments{
\item{id}{server module id}

\item{var_inputs}{returned reactive list from \code{\link[=mod_var_input_server]{mod_var_input_server()}}.}
}
\value{
rendered plot and title output from \code{\link[=scatter_plot]{scatter_plot()}}
}
\description{
Scatter plot display module (server)
}
\section{Referring to \code{var_inputs}}{

Refer to the reactive returned values from \code{mod_var_input_server()} as:
\itemize{
\item \code{var_inputs()$x}
\item \code{var_inputs()$y}
\item \code{var_inputs()$z}
\item \code{var_inputs()$alpha}
\item \code{var_inputs()$size}
\item \code{var_inputs()$plot_title}
}
}

\seealso{
Other {"scatter plot module functions"}: 
\code{\link{mod_scatter_display_ui}()}
}
\concept{{"scatter plot module functions"}}
\keyword{internal}
