test_that("multiple files are read properly from inside data directory", {
  a <- "a"
  b <- "b"
  c <- "c"
  result <- list(
    `a.xlsx` = data.frame(a = logical()),
    `b.xlsx` = data.frame(b = logical()),
    `c.xlsx` = data.frame(c = logical())
  )
  expect_equal(
    withr::with_tempdir({
      fileR::setup_fileR_directories()
      openxlsx::write.xlsx(a, "data/a.xlsx")
      openxlsx::write.xlsx(b, "data/b.xlsx")
      openxlsx::write.xlsx(c, "data/c.xlsx")
      read_all_xlsx_from_data()
    }),
    result
  )
})
