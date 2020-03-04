#' Four points tied considered different distance functions from 5,5
#'
#' Manhattan: (4, 5), (5, 4), (5, 6), (6, 5)
#' Euclidean: (4, 5), (5, 4), (5, 6), (6, 5)
#' Chebyshev: (4, 4), (4, 6), (6, 4), (6, 6)
#'
#' Neyman distance:
#'
# tied_data <- tribble(~x, ~y,
#                      5, 5,
#                      4, 5,
#                      5, 4,
#                      5, 6,
#                      6, 5,
#                      4, 4,
#                      4, 6,
#                      6, 4,
#                      6, 6)
#
# ggplot(tied_data, aes(x, y)) +
#   geom_point() +
#   coord_fixed()
