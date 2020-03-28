pkgname <- "dists"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('dists')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("distanceBetween")
### * distanceBetween

flush(stderr()); flush(stdout())

### Name: distanceBetween
### Title: Calculates the distance between two vector of the same length
###   using the chosen distance function.
### Aliases: distanceBetween

### ** Examples

# Uses the default distance function: Euclidean distance
distanceBetween(c(1, 2, 3), c(3, 2, 1))




cleanEx()
nameEx("hello")
### * hello

flush(stderr()); flush(stdout())

### Name: hello
### Title: Hello, World!
### Aliases: hello

### ** Examples

hello()



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
