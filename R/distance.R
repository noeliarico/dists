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

  data <- data.matrix(data)

  distance <- outer(1:nrow(data), 1:nrow(data), dbv, data = data,  distance = distance)

  class(distance) <- c("distance", "matrix")
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
  #TODO check that both vectors hace the same length
  data <- matrix(c(x, y), byrow = FALSE, ncol = length(x))
  distance <- db(data, distance)
  return(distance)
}

db <- function(x, y, data, distance) {

  #TODO is matrix data
  print(paste(c("x = ", x, ", y = ", y), collapse = ""))
  distance <- .C("distance",
                 #distance = getCodeDistance(distance), # numeric code of the distance function
                 distance = 1,
                 data = as.double(data), # dataset in compatible type
                 ncol = ncol(data),     # total number of variables of the dataset
                 nrow = nrow(data),     # total number of objects of the dataset
                 x = as.integer(x),        # index of the first object
                 y = as.integer(y),        # index of the second object
                 result = as.double(-1)) #double *result
  return(distance$result)

}
dbv <- Vectorize(db, vectorize.args = c("x", "y"))

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
