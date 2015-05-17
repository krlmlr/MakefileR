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
  expect_error(create_make_rule(character()), "target.*required")
})

test_that("appending rules", {
  rules <- list(
    create_make_rule(".FORCE"),
    create_make_rule("a", "b")
  )
  expect_equal(create_makefile(.dots = rules),
               Reduce(c, rules, init = create_makefile()))
  expect_equal(create_makefile(.dots = rules),
               create_makefile() %>%
                 append_make_rule(".FORCE") %>%
                 append_make_rule("a", "b"))
})

test_that("Printing works as expected", {
  with_mock(
    cat = identity,
    rule <- print(create_make_rule("a", "b", "true")))
  expect_equal(rule, c("a: b\n", "\ttrue\n"))
})
