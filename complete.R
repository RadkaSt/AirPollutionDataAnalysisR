#' Report the Number of Complete Cases in Each Data File
#'
#' The `complete` function reads a directory full of CSV files and 
#' reports the number of completely observed cases (i.e., rows with no missing values) 
#' in each file. It returns a data frame where the first column is the file name 
#' and the second column is the number of complete cases.
#'
#' @param directory A character vector of length 1 indicating the location of the 
#' CSV files. The path should be relative to the current working directory or an absolute path.
#' @param id An integer vector indicating the monitor ID numbers (file IDs) to be used.
#' If `NULL`, the function will process all files in the directory. Default is `NULL`.
#'
#' @return A data frame with two columns:
#' \describe{
#'   \item{file}{The name of the file.}
#'   \item{nobs}{The number of completely observed cases in the file.}
#' }
#'
#' @examples
#' # Assume there is a directory called "specdata" with CSV files
#' complete("specdata")
#' 
#' # To get complete cases only for files with IDs 1, 3, and 5
#' complete("specdata", id = c(1, 3, 5))
#'
#' @export
complete <- function(directory, id = NULL) {
  # Get the list of all files in the directory
  files_list <- list.files(directory, full.names = TRUE)
  
  # If id is provided, filter the files_list based on id
  if (!is.null(id)) {
    # Ensure IDs are in the correct format (e.g., "001.csv" for file ID 1)
    files_list <- files_list[id]
  }
  
  # Initialize an empty data frame to store the results
  results <- data.frame(file = character(), complete_cases = integer(), stringsAsFactors = FALSE)
  
  # Loop through each file in the filtered files list
  for (file_path in files_list) {
    # Read the data from the file
    data <- read.csv(file_path)
    
    # Calculate the number of complete cases (rows with no missing values)
    num_complete <- sum(complete.cases(data))
    
    # Extract the file name from the full path
    file_name <- basename(file_path)
    
    # Append the results to the data frame
    results <- rbind(results, data.frame(file = file_name, nobs = num_complete, stringsAsFactors = FALSE))
  }
  
  return(results)
}