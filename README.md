
<!-- README.md is generated from README.Rmd. Please edit that file -->

# b2packagetessosbrn

<!-- badges: start -->
<!-- badges: end -->

Welcome to my first package - a very basic package that served as some
great practice for a class assignment, and will likely be useful in the
future as a package template.

The goal of b2packagetessosbrn is to house the `mean_sd()` function that
creates new columns in your dataset that contain the mean and sd values
for a group of interest, all while retaining the rest of the dataset
as-is.

## Installation

b2packagetessosbrn is not yet on CRAN. But, you can download it from
this repository using the following R command:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2021/b2packagetessosbrn")
```

## Example Use

This is a basic example that shows you how to obtain the mean and sd
values for body mass of all the penguins on a certain island from the
palmerpenguins package:

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

b2packagetessosbrn is useful because it allows those cleaning their
datasets to have simple functions that provide useful columns without
dealing with intermediate steps - hopefully will be expanded in the near
future to include many more cleaning steps!
