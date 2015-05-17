context("file")

test_that("Empty Makefile includes only comment", {
  makefile <- format(create_makefile())
  expect_match(makefile, "^# .*$")
  expect_equal(length(makefile), 1)
})
