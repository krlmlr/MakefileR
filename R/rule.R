#' Creates a Makefile rule
#'
#' A rule in a \code{Makefile} consists of a (list of) targets which may
#' depend on one or more dependencies each.  Optionally, a script is executed to
#' create the target.  Generally, multiple targets mean that the rule is
#' identical for each of the individual targets, and multiple dependencies mean
#' that \emph{all} of them are required to build \emph{each} of the targets.
#' In the script, the target can be referenced by \code{$@@}, and the first
#' dependency can be referenced by \code{$<}.  Note that the dollar sign has a
#' special meaning in a \code{Makefile}, use \code{$$} in scripts that need
#' to use the dollar sign themselves.
#'
#' @param target Target names as a character vector
#' @param deps Dependency names as a character vector
#' @param script A script to execute to build the targets.
#'
#' @examples
#' create_make_rule("all", c("first_target", "second_target"))
#' create_make_rule(".FORCE")
#' create_make_rule("first_target", ".FORCE", "echo 'Building first target'")
#' create_make_rule("second_target", "first_target",
#'  c("echo 'Building second target'", "echo 'Done'"))
#'
#' @references \url{https://www.gnu.org/software/make/manual/}
#'
#' @export
create_make_rule <- function(targets, deps = NULL, script = NULL) {
  structure(
    list(
      targets = targets,
      deps = deps,
      script = script
    ),
    class = "MakefileR_rule")
}

#' @export
format.MakefileR_rule <- function(x, ...) {
  c(
    sprintf("%s: %s", combine_targets(x$targets), combine_targets(x$deps)),
    paste0("\t", x$script)
  )
}

#' @export
print.MakefileR_rule <- function(x, ...) {
  cat(paste(format(x), collapse = "\n"))
}

combine_targets <- function(targets) {
  paste(targets, collapse = " ")
}
