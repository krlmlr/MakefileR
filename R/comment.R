#' Creates a Makefile comment
#'
#' For helping the reader understand what's happening
#'
#' Use the
#' \code{\link[base]{c}} function or the \code{\link[base]{+}} operator
#' to append comments to groups and Makefiles.
#'
#' @param ... Character vector(s) without leading hash \code{#}
#' @return An object of class \code{MakefileR_comment}
#' @family items
#'
#' @examples
#' make_comment("This is a comment")
#'
#' @references \url{https://www.gnu.org/software/make/manual/}
#'
#' @export
make_comment <- function(...) {
  structure(list(comment = c(...)),
            class = c("MakefileR_comment", "MakefileR"))
}

#' @export
format.MakefileR_comment <- function(x, ...) {
  paste("#", x$comment)
}
