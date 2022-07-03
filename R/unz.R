#' Unzip File to Raw Vectors
#'
#' Automatically filters out members with file names ending with a forward
#' slash. Trailing slash denotes a sub-directory.
#'
#' @param zipfile Path of zip file
#' @return List of raw vectors by zip member name
#' @export
unzip_bin <- function(zipfile) {
  ziplist <- zip::zip_list(zipfile)
  dir <- tempdir()
  filename <- ziplist$filename[!grepl("/$", ziplist$filename)]
  bin <- lapply(filename, function(filename) {
    zip::unzip(zipfile, filename, junkpaths = TRUE, exdir = dir)
    junk <- file.path(dir, basename(filename))
    on.exit(unlink(junk))
    xfun::read_bin(junk)
  })
  names(bin) <- filename
  bin
}
