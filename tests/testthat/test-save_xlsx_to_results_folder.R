test_that("data is saved correctly", {
  test <- "test"
  expect_equal(
    withr::with_tempdir({
      fileR::setup_fileR_directories()
      save_xlsx_to_results_folder(test, "test", "test")
      names(openxlsx::read.xlsx("results/test/test.xlsx"))
    }),
    "test"
  )
})

test_that("object passed in is returned invisibly", {
  test <- "test"
  expect_invisible(
    withr::with_tempdir({
      fileR::setup_fileR_directories()
      save_xlsx_to_results_folder(test, "test", "test")
    })
  )
})

test_that("object returned is not altered", {
  test <- "test"
  expect_equal(
    withr::with_tempdir({
      fileR::setup_fileR_directories()
      save_xlsx_to_results_folder(test, "test", "test")
      names(openxlsx::read.xlsx("results/test/test.xlsx"))
    }),
    test
  )
})
