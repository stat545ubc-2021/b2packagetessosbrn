Tess Assignment B-1
================
November 2, 2021

-   [Assignment B-1](#assignment-b-1)
    -   [First I will load all of the relevant packages I
        need](#first-i-will-load-all-of-the-relevant-packages-i-need)
    -   [Exercise 1 and 2](#exercise-1-and-2)
    -   [Exercise 3](#exercise-3)
    -   [Exercise 4](#exercise-4)

# Assignment B-1

Welcome to my first assignment of **STAT545B**.

Below you will find a simple function I used a few times when making a
script to produce relevant plots of my own data, the function is quite
simple but I wanted to start with something I actually used in real
life, and that was not too overwhelming!

#### First I will load all of the relevant packages I need

------------------------------------------------------------------------

``` r
suppressPackageStartupMessages(library(datateachr))
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(gapminder))
suppressPackageStartupMessages(library(testthat))
suppressPackageStartupMessages(library(dplyr))
```

### Exercise 1 and 2

------------------------------------------------------------------------

Now onto writing my function! I will first begin by documenting using
roxygen2 format, then I will get into the actual function

``` r
#' # Title
#' Mean and SD for your dataset
#' 
#' ## Description
#' This function will calculate the mean and standard deviation values for a variable of interest, specific to a group that you are interested in, the variable of interest must be numeric for this to work.
#' 
#' @param data the dataset you will want to run the mean and sd calculations on, named data as it is a clear descriptor of what this variable is doing in the function
#' @param group the group that you are interested in finding these values for, named group as it is a clear descriptor of what you should be entering in this function
#' @param col_x the specific value type you'd like to know these summary statistics for, while 'x' may have also been useful, this encourages the user to think more specifically about the column they will be entering, perhaps more helpful if you're new to code like me!
#'
#' @return return a tibble that includes the new data calculated as well as all the previous data, it differs from the summarise() function in dplyr this way
#'
#' @examples please see exercise 3.

mean_sd <- function(data, group, col_x) {
  calculation_check <- dplyr::summarise(data, 
                                        is_numeric_col = is.numeric({{ col_x }}),
                                        class_col = class({{ col_x }}))
  if (!(calculation_check$is_numeric_col)) {
    stop("The column selected is not numeric, it is: ", calculation_check$class_col)
  }
  calc_df <- data %>%
    group_by({{ group }}) %>%
    mutate(
      mean_value = mean({{ col_x }}),
      sd_value = sd({{ col_x }})
    )
  return(calc_df)
} 

mean_sd(gapminder, country, gdpPercap)
```

    ## # A tibble: 1,704 × 8
    ## # Groups:   country [142]
    ##    country     continent  year lifeExp      pop gdpPercap mean_value sd_value
    ##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>      <dbl>    <dbl>
    ##  1 Afghanistan Asia       1952    28.8  8425333      779.       803.     108.
    ##  2 Afghanistan Asia       1957    30.3  9240934      821.       803.     108.
    ##  3 Afghanistan Asia       1962    32.0 10267083      853.       803.     108.
    ##  4 Afghanistan Asia       1967    34.0 11537966      836.       803.     108.
    ##  5 Afghanistan Asia       1972    36.1 13079460      740.       803.     108.
    ##  6 Afghanistan Asia       1977    38.4 14880372      786.       803.     108.
    ##  7 Afghanistan Asia       1982    39.9 12881816      978.       803.     108.
    ##  8 Afghanistan Asia       1987    40.8 13867957      852.       803.     108.
    ##  9 Afghanistan Asia       1992    41.7 16317921      649.       803.     108.
    ## 10 Afghanistan Asia       1997    41.8 22227415      635.       803.     108.
    ## # … with 1,694 more rows

### Exercise 3

------------------------------------------------------------------------

Below you will find some examples of data running in my function

-   The first example includes some NAs and only a few repeat values
    (not every value being calculated has more than one member in it’s
    group)

-   The second example shows a nice large grouping in the gapminder
    dataset

-   The third example demonstrates a resulting error that occurs if the
    user has inputted the incorrect data type using the gapminder
    dataset again

``` r
mtcars
```

    ##                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
    ## Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
    ## Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
    ## Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
    ## Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
    ## Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
    ## Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
    ## Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
    ## Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
    ## Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
    ## Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
    ## Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
    ## Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
    ## Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
    ## Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
    ## Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
    ## Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
    ## Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
    ## Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
    ## Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
    ## Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
    ## Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
    ## Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
    ## AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
    ## Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
    ## Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
    ## Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
    ## Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
    ## Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
    ## Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
    ## Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
    ## Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
    ## Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2

``` r
#Example 1

df_1 <- data.frame(time = c(1, 1, 4, 3, 2, 3, 4, 5, NA, 6, 7),
                  value = c(0.3, 0.4, 0.9, 2, 8, 0.3, 0.6, NA, 0.7, 0.5, 0.3))

mean_sd(df_1, time, value)
```

    ## # A tibble: 11 × 4
    ## # Groups:   time [8]
    ##     time value mean_value sd_value
    ##    <dbl> <dbl>      <dbl>    <dbl>
    ##  1     1   0.3       0.35   0.0707
    ##  2     1   0.4       0.35   0.0707
    ##  3     4   0.9       0.75   0.212 
    ##  4     3   2         1.15   1.20  
    ##  5     2   8         8     NA     
    ##  6     3   0.3       1.15   1.20  
    ##  7     4   0.6       0.75   0.212 
    ##  8     5  NA        NA     NA     
    ##  9    NA   0.7       0.7   NA     
    ## 10     6   0.5       0.5   NA     
    ## 11     7   0.3       0.3   NA

``` r
#Example 2

mean_sd(gapminder, continent, pop)
```

    ## # A tibble: 1,704 × 8
    ## # Groups:   continent [5]
    ##    country     continent  year lifeExp      pop gdpPercap mean_value   sd_value
    ##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>      <dbl>      <dbl>
    ##  1 Afghanistan Asia       1952    28.8  8425333      779.  77038722. 206885205.
    ##  2 Afghanistan Asia       1957    30.3  9240934      821.  77038722. 206885205.
    ##  3 Afghanistan Asia       1962    32.0 10267083      853.  77038722. 206885205.
    ##  4 Afghanistan Asia       1967    34.0 11537966      836.  77038722. 206885205.
    ##  5 Afghanistan Asia       1972    36.1 13079460      740.  77038722. 206885205.
    ##  6 Afghanistan Asia       1977    38.4 14880372      786.  77038722. 206885205.
    ##  7 Afghanistan Asia       1982    39.9 12881816      978.  77038722. 206885205.
    ##  8 Afghanistan Asia       1987    40.8 13867957      852.  77038722. 206885205.
    ##  9 Afghanistan Asia       1992    41.7 16317921      649.  77038722. 206885205.
    ## 10 Afghanistan Asia       1997    41.8 22227415      635.  77038722. 206885205.
    ## # … with 1,694 more rows

``` r
#Example 3

mean_sd(gapminder, pop, continent)
```

    ## Error in mean_sd(gapminder, pop, continent): The column selected is not numeric, it is: factor

As we can see, the function is working as expected, including to return
an error. This is good news and means we should continue on to more
formal means of testing! On to exercise 4.

### Exercise 4

------------------------------------------------------------------------

``` r
#Test 1
test_that("Checking errors function properly", {
  expect_error(mean_sd(mtcars, as.factor(cyl), as.factor(vs)), "The column selected is not numeric")
})
```

    ## Test passed 🌈

``` r
#Test 2, create a test dataframe for this one

df_2 <- gapminder %>%
  group_by(country) %>%
  mutate(
    mean_value = mean(lifeExp), 
    sd_value = sd(lifeExp)
  )

test_that("Output is correct", {
     expect_identical(mean_sd(gapminder, country, lifeExp), df_2)
  expect_s3_class(mean_sd(df_1, time, value), "tbl")
 })
```

    ## Test passed 😸

Running the code chunk above should produce two passed tests, one
indicating the function errors correctly, and one indicating that the
correct type of output is being created in two non-redudant forms - one
testing that manually running a similar code produces the expected
output. Another that checks the type of output is a tibble, as expected.
