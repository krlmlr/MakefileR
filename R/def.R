#' Creates a variable definition in a Makefile
#'
#' A variable definition in a \code{Makefile} consists of a variable name
#' and its defition.  Both are separated by the equality sign \code{=}.
#'
#' @inheritParams append_make_def
#'
#' @examples
#' create_make_def("R_USER_LIBRARY", .libPaths()[[1L]])
#'
#' @references \url{https://www.gnu.org/software/make/manual/}
#'
#' @export
create_make_def <- function(variable, definition) {
  if (length(variable) != 1) {
    stop("variable must be an atomic character value")
  }
  if (length(definition) != 1) {
    stop("definition must be an atomic character value")
  }
  structure(
    list(
      variable = variable,
      definition = definition
    ),
    class = "MakefileR_def")
}

#' Appends a Makefile variable definition to a Makefile
#'
#' This helper function creates a variable definition and appends it to an
#' existing Makefile.
#' Most useful in pipes.
#'
#' @param makefile A Makefile created by \code{\link{create_makefile}}
#' @param variable Variable name
#' @param definition Definition for this variable
#' @return The first parameter, with the newly created rule appended
#' @seealso \code{\link{create_make_def}}, \code{\link{create_makefile}}
#'
#' @examples
#' library(magrittr)
#' create_makefile() %>%
#'   append_make_def("R_USER_LIBRARY", .libPaths()[[1L]])
#'
#' @export
append_make_def <- function(variable, definition) {
  c(makefile, append_make_def(variable = variable, definition = definition))
}

#' @export
format.MakefileR_def <- function(x, ...) {
  sprintf("%s=%s", x$variable, x$definition)
}

#' @export
print.MakefileR_def <- function(x, ...) {
  cat(paste0(format(x), "\n"), sep = "")
}
