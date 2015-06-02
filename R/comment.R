#' Creates a Makefile comment
#'
#' For helping the reader understand what's happening
#'
#' @param comment A character vector without leading hash \code{#}
#'
#' @examples
#' make_comment("This is a comment")))
#'
#' @references \url{https://www.gnu.org/software/make/manual/}
#'
#' @export
make_comment <- function(comment = NULL) {
  structure(list(comment = comment),
            class = c("MakefileR_comment", "MakefileR"))
}

#' @export
format.MakefileR_group <- function(x, ...) {
  paste("#", x$comment)
}
