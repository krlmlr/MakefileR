context("rule")

test_that("target-only rule", {
  expect_equal(format(create_make_rule(".FORCE")), ".FORCE:")
  expect_equal(format(create_make_rule("target", script = "false")),
               c("target:", "\tfalse"))
})

test_that("target-dep rule", {
  expect_equal(format(create_make_rule("a", c("b", "c"))), "a: b c")
  expect_equal(format(create_make_rule("a", "b", c("true", "false"))),
               c("a: b", "\ttrue", "\tfalse"))
})
