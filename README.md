# dists

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/noeliarico/dists.svg?branch=master)](https://travis-ci.org/noeliarico/dists)
[![Codecov test coverage](https://codecov.io/gh/noeliarico/dists/branch/master/graph/badge.svg)](https://codecov.io/gh/noeliarico/dists?branch=master)
<!-- badges: end -->

The goal of dists is to provide a common interface for executing different distance functions.

Get the full details [here.](https://github.com/noeliarico/dists)

## Installation

You can install the current version of `dists` executing the following code:

```r
# install.package("devtools") if you've never done it before
devtools::install_github("noeliarico/dists")
```
<!--
You can install the released version of dists from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("dists")
```
-->

## Usage

The following example uses `dists` to compute the Euclidean distance between two vectors.

```r
distanceBetween(1:3, 3:1, "euc")
```


