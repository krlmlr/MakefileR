context("file")

test_that("Empty Makefile includes only comment", {
  makefile <- format(create_makefile())
  expect_match(makefile, "^# .* do not edit.*$")
  expect_equal(length(makefile), 1)
})

test_that("Printing works as expected", {
  with_mock(
    cat = identity,
    makefile <- print(create_makefile()))
  expect_match(makefile, "^# .* do not edit.*\n$")
  expect_equal(length(makefile), 1)
})
