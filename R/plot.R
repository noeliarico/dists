#' Title
#'
#' @param index1
#' @param index2
#' @param df
#' @param distance
#'
#' @return
#'
#' @examples
plotDistance <- function(index1, index2, df, distance) {
  df <- as.data.frame(df)
  x1 = df[index1, 1]   # x1/x2/y1/y2 defined here for shorthand later
  x2 = df[index2, 1]
  y1 = df[index1, 2]
  y2 = df[index2, 2]

  # switch (distance,
  #         "manhattan" = add_annotation_manhattan(x1, x2, y1, y2),
  #         "euclidean" = add_annotation_euclidean(x1, x2, y1, y2),
  #         "chebyshev" = add_annotation_chebyshev(x1, x2, y1, y2)
  # )
}
