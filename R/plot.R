#' Plot the distance between two functions
#'
#' @param index1 Line from
#' @param index2 Line to
#' @param df Dataframe
#' @param distance Distance
#'
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

add_annotation <- function(index1, index2, df, distance) {

  df <- as.data.frame(df)
  x1 = df[index1, 1]   # x1/x2/y1/y2 defined here for shorthand later
  x2 = df[index2, 1]
  y1 = df[index1, 2]
  y2 = df[index2, 2]

  switch (distance,
          "man" = color <- "blue",
          "euc" = color <- "red",
          "che" = color <- "green",
          "cos" = color <- "green"
  )

  list(
    ggplot2::annotate("segment", color = color, alpha = 0.5,
             x = x1, xend = x2,
             y = y1, yend = y2),

    ggplot2::annotate("text", color = color, size = 3, alpha = 0.5,
             x = (x1 + x2) / 2, y = (y1 + y2) / 2, # pos of the annotation
             label = paste(
               #   round(sqrt((x1 - x2) ^ 2 + (y1 - y2) ^ 2), digits = 1), # euclidean
               round(sapply(1:length(x2), function(i) distanceBetween(c(x1, y1), c(x2[i], y2[i]), distance = distance)), digits = 2),
               "cm")
    )
  )
}
