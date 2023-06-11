test_that("multiple files are read properly from inside results directory", {
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
      openxlsx::write.xlsx(a, "results/a.xlsx")
      openxlsx::write.xlsx(b, "results/b.xlsx")
      openxlsx::write.xlsx(c, "results/c.xlsx")
      read_all_xlsx_from_results()
    }),
    result
  )
})
