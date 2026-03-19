box::use(
  shiny[testServer],
  testthat[describe, it, expect_error, expect_equal],
)
box::use(
  app/view/message,
)

describe("Feature: Message module server output
  As a Shiny app developer,
  I want to verify the message server renders text after a button click
  So that I can confirm the module responds correctly to user interaction.",
  code = {

  it("Scenario: Message is hidden before button click
    Given the message server is initialized
    Then req() should suppress output$message_text before any interaction",
    code = {
    testServer(app = message$server, expr = {
      # req(input$show_message) raises a silent validation error when
      # the button hasn't been clicked yet
      expect_error(output$message_text)
    })
  })

  it("Scenario: Message appears after button click
    Given the message server is initialized
    When the 'Show message' button is clicked
    Then output$message_text should equal 'This is a message'",
    code = {
    testServer(app = message$server, expr = {
      session$setInputs(show_message = 1)
      expect_equal(output$message_text, "This is a message")
    })
  })

})
