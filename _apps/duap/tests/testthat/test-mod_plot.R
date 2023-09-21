test_that("module ui works", {
  ui <- mod_display_plot_ui(id = "test")
  # check list
  testthat::expect_type(object = ui, type = "list")
  testthat::expect_true(is(ui, "list"))
  testthat::expect_true(is(ui, "shiny.tag.list"))
  # check structure
  testthat::expect_equal(object = ui,
    expected = structure(
      list(
        structure(list(
          name = "br",
          attribs = structure(list(), names = character(0)),
          children = list()
        ), class = "shiny.tag"),
        structure(
          list(
            name = "blockquote",
            attribs = structure(list(), names = character(0)),
            children = list(structure(
              list(
                name = "em",
                attribs = structure(list(), names = character(0)),
                children = list(structure(
                  list(
                    name = "h6",
                    attribs = structure(list(), names = character(0)),
                    children = list(
                      "The code for this application comes from the ",
                      structure(list(
                        name = "a",
                        attribs = list(href = "https://rstudio-education.github.io/shiny-course/"),
                        children = list("Building web applications with Shiny")
                      ), class = "shiny.tag"),
                      "tutorial"
                    )
                  ), class = "shiny.tag"
                ))
              ), class = "shiny.tag"
            ))
          ),
          class = "shiny.tag"
        ),
        structure(list(
          name = "div",
          attribs = list(
            id = "test-scatterplot",
            class = "shiny-plot-output",
            style = "width:100%;height:400px;",
            class = "html-fill-item"
          ),
          children = list()
        ), class = "shiny.tag")
      ),
      names = c("",
        "", ""),
      class = c("shiny.tag.list", "list")
    ))
})

testServer(
  mod_display_plot_server,
  # Add here your module params
  args = list(

  ), {
    ns <- session$ns
    expect_true(
      inherits(ns, "function")
    )
    expect_true(
      grepl(id, ns(""))
    )
    expect_true(
      grepl("test", ns("test"))
    )

    # Here are some examples of tests you can
    # run on your module
    # - Testing the setting of inputs
    # session$setInputs(x = 1)
    # expect_true(input$x == 1)
    # - If ever your input updates a reactiveValues
    # - Note that this reactiveValues must be passed
    # - to the testServer function via args = list()
    # expect_true(r$x == 1)
    # - Testing output
    # expect_true(inherits(output$tbl$html, "html"))
})
