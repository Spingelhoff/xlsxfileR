test_that("data can be read from the results directory", {
  test <- "test"
  expect_equal(
    withr::with_tempdir({
      fileR::setup_fileR_directories()
      openxlsx::write.xlsx(test, "./results/test.xlsx")
      names(as.data.frame(read_xlsx_from_results("test")))
    }),
    "test"
  )
})

test_that("data can be read from the results directory folder", {
  test <- "test"
  expect_equal(
    withr::with_tempdir({
      fileR::setup_fileR_directories()
      fileR::create_results_folder("folder")
      openxlsx::write.xlsx(test, "./results/folder/test.xlsx")
      names(as.data.frame(read_xlsx_from_results("test", folder_name = "folder")))
    }),
    "test"
  )
})
