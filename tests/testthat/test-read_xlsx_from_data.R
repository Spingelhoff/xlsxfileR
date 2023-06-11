test_that("data can be read from the data directory", {
  test <- "test"
  expect_equal(
    withr::with_tempdir({
      fileR::setup_fileR_directories()
      openxlsx::write.xlsx(test, "./data/test.xlsx")
      names(as.data.frame(read_xlsx_from_data("test")))
    }),
    "test"
  )
})

test_that("data can be read from the data directory folder", {
  test <- "test"
  expect_equal(
    withr::with_tempdir({
      fileR::setup_fileR_directories()
      fileR::create_data_folder("folder")
      openxlsx::write.xlsx(test, "./data/folder/test.xlsx")
      names(as.data.frame(read_xlsx_from_data("test", folder_name = "folder")))
    }),
    "test"
  )
})
