#' Calculate matrix of distances
#'
#' `distance` returns a matrix of distances between all the objects in data
#' using the distance function indicated in the arguments.
#'
#' @details
#' - Manhattan distance (man):
#' - Euclidean distance (euc):
#' - Chebyshev distance (che):
#'
#' @param data matrix where each row represent an object of the dataset
#' defined by the variables in the columns.
#' If the object is not a matrix but it has and adequate structure
#' (i.e. it is a tibble or data.frame)it will be cast to matrix by the function.
#' @param distance the three-letters name of the distance function chosen
#' to calculate the distance between the objects of the dataset. Codes:
#'

#'
#' @return A matrix containing the distance between all the objects of the
#' dataset calculating with the chosen distance function.
#'
#' @export
#'
#'
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


#' Distance between two vectors
#'
#' Calculate the distance between two vector of the same length using the
#' chosen distance function.
#'
#' @param x first vector
#' @param y second vector
#' @param distance distance function used to calculate the distance between the
#' vectors
#'
#' @return A positive number that is the distance between the two vectors
#'
#' @examples
#' # Uses the default distance function: Euclidean distance
#' distanceBetween(c(1, 2, 3), c(3, 2, 1))
#'
#' @export
distanceBetween <- function(x, y, distance = "euc") {

  if(length(x) != length(y))
    stop("The vectors must have the same length")

  if(distance %in% availableDistances())
    stop("Distance not available")

  data <- matrix(c(x, y), byrow = TRUE, ncol = length(x))
  distance <- db(1, 2, data, distance)
  print(paste0("x=(", paste(x, collapse = ",") , "), y=(", paste(y, collapse = ", "), ") ---- ", distance))
  return(distance)
}

#' List of available distances
#'
#' `availableDistance` returns a list of the available codes representing
#'   distance functions that can be used in the methods of this package.
#'
#' @return character vector containing the codes of the available distances
#' @export
availableDistances <- function() {
  return(c("can", # 2013 - Canberra
           "che", # 274 - Chebyshev
           "cos", # 21418 - Cosine
           "euc", # 4202 - Euclidean
           "jac", # 902 - Jaccard
           "man", # 12013 - Manhattan
           "mat", # 12019 - Matusita
           "ney", # 13424 - Neyman
           "pea", # 1540 - Pearson distance
           "trd"  # 19173 - Triangular discrimination (Squared Chord)
         ))
}

# Internal function to get the distance between two rows of the dataset
#' @keywords internal
db <- function(x, y, data, distance) {

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
#' @keywords internal
dbv <- Vectorize(db, vectorize.args = c("x", "y"))

#' Get the code of a distance function
#'
#' @param distanceName Identifier of the distance function using a string of lower case letters of three characters
#'
#' @return
#' @keywords internal
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
