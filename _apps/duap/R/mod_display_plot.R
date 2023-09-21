#' Plot variables UI module
#'
#' @param id module id
#'
#' @return shiny UI module
#'
mod_display_plot_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotOutput(outputId = ns("scatterplot")),
    tags$br(),
    tags$blockquote(
      tags$em(
        tags$h6("The data for this application comes from the ",
        tags$a("Building web applications with Shiny",
          href = "https://rstudio-education.github.io/shiny-course/"),
                      "tutorial")))
  )
}

#' Plot variables Server module
#'
#' @param id module id
#' @param var_inputs inputs from mod_var_input
#'
#' @return shiny server module
#'
mod_display_plot_server <- function(id, var_inputs) {

  moduleServer(id, function(input, output, session) {

    inputs <- reactive({
      plot_title <- tools::toTitleCase(var_inputs()$plot_title)
      list(
        x = var_inputs()$x,
        y = var_inputs()$y,
        z = var_inputs()$z,
        alpha = var_inputs()$alpha,
        size = var_inputs()$size,
        plot_title = plot_title
      )
    })

    output$scatterplot <- renderPlot({
      plot <- point_plot(
        df = movies,
        x_var = inputs()$x,
        y_var = inputs()$y,
        col_var = inputs()$z,
        alpha_var = inputs()$alpha,
        size_var = inputs()$size
      )
      plot +
        ggplot2::labs(
          title = inputs()$plot_title,
          x = stringr::str_replace_all(tools::toTitleCase(inputs()$x), "_", " "),
          y = stringr::str_replace_all(tools::toTitleCase(inputs()$y), "_", " ")
        ) +
        ggplot2::theme_minimal() +
        ggplot2::theme(legend.position = "bottom")
    })
  })
}
