#' Retrieve file from data directory
#'
#' @description
#' A wrapper around `read.xlsx()` but with a pre-determined path to the data
#' directory. Sub folder is optional in data directory. If a folder is
#' specified but does not currently exist, the function will create that
#' folder.
#'
#' @param file_name Character input. Name of the file to be retrieved from
#' 'data' directory without file extension.
#' @param folder_name Optional. Character input. Specify sub folder in 'data'
#' directory to read from.
#' @param ... Passes arguments into `read.xlsx()`.
#'
#' @importFrom openxlsx read.xlsx
#'
#' @return File contents as an object.
#'
#' @export read_xlsx_from_data

read_xlsx_from_data <- function(file_name, folder_name = NULL, ...) {
  if(!dir.exists("data")) {
    stop("data directory does not exist")
  }
  if(!is.character(file_name)) {
    stop("file_name must be of type character")
  }
  if(!is.null(folder_name)) {
    if(!is.character(folder_name) | !is.character(file_name)) {
      stop("folder_name and file_name must be of type character")
    }
    openxlsx::read.xlsx(paste0("./data/", folder_name, "/", file_name, ".xlsx"), ...)
  } else {
    openxlsx::read.xlsx(paste0("./data/", file_name, ".xlsx"), ...)
  }
}
