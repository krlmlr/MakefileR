context("rule")

test_that("target-only rule", {
  expect_equal(format(create_make_rule(".FORCE")), ".FORCE:")
  expect_equal(format(create_make_rule("target", script = "false")),
               c("target:", "\tfalse"))
})
