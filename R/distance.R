#' Distance
#'
#' @param data
#' @param distance
#'
#' @return A matrix of distances
#'
#' @export
#'
#' @examples
#'
#' @useDynLib dists distance
distance <- function(data, distance = "euc") {

  data <- as.matrix(data)
  m <- as.double(matrix(sample(1:10, 6), ncol = 3))

  distance <- .C("distance",
                 distance = getCodeDistance(distance), # numeric code of the distance function
                 data = as.double(data), # dataset in compatible type
                 ncol = ncol(data),     # total number of variables of the dataset
                 nrow = nrow(data),     # total number of objects of the dataset
                 x = as.integer(0),        # index of the first object
                 y = as.integer(4),        # index of the second object
                 result = as.double(-1)) #double *result

  class(distance) <- "distance"
  return(distance)
}


#' Title
#'
#' @param x
#' @param y
#' @param distance
#'
#' @return
#' @export
#'
#' @examples
distanceBetween <- function(x, y, distance = "euc") {

  print("Return the distance between two points")

  distance <- -1
  class(distance) <- "distance"
  return(distance)
}

#' Title
#'
#' @param x
#' @param y
#' @param distance
#'
#' @return
#' @export
#'
#' @examples
getCodeDistance <- function(distanceName) {

  distanceLetters <- unlist(strsplit(distanceName, ""))

  #TODO Check the length of the code is three
  if(length(distanceLetters) != 3)
    stop("The distance must be identified by a three letters name")

  #TODO Check the values are all lower case letters

  distanceLetters <- sapply(distanceLetters, utf8ToInt)

  return(paste0((distanceLetters - 97), collapse = ""))
}

format.distance <- function(distance) {
  return(as.numeric(distance))
}

print.distance <- function(distance) {
  out <- format(distance)
  cat(out)
  invisible(out)
}
