library(HorsePackage)

context("Test all functions")

test_that("generate odds", {
  expect_equal(generate_psodds(horse_info)[1,5], 0.02415113) 
})

test_that("exacta", {
  expect_equal(exacta(horse_info, c('Nyquist', 'Lani')), 0.01451113)
})

test_that("trifecta", {
  expect_equal(trifecta(horse_info, c('Nyquist', 'Lani', 'Destin')), 0.001095392)
})

test_that("box", {
  expect_equal(box(horse_info, c('Nyquist', 'Lani', 'Destin')), 0.00431156)
})

test_that("show_bet", {
  expect_equal(show_bet(horse_info, 'Nyquist'), 0.7629026)
})