#' Get paths to `health` raw data
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#' `raw_data()` returns the raw data paths of the `health` package.
#'
#' @param type (optional) a string indicating the file type of the raw data
#'   (default: `NULL`).
#' @param file (optional) a `character` object indicating the file name(s) of
#'   the raw data (default: `NULL`).
#'
#' @return
#'
#' * If `type = NULL`, a `character` object with all file type names
#'   available.
#' * If `type != NULL` and `file = NULL`, a `character` object with all file
#' names available from type.
#' * If `type != NULL` and `file != NULL`, a `character` with the file name(s)
#' path.
#'
#' @family utility functions
#' @export
#'
#' @examples
#' \dontrun{
#' raw_data()
#' }
raw_data <- function(type = NULL, file = NULL) {
    package <- "health"
    choices <- list.files(system.file("extdata", package = package))

    checkmate::assert_choice(type, choices, null.ok = TRUE)
    checkmate::assert_character(file, min.len = 1, null.ok = TRUE)

    if (is.null(type) && is.null(file)) {
        list.files(system.file("extdata", package = package))
    } else if (!is.null(type) && is.null(file)) {
        list.files(system.file("extdata", type, package = package))
    } else if (!is.null(type) && !is.null(file)) {
        system.file("extdata", type, file, package = package,
                    mustWork = TRUE)
    } else if (is.null(type) && !is.null(file)) {
        stop("When 'file' is assigned, the 'type' argument cannot be 'NULL'.",
             call. = FALSE)
    }
}
