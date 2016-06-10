library(HorsePackage)

context("Test all functions")

test_that("generate psodds", {
  expect_equal(generate_psodds(horse_info_wpsodds)[1,5], 0.02415113) 
})

test_that("exacta", {
  expect_equal(exacta(horse_info_wpsodds, c('Nyquist', 'Lani')), 0.01451113)
})

test_that("trifecta", {
  expect_equal(trifecta(horse_info_wpsodds, c('Nyquist', 'Lani', 'Destin')), 0.001095392)
})

test_that("box", {
  expect_equal(box(horse_info_wpsodds, c('Nyquist', 'Lani', 'Destin')), 0.00431156)
})