#' Calculate Correlation Between Sulfate and Nitrate for Monitors Meeting a Threshold
#'
#' The `corr_threshold` function reads a directory of CSV files, checks if the number of 
#' completely observed cases (rows with no missing values) is greater than a given threshold, 
#' and calculates the correlation between sulfate and nitrate for those files.
#' It returns a vector of correlations for the monitors that meet the threshold requirement.
#'
#' @param directory A character vector of length 1 indicating the location of the 
#' CSV files. The path should be relative to the current working directory or an absolute path.
#' @param threshold An integer specifying the threshold for the number of complete cases 
#' required to calculate the correlation between sulfate and nitrate.
#'
#' @return A numeric vector containing the correlations between sulfate and nitrate 
#' for monitors that meet the threshold. If no monitors meet the threshold, a numeric 
#' vector of length 0 is returned.
#'
#' @examples
#' # Assume there is a directory called "specdata" with CSV files
#' corr_threshold("specdata", 150)
#'
#' @export
corr <- function(directory, threshold = 0) {
  # Get the list of all files in the directory
  files_list <- list.files(directory, full.names = TRUE)
  
  # Initialize a numeric vector to store the correlations
  correlations <- numeric()
  
  # Loop through each file in the directory
  for (file_path in files_list) {
    # Read the data from the file
    data <- read.csv(file_path)
    
    # Calculate the number of complete cases (rows with no missing values)
    complete_cases <- sum(complete.cases(data))
    
    # If the number of complete cases is greater than the threshold, calculate the correlation
    if (complete_cases > threshold) {
      # Filter the data to include only the complete cases
      complete_data <- data[complete.cases(data), ]
      
      # Calculate the correlation between sulfate and nitrate
      corr_value <- cor(complete_data$sulfate, complete_data$nitrate, use = "complete.obs")
      
      # Append the correlation value to the correlations vector
      correlations <- c(correlations, corr_value)
    }
  }
  
  return(correlations)
}