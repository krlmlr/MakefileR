#' Creates a group of Makefile items
#'
#' Helps separating similar rules and definition.
#'
#' @param ... Rules created by \code{\link{make_rule}}
#' @param .dots A list rules in addition to \code{...}
#' @param sep Separator between group items, \code{NULL} (the default) means
#'   no separator.
#'
#' @examples
#' makefile(make_rule("all", c("first_target", "second_target")))
#'
#' @references \url{https://www.gnu.org/software/make/manual/}
#'
#' @export
make_group <- function(..., .dots = NULL, sep = NULL) {
  rules <- c(list(...), .dots)
  if (!all(vapply(rules, inherits, logical(1), "MakefileR"))) {
    stop("All members of the group must inherit from class MakefileR")
  }
  structure(list(rules = rules, sep = sep),
            class = c("MakefileR_group", "MakefileR"))
}

#' @export
format.MakefileR_group <- function(x, ...) {
  lapply(x$rules, format) %>%
    Reduce(
      f = function(y, z) c(y, if (length(y) == 0L) NULL else x$sep, z),
      init = character())
}

#' @export
c.MakefileR_group <- function(..., recursive = FALSE) {
  rules = list(...)
  first_rule <- rules[[1L]]
  other_rules <- rules[-1L]
  structure(
    make_group(.dots = c(first_rule$rules, other_rules), sep = first_rule$sep),
    class = class(first_rule)
  )
}
