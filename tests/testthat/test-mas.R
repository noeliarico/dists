test_that("Example mas", {
  x <- c(0.03, 0.01, 0.00, 1.00, 0.68, 0.58, 0.44, 0.69, 0.27, 0.23, 0.31, 0.46, 0.09, 0.00, 0.02)
  y <- c(0.90, 0.96, 1.00, 0.25, 0.66, 0.80, 0.38, 0.10, 0.54, 0.22, 0.07, 0.00, 0.52, 0.64, 0.62)
  example1 <- tibble(x, y)
  example2 <- structure(c(0.02, 0, 0,
                          0.62, 1, 0.64), .Dim = 3:2, .Dimnames = list(
    NULL, c("x", "y")))
  distanceFromTo(example1, example2, distance = "mas")
})
