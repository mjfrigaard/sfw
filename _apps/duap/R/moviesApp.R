#' moviesApp (demo)
#'
#' @return shiny app
#' @export moviesApp
#'
#' @import shiny
moviesApp <- function() {
  shinyApp(
    ui = fluidPage(
      sidebarLayout(
        sidebarPanel(
          mod_var_input_ui("vars")
        ),
        mainPanel(
          mod_display_plot_ui("plot")
        )
      )
    ),
    server = function(input, output, session) {

      selected_vars <- mod_var_input_server("vars")

      mod_display_plot_server("plot", var_inputs = selected_vars)
    }
  )
}
