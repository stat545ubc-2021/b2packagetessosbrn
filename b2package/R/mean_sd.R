
#'Mean and SD for your dataset
#'
#'This function will calculate the mean and standard deviation values for a variable of interest, specific to a group that you are interested in, the variable of interest must be numeric for this to work.
#'
#' @import dplyr
#' @import palmerpenguins
#' @import gapminder
#' @importFrom stats "sd"
#'
#' @param data the dataset you will want to run the mean and sd calculations on, named data as it is a clear descriptor of what this variable is doing in the function
#' @param group the group that you are interested in finding these values for, named group as it is a clear descriptor of what you should be entering in this function
#' @param col_x the specific value type you'd like to know these summary statistics for, while 'x' may have also been useful, this encourages the user to think more specifically about the column they will be entering, perhaps more helpful if you're new to code like me!
#'
#' @return return a tibble that includes the new data calculated as well as all the previous data, it differs from the summarise() function in dplyr this way
#'
#' @examples
#'
#' df_1 <- data.frame(time = c(1, 1, 3, 2, 3, 5, NA, 6), value = c(0.4, 2, 8, 0.6, NA, 0.7, 0.5, 0.3))
#' mean_sd(df_1, time, value)
#'
#' mean_sd(gapminder::gapminder, continent, pop)
#'
#' mean_sd(palmerpenguins::penguins, island, bill_length_mm)
#'
#' @export
mean_sd <- function(data, group, col_x) {
  calculation_check <- dplyr::summarise(data,
                                        is_numeric_col = is.numeric({{ col_x }}),
                                        class_col = class({{ col_x }}))
  if (!(calculation_check$is_numeric_col)) {
    stop("The column selected is not numeric, it is: ", calculation_check$class_col)
  }
  calc_df <- data %>%
    dplyr::group_by({{ group }}) %>%
    dplyr::mutate(
      mean_value = mean({{ col_x }}),
      sd_value = stats::sd({{ col_x }})
    )
  return(calc_df)
}
