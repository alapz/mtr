
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mtr

<!-- badges: start -->
<!-- badges: end -->

mtr stands for “Misc Tools for R” which is my collection of functions
that I have either made or gathered throughout my data science projects.
Most are nothing special, but they solve unique problems I could not
find in other packages (or are slightly tweaked).

## Installation

To install these functions use the pacman lines

``` r
if (!require("pacman")) install.packages("pacman")
pacman::p_load_gh("alapz/mtr")
```

or you can use the devtools lines below.

``` r
devtools::install_github("alapz/mtr")
```

# resave

This function allows the user to “save” data from their environment. The
issue with the base R function is that it overwrites everything. This
function will only re-write the file you specify, if it is present.

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(mtr)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/master/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
