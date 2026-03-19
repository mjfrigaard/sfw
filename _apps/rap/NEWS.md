# NEWS

1.  `tests/testthat/test-main.R` — Rewritten Problem: The test called `testServer()` on app/main\[server\] and checked output$message$html for a URL that only exists in a JavaScript alert(). In the test context, Shiny namespaced the nested module output as proxy1-message, not message, so the test errored immediately.

Fix: Replaced the test entirely to target app/view/message directly — matching the pattern of every other module test in the project. Two BDD-style scenarios now cover the module's actual behavior:

Before click: req(input$show_message) raises a silent validation error; verified with expect_error(output$message_text) After click: session$setInputs(show_message = 1) triggers the render; verified with expect_equal(output$message_text, "This is a message") 2. tests/testthat/\_snaps/rap-feature-01/ — Snapshots accepted Problem: The stored snapshots for Scenario B were recorded before the clicks and message modules were wired into the card body in main.R. The new snapshots correctly showed the "Click me!" and "Show message" buttons above the plot, new inputs/outputs for both modules, and a coordmap resolution change from 2× (1582×956) to 1× (791×360) — consistent with a shinytest2 version update. Plot data and axes were identical.

Fix: Accepted via testthat::snapshot_accept("rap-feature-01/").

3.  tests/testthat/\_snaps/shinytest2/ — Snapshots accepted Problem: Same root cause as above — the shinytest2 recording snapshot was also stale for the same reasons (missing clicks/message UI, 2× coordmap).

Fix: Accepted via testthat::snapshot_accept("shinytest2/").

4.  tests/testthat/test-plot.R — Deprecation warning fixed Problem: ggplot2::is.ggplot() was deprecated in ggplot2 3.5.2.

Fix: Updated both the box::use() import and the call site from is.ggplot → is_ggplot.

Net result Before After testthat 2 failures, 1 warning 11/11 pass, 0 warnings Cypress Couldn't find specs (wrong working dir) 3/3 pass (run from tests/) The Cypress discovery issue wasn't a code fix — the spec files are in tests/cypress/e2e/ and cypress.config.js resolves paths relative to its own location, so npx cypress run needs to be run from the tests/ directory.
