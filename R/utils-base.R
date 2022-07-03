stopifnot.dir.exists <- function(x, ...) {
  stopifnot(dir.exists(x, ...))
  x
}
