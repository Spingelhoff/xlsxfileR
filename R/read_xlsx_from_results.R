#' Retrieve file from 'results' directory.
#'
#' @description
#' A wrapper around `read.xlsx()` but with a pre-determined path to the results
#' directory. Sub folder is optional in 'results' directory.
#'
#' @param file_name Character input. Name of the file to be retrieved from
#' 'results' directory without file extension.
#' @param folder_name Optional. Character input. Specify sub folder in 'results'
#' directory to read from.
#' @param ... Passes arguments to `read.xlsx()`.
#'
#' @importFrom openxlsx read.xlsx
#'
#' @return File contents as an object.
#'
#' @export read_xlsx_from_results

read_xlsx_from_results <- function(file_name, folder_name = NULL, ...) {
  if(!dir.exists("results")) {
    stop("results directory does not exist")
  }
  if(!is.character(file_name)) {
    stop("file_name must be of type character")
  }
  if(!is.null(folder_name)) {
    if(!is.character(folder_name) | !is.character(file_name)) {
      stop("folder_name and file_name must be of type character")
    }
    read.xlsx(paste0("./results/", folder_name, "/", file_name, ".xlsx"), ...)
  } else {
    read.xlsx(paste0("./results/", file_name, ".xlsx"), ...)
  }
}
