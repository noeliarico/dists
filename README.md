
# dists

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/noeliarico/dists.svg?branch=master)](https://travis-ci.org/noeliarico/dists)
[![Codecov test coverage](https://codecov.io/gh/noeliarico/dists/branch/master/graph/badge.svg)](https://codecov.io/gh/noeliarico/dists?branch=master)
<!-- badges: end -->

The goal of dists is to ...

## Installation

You can install the released version of dists from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("dists")
```

## Data

## Distance functions

- `can` - **Canberra distance**:
   
$$
d_{\text{can}}({\bf v}, {\bf w}) = \sum_{i=1}^n \frac{\left|v_i-w_i\right|}{\left|v_i\right|+\left|w_i\right|}
$$

- `che` - **Chebyshev distance**:
$$d_{\text{che}}({\bf v}, {\bf w}) = \max_i\left|v_i-w_i\right|\,.$$
    
- `cos` - **Cosine distance**:

$$d_{\text{cos}}({\bf v}, {\bf w}) = 1 - \frac{\sum_{i=1}^{n}{v_i w_i}}{\sqrt{\sum_{i=1}^{n}v_i^2} \sqrt{\sum_{i=1}^{n}w_i^2}}\,.$$
    
- `euc` - **Euclidean distance**:
    
$$ d_{\text{euc}}({\bf v}, {\bf w}) = \sqrt{\sum_{i=1}^n (v_i-w_i)^2}\,.$$
    
- `jac` - **Jaccard distance**:

$$d_{\text{jac}}({\bf v}, {\bf w}) = \frac{\sum_{i=1}^{n}{(v_i - w_i)^2}}{\sum_{i=1}^{n}v_i^2 + \sum_{i=1}^{n}w_i^2 - \sum_{i=1}^{n}v_i w_i}\,.$$

- `man` - **Manhattan distance**:

$$d_{\text{man}}({\bf v}, {\bf w}) = \sum_{i=1}^n |v_i-w_i|\,.$$

- `mat` - **Matusita distance**:

$$d_{\text{mat}}({\bf v}, {\bf w}) = \sqrt{\sum_{i=1}^{n}(\sqrt{v_i} - \sqrt{w_i})^2}\,.$$

- `mas` - **Max symmetric distance**:

$$   d_{\text{msc}}({\bf v}, {\bf w}) = \max\left(\sum_{i=1}^{n}\frac{\left(v_i - w_i\right)^2}{v_i},\sum_{i=1}^{n}\frac{\left(v_i - w_i\right)^2}{w_i}\right)\,.$$

- `ney` - **Neyman distance**:

$$    d_{\text{ney}}({\bf v}, {\bf w}) = \sum_{i=1}^{n} \frac{(v_i - w_i)^2}{v_i}\,.$$

- `pea` - **Pearson distance**:

$$     d_{\text{pea}}({\bf v}, {\bf w}) = \sum_{i=1}^{n}\frac{(v_i - w_i)^2}{w_i}\,.$$

- `trd` - *Triangular discrimination distance*:
$$d_{tri}({\bf v}, {\bf w}) = \sum_{i=1}^{n} \frac{(v_i - w_i)^2}{v_i + w_i}$$

- `vsd` - **Vicissitude distance**:

$$d_{\text{vsd}}({\bf v}, {\bf w}) = \sum_{i=1}^{n}\frac{\left(v_i - w_i\right)^2}{\max\left(v_i,w_i\right)}\,.$$
