#' Calculate the Mean of a Pollutant Across Specified Monitors
#'
#' The `pollutantmean` function calculates the mean of a specified pollutant
#' (either sulfate or nitrate) across a list of monitor IDs. The function reads
#' the data from CSV files located in a specified directory, corresponding to 
#' each monitor ID, and returns the mean value of the pollutant across all monitors,
#' ignoring missing values (`NA`).
#'
#' @param directory A character vector of length 1 indicating the location of the 
#' CSV files.
#' @param pollutant A character vector of length 1 indicating the name of the 
#' pollutant for which the mean should be calculated; either `"sulfate"` or `"nitrate"`.
#' @param id An integer vector indicating the monitor ID numbers to be used. 
#' Default is `1:332`.
#'
#' @return A numeric value representing the mean of the specified pollutant 
#' across the specified monitors, with missing values ignored.
#'
#' @examples
#' # Calculate the mean sulfate level across monitors 1 to 10 in the "specdata" directory
#' pollutantmean("specdata", "sulfate", 1:10)
#'
#' # Calculate the mean nitrate level across monitors 2, 4, 8, 10, and 12 in the "specdata" directory
#' pollutantmean("specdata", "nitrate", c(2, 4, 8, 10, 12))
#'
#' @export
pollutantmean <- function(directory, pollutant, id = 1:332) {
  pollutant_data <- numeric()
  
  for (monitor_id in id) {
    file_name <- sprintf("%03d.csv", monitor_id)
    file_path <- file.path(directory, file_name)
    monitor_data <- read.csv(file_path)
    pollutant_data <- c(pollutant_data, monitor_data[[pollutant]])
  }
  
  mean(pollutant_data, na.rm = TRUE)
}