#' Distance
#'
#' @param data
#' @param distance the three-letters name of the distance function chosen
#' to calculate the distance between the objects of the dataset. Codes:
#' - Manhattan distance (man):
#' - Euclidean distance (euc):
#' - Chebyshev distance (che):
#'
#' @return A matrix containing the distance between all the objects of the
#' dataset calculating with the chosen distance function.
#'
#' @export
#'
#' @examples
#'
#' @useDynLib dists distance
distance <- function(data, distance = "euc") {

  n <- rownames(data)
  if(is.null(n) || !any(is.na(as.numeric(n))))
    n <- paste0("x", 1:nrow(data))

  data <- matrix(data, ncol = ncol(data))

  distances <- outer(1:nrow(data), 1:nrow(data),
                    dbv, data = data,  distance = distance)

  colnames(distances) <- n
  rownames(distances) <- n
  class(distance) <- c("distance")
  return(distances)
}


#' Calculates the distance between two vector of the same length using the
#' chosen distance function.
#'
#' @param x first vector
#' @param y second vector
#' @param distance distance function used to calculate the distance between the
#' vectors.
#'
#' @return A positive number that is the distance between the two vectors
#'
#' @examples
#' # Uses the default distance function: Euclidean distance
#' distanceBetween(c(1, 2, 3), c(3, 2, 1))
#'
#' @export
distanceBetween <- function(x, y, distance = "euc") {

  #TODO check that both vectors hace the same length
  data <- matrix(c(x, y), byrow = TRUE, ncol = length(x))
  distance <- db(1, 2, data, distance)
  print(paste0("x=(", paste(x, collapse = ",") , "), y=(", paste(y, collapse = ", "), ") ---- ", distance))
  return(distance)
}

#' @export
db <- function(x, y, data, distance) {

  #TODO is matrix data
  distance <- .C("distance",
                 distance = getCodeDistance(distance), # numeric code of the distance function
                 data = as.double(data), # dataset in compatible type
                 ncol = ncol(data),     # total number of variables of the dataset
                 nrow = nrow(data),     # total number of objects of the dataset
                 x = as.integer(x),        # index of the first object
                 y = as.integer(y),        # index of the second object
                 result = as.double(-1)) #double *result
  return(round(distance$result, 12))
}


dbv <- Vectorize(db, vectorize.args = c("x", "y"))

#' Get the code of a distance function
#'
#' @param distanceName Identifier of the distance function using a string of lower case letters of three characters
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

  return(as.integer(paste0((distanceLetters - 97), collapse = "")))
}

print.distance <- function(distance) {
  cat(distance)
  invisible(distance)
}
