library(shinytest2)

test_that("{shinytest2} recording: feature-01", {
  app <- AppDriver$new(name = "feature-01", height = 716, width = 1085)
  app$set_inputs(`app-vals-y` = "imdb_num_votes")
  app$set_inputs(`app-vals-x` = "critics_score")
  app$set_inputs(`app-vals-z` = "genre")
  app$set_inputs(`app-vals-alpha` = 0.7)
  app$set_inputs(`app-vals-size` = 3)
  app$set_inputs(`app-vals-plot_title` = "New ")
  app$set_inputs(`app-vals-plot_title` = "New plot")
  app$set_inputs(`app-vals-plot_title` = "New plot title")
  app$expect_values()
})
