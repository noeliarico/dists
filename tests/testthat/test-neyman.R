test_that("Neyman works toy_data1", {

  d <- round(distance(toy_data1, "ney"), 6)

  expect_equivalent(d[1,], c(0, 2.236068, 3.162278, 6.082763, 3.605551))
  expect_equivalent(d[2,], c(2.236068, 0, 5.385165, 5.099020, 5.656854))
  expect_equivalent(d[3,], c(3.162278, 5.385165, 0, 8.062258, 2.236068))
  expect_equivalent(d[4,], c(6.082763, 5.099020, 8.062258, 0, 9.486833))
  expect_equivalent(d[5,], c(3.605551, 5.656854, 2.236068, 9.486833, 0))

})
