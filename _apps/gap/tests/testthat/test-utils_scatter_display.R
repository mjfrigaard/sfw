describe(
  "Feature: Scatter plot data visualization
       As a film data analyst
       I want to explore movie review data from IMDB & Rotten Tomatoes
       So that I can analyze relationships between movie reivew variables
  
    Background:
          Given I have data with IMDB & Rotten Tomatoes movie reviews
          And the data contains continuous variables like 'Audience Score'
          And the data contains categorical variables like 'MPAA Rating'",
  code = {
        it(
          "Scenario: Create scatter plot
              Given I have launched the movie review exploration app,
              When the scatter plot renders,
              Then the points on the x axis should represent 'IMDB Rating'
              And the points on the y axis should represent 'Audience Score'
              And the points should be colored by 'MPAA' rating
              And the opacity of the points should be set to '0.5'
              And the size of the points should be set to '2'
              And the plot title should be set to 'Enter plot title'",
          code = {
            test_logger(start = "data", msg = "movies.rda")
            # inputs
            scatter_inputs <- list(y = 'audience_score', 
                                   x = 'imdb_rating',
                                   z = 'mpaa_rating',
                                   alpha = 0.5,
                                   size = 2,
                                   plot_title = 'Enter plot title')

            app_graph <- scatter_plot(movies,
              x_var = scatter_inputs$x,
              y_var = scatter_inputs$y,
              col_var = scatter_inputs$z,
              alpha_var = scatter_inputs$alpha,
              size_var = scatter_inputs$size
            )
            expect_true(ggplot2::is.ggplot(app_graph))

            test_logger(end = "data", msg = "movies.rda")
        })
})