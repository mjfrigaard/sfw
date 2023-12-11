# import testthat and shiny::testServer()
box::use(
  testthat[describe, it, expect_equal],
  shiny[testServer]
)

# import inputs module
box::use(
  app / view / inputs
)

describe("Feature: UI Component Type Verification
  As a Shiny app developer,
  I want to confirm that the UI component creation function returns the correct object type
  So that I can ensure the UI is being generated as expected.", 
  code = {
  it("Scenario: Checking the object type of the UI component
    Given a function inputs$ui for creating UI components
    When I create a UI component with id 'x' using inputs$ui
    Then the returned object should be of type 'shiny.tag.list' and 'list'", 
    code = {
    # create ui object
    ui <- inputs$ui(id = "x")
    # test class
    expect_equal(object = class(ui), 
      expected = c("shiny.tag.list", "list"))
  })
})

describe("Feature: Server Reactive Values Verification
  As a Shiny app developer,
  I want to ensure that the server function returns a list of reactive values 
  So that I can confirm the server's responsiveness to input changes.", code = {
  it("Scenario: Checking the return values of the server function
    Given a server function inputs$server for handling reactive inputs
    When I create a server object and set reactive input values as:
      | input       | value            |
      | x           | audience_score   |
      | y           | imdb_rating      |
      | z           | mpaa_rating      |
      | alpha       | 0.75             |
      | size        | 3                |
      | plot_title  | Example title    |
    And I compare the returned values from the server
    Then the returned values should match the following list:
      | key        | value            |
      | x          | audience_score   |
      | y          | imdb_rating      |
      | z          | mpaa_rating      |
      | alpha      | 0.75             |
      | size       | 3                |
      | plot_title | Example title    |", code = {
    # create server object
    testServer(app = inputs$server, expr = {
      # create list of output vals
      test_vals <- list(
        x = "audience_score",
        y = "imdb_rating",
        z = "mpaa_rating",
        alpha = 0.75,
        size = 3,
        plot_title = "Example title")
      # change inputs
      session$setInputs(x = "audience_score",
                        y = "imdb_rating",
                        z = "mpaa_rating",
                        alpha = 0.75,
                        size = 3,
                        plot_title = "Example title")
      # test class
      expect_equal(
        object = session$returned(),
        expected = test_vals
      )
   })
  })
})