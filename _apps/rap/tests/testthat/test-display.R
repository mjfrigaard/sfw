# import testthat and shiny::testServer()
box::use(
  testthat[...],
  shiny[testServer, reactive]
)

# import inputs and display modules
box::use(
  app / view / inputs,
  app / view / display
)

describe("Feature: UI Component Object Type Verification
  As a Shiny app developer,
  I want to confirm the dispaly UI returns an object of the correct type
  So that I can be assured of the UI's proper structure and functionality.", 
  code = {
it("Scenario: Checking the object type returned by the display$ui function
  Given a UI creation function display$ui
  When I create a UI component with id 'y' using display$ui
  Then the returned object should be of type 'shiny.tag.list' and 'list'", 
    code = {
  # create ui object
  ui <- display$ui(id = "y")
  # test class
  expect_equal(object = class(ui), 
    expected = c("shiny.tag.list", "list"))
  })
})

describe("Feature: Server Acceptance of Reactive Values
  As a Shiny app developer,
  I want to verify that the display server can accept a list of reactive values
  So that I can ensure the interactive elements of the app respond as expected.", code = {
  it("Scenario: Confirming the server's handling of reactive input values
    Given a server function display$server for processing reactive inputs
    When I test the server with a list of reactive inputs:
      | input      | value            |
      | x          | critics_score    |
      | y          | imdb_rating      |
      | z          | mpaa_rating      |
      | alpha      | 0.5              |
      | size       | 2                |
      | plot_title | Enter Plot Title |
    Then the server should correctly receive and process the reactive inputs
    And the inputs received by the server should match the specified values", code = {
    # test inputs to display$server
    testServer(
      app = display$server,
      args = list(
        # include list of reactive inputs
        var_inputs =
          reactive(
            list(
                 x = "critics_score",
                 y = "imdb_rating",
                 z = "mpaa_rating",
                 alpha = 0.5,
                 size = 2,
                 plot_title = "Enter Plot Title"
                )
            )
      ),
      expr = {
        expect_equal(
          # test against input reactive list
          object = inputs(),
          expected = list(
            x = "critics_score",
            y = "imdb_rating",
            z = "mpaa_rating",
            alpha = 0.5,
            size = 2,
            plot_title = "Enter Plot Title"
          )
        )
    })
  })
})

describe("confirm server output is expected object from plotOutput()", code = {
  it("test output from display$server", code = {
    testServer(
      app = display$server,
      args = list(
        # include list of reactives 
        var_inputs =
          reactive(
            list(
                 x = "critics_score",
                 y = "imdb_rating",
                 z = "mpaa_rating",
                 alpha = 0.5,
                 size = 2,
                 plot_title = "Enter Plot Title"
                )
            )
      ), 
      expr = {
        # test is list
      expect_true(
        object = is.list(output$scatterplot))
        # test for names in output$scatterplot
      expect_equal(
        object = names(output$scatterplot),
        expected = c("src", "width", "height", "alt", "coordmap"))
        # test for 'alt'
      expect_equal(
        object = output$scatterplot[["alt"]],
        expected = "Plot object")
    })
  })
})