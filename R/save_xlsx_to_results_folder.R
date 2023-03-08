#' Pipeable function that saves the object passed in as a csv in the results
#' directory
#'
#' @description
#' A wrapper around `write.xlsx()` but with a pre-determined path to
#' a folder in the 'results' directory. Will force sub folder path/creation in
#' 'results' directory.
#'
#' @param x Object to be saved and invisibly returned.
#' @param folder_name Character input. 'results' sub folder name.
#' @param file_name Character input. Name of the csv file without the file
#' extension.
#' @param ... Passes arguments into `write.xlsx()`
#'
#' @returns Invisibly returns the object 'x' that was passed in.
#'
#' @export save_xlsx_to_results_folder

save_xlsx_to_results_folder <- function(x, folder_name, file_name, ...) {
  if(!dir.exists("results")) {
    stop("results directory does not exist")
  }
  if(!is.character(folder_name) | !is.character(file_name)) {
    stop("folder_name and file_name must be of type character")
  }
  if(!dir.exists(paste0("./results/", folder_name))) {
    dir.create(paste0("./results/", folder_name))
  }
  openxlsx::write.xlsx(x, paste0("./results/", folder_name, "/", file_name, ".xlsx"), ...)
  invisible(x)
}
