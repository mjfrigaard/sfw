test_that("mod var input ui works", {
  ui <- mod_var_input_ui("test")
  testthat::expect_type(object = ui, type = "list")
  testthat::expect_true(is(ui, "list"))
  testthat::expect_true(is(ui, "shiny.tag.list"))
})
