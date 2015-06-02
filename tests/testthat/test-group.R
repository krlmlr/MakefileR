context("group")

test_that("groups", {
  expect_equal(
    make_group() %>%
      format,
    character())
  expect_equal(
    make_group(
      make_def("a", "b"),
      make_def("c", "d")) %>%
      format,
    c("a=b", "c=d"))
  expect_equal(
    make_group(
      make_def("a", "b"),
      .dots = list(make_def("c", "d"))) %>%
      format,
    c("a=b", "c=d"))
  expect_equal(
    make_group(
      make_def("a", "b"),
      .dots = list(make_def("c", "d")),
      sep = "") %>%
      format,
    c("a=b", "", "c=d"))
  expect_equal(
    make_group(
      make_comment("initial"),
      make_def("a", "b"),
      .dots = list(make_def("c", "d"))) %>%
      format,
    c("# initial", "a=b", "c=d"))
})

test_that("group of groups", {
  expect_equal(
    make_group(
      make_group(make_comment("a")),
      make_group(make_comment("b"), make_comment("c")),
      sep = ""
    ) %>%
      format,
    c("# a", "", "# b", "# c"))
})
