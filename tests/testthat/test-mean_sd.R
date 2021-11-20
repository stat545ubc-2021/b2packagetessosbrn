#Tests for my functions
test_that("Checking errors function properly", {
  expect_error(mean_sd(mtcars, as.factor(cyl), as.factor(vs)), "The column selected is not numeric")
})

test_that("Output is as expected", {
  df_2 <- gapminder::gapminder %>%
    dplyr::group_by(country) %>%
    dplyr::mutate(
      mean_value = mean(lifeExp),
      sd_value = stats::sd(lifeExp)
    )
  expect_identical(mean_sd(gapminder::gapminder, country, lifeExp), df_2)
})


test_that("Output is the correct object type", {
  df_1 <- data.frame(time = c(1, 1, 4, 3, 2, 3, 4, 5, NA, 6, 7),
                     value = c(0.3, 0.4, 0.9, 2, 8, 0.3, 0.6, NA, 0.7, 0.5, 0.3))
  expect_s3_class(mean_sd(df_1, time, value), "tbl")
})
