% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mod_var_input.R
\name{mod_var_input_server}
\alias{mod_var_input_server}
\title{Variable input module (server)}
\usage{
mod_var_input_server(id)
}
\arguments{
\item{id}{server module id}
}
\value{
reactive inputs are returned in a \code{list()}:
\itemize{
\item \code{"y" = input$y}
\item \code{"x" = input$x}
\item \code{"z" = input$z}
\item \code{"alpha" = input$alpha}
\item \code{"size" = input$size}
\item \code{"plot_title" = input$plot_title}
}

These become in the \code{var_inputs} argument in \code{\link[=mod_scatter_display_server]{mod_scatter_display_server()}}
}
\description{
Variable input module (server)
}
\seealso{
\code{\link[=mod_var_input_ui]{mod_var_input_ui()}}
}
\keyword{internal}
