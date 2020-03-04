data("toy_data1")

test_that("Manhattan works toy_data1", {

  d <- distance(toy_data1, "man")

  expect_equivalent(d[1,], c(0, 3, 4, 7, 5))
  expect_equivalent(d[2,], c(3, 0, 7, 6, 8))
  expect_equivalent(d[3,], c(4, 7, 0, 11, 3))
  expect_equivalent(d[4,], c(7, 6, 11, 0, 12))
  expect_equivalent(d[5,], c(5, 8, 3, 12, 0))

})
