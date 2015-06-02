#' Creates a Makefile comment
#'
#' For helping the reader understand what's happening
#'
#' @param ... Character vector(s) without leading hash \code{#}
#'
#' @examples
#' make_comment("This is a comment")))
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
