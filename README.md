
<!-- README.md is generated from README.Rmd. Please edit that file -->

# b2package

<!-- badges: start -->
<!-- badges: end -->

The goal of b2package is to house mean\_sd() that creates new columns in
your dataset that contains the mean and sd values for a specified group,
retains the rest of the dataset as-is.

## Installation

b2package is not yet on CRAN. But, you can download it from this
repository using the following R command:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2021/functions_tessosbrn", ref = "0.1.0")
```

<!-- And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2021/functions-tessosbrn")
```
-->

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(b2package)
mean_sd(palmerpenguins::penguins, island, body_mass_g)
#> # A tibble: 344 × 10
#> # Groups:   island [3]
#>    species island    bill_length_mm bill_depth_mm flipper_length_mm body_mass_g
#>    <fct>   <fct>              <dbl>         <dbl>             <int>       <int>
#>  1 Adelie  Torgersen           39.1          18.7               181        3750
#>  2 Adelie  Torgersen           39.5          17.4               186        3800
#>  3 Adelie  Torgersen           40.3          18                 195        3250
#>  4 Adelie  Torgersen           NA            NA                  NA          NA
#>  5 Adelie  Torgersen           36.7          19.3               193        3450
#>  6 Adelie  Torgersen           39.3          20.6               190        3650
#>  7 Adelie  Torgersen           38.9          17.8               181        3625
#>  8 Adelie  Torgersen           39.2          19.6               195        4675
#>  9 Adelie  Torgersen           34.1          18.1               193        3475
#> 10 Adelie  Torgersen           42            20.2               190        4250
#> # … with 334 more rows, and 4 more variables: sex <fct>, year <int>,
#> #   mean_value <dbl>, sd_value <dbl>
```

This package is useful because it allows those cleaning their datasets
to have simple functions that provide useful columns without dealing
with tidyverse steps
