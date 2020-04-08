This is a new release. The package aims to provide a 
  common interface for computing distance functions 
  using a function called "distance" with a parameter 
  containing the name of the distance (Euclidean, 
  Jaccard, Manhattan, Cosine...). Also, it works with tibbles 
  as input instead of matrices (dists classic function 
  only works with matrices). The distances are computed 
  in C to speed up the execution.

## Test environments
* local OS X install, R 3.6.2
* ubuntu 14.04 (on travis-ci), R 3.6.2
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 0 notes

* This is a new release.
