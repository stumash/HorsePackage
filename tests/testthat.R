library(testthat)
library(HorsePackage)

test_check("HorsePackage")
test_that("psodds sum to 1", {
  #make sure that columns are stochastic
  expect_equal(sum(horse_info_wpsodds$psoddsFirst), 1)
  expect_equal(sum(horse_info_wpsodds$psoddsSecond), 1)
  expect_equal(sum(horse_info_wpsodds$psoddsThird), 1)
})