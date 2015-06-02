context("def")

test_that("definitions", {
  expect_equal(format(make_def("a", "b")), "a=b")
  expect_equal(format(make_def("a", "b c")), "a=b c")
  expect_equal(format(make_def("a", "'b c'")), "a='b c'")
  expect_equal(format(make_def("a", '"b c"')), 'a="b c"')
})
