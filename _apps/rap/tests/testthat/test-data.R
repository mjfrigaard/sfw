# import testthat 
box::use(
  testthat[describe, it, 
           expect_equal, expect_true]
)
# import data module
box::use(
  app / logic / data
)

describe(description = "Feature: Movies Data Dimensions Verification
  As a data analyst,
  I want to ensure the movies data frame has the correct dimensions
  So that I can rely on its structure for further analysis.", 
  code = {
  it(description = "Scenario: Checking the dimensions of the movies data frame
    Given a function to import movies data
    When I call the function to retrieve the movies data
    Then the data frame should have 651 rows and 34 columns
    And the data frame should be of type 'data.frame'", 
    code = {
    # call function to import movies data
    movies <- data$movies_data()
    # test dimensions
    expect_equal(
      object = dim(movies), 
      expected = c(651L, 34L))
    # test class
    expect_true(object = is.data.frame(movies))
  })
})

describe("Feature: Numeric Variables Presence in Movies Data
  As a data analyst,
  I want to verify that specific numeric variables are present in the movies data
  So that I can perform accurate numerical analysis.", 
  code = {
it("Scenario: Confim numeric variables are in the movies data
    Given a function to import movies data
    When I call the function to retrieve the movies data
    Then the data frame should contain the following numeric variables:
    | imdb_rating | imdb_num_votes | critics_score | audience_score | runtime |",
  code = {
  # call function to import movies data
  movies <- data$movies_data()
  num_vars <- c("imdb_rating", "imdb_num_votes", 
                "critics_score", "audience_score", 
                "runtime")
  expect_true(object = all(num_vars %in% names(movies)))
  })
})

describe("Feature: Categorical Variables Presence in Movies Data
  As a data analyst,
  I want to verify that specific categorical variables are present in the movies data
  So that I can perform accurate categorical analysis.", 
  code = {
it("Scenario: Ensuring categorical variables are in the movies data frame
    Given a function to import movies data
    When I call the function to retrieve the movies data
    Then the data frame should contain the following categorical variables:
      | title_type | genre | mpaa_rating | critics_rating | audience_rating |",
  code = {
  # call function to import movies data
  movies <- data$movies_data()
  color_vars <- c("title_type", "genre", 
                  "mpaa_rating", "critics_rating", 
                  "audience_rating")
  expect_true(object = all(color_vars %in% names(movies)))
  })
})