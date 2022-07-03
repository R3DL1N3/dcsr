#' Dedicated Server is Installed
#'
#' Success depends on multiple factors:
#' \itemize{
#'   \item the existence of the correctly installed folders; and
#'   \item the presence and correct formatting of the installation's
#'     \code{autoupdate.cfg} JSON file;
#'   \item the modules array must include the token \code{DEDICATED_SERVER}.
#' }
#'
#' @return logical; \code{TRUE} if installed and configured as a dedicated
#'   server, \code{FALSE} if not installed or not installed with the dedicated
#'   server module
#' @export
dedicated_server.is_installed <- function() {
  tryCatch(cfg.is_dedicated_server(), error = function(e) FALSE)
}
