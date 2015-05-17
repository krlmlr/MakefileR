context("file")

test_that("Empty Makefile includes only comment", {
  makefile <- format(create_makefile())
  expect_match(makefile, "^# .* do not edit.*$")
  expect_equal(length(makefile), 1)
})
