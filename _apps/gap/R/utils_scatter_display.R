#' scatter plot utility function
#'
#' @description A utils function
#'
#' @param df *(data.frame)* The dataset containing the variables to plot.
#' @param x_var *(character)* Name of the variable for the x-axis.
#' @param y_var *(character)* Name of the variable for the y-axis.
#' @param col_var *(character)* Name of the variable for the color aesthetic.
#' @param alpha_var *(numeric)* Transparency level of points (0 to 1).
#' @param size_var *(numeric)* Size of points.
#'
#' @return The return value, if any, from executing the utility.
#'
#' @rdname scatter_plot
#'
#' @importFrom rlang .data
#'
#' @export
#'
scatter_plot <- function(df, x_var, y_var, col_var, alpha_var, size_var) {
    ggplot2::ggplot(data = df,
      ggplot2::aes(x = .data[[x_var]],
          y = .data[[y_var]],
          color = .data[[col_var]])) +
      ggplot2::geom_point(alpha = alpha_var, size = size_var)
}
