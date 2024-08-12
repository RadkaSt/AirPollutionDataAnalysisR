# Air Pollution Data Analysis in R
Programming assignment 1 in the course of R programming from Johns Hopkins University

This repository contains R functions for analyzing air pollution data. The functions are designed to work with datasets containing measurements of pollutants such as sulfate and nitrate from various monitoring stations. Below is a description of the functions included in this repository:
Functions
pollutantmean

Calculates the mean of a specified pollutant (sulfate or nitrate) across a specified list of monitors.

Usage:
pollutantmean(directory, pollutant, id = 1:332)

Parameters:

    directory: Character vector specifying the location of the CSV files. This should be a relative or absolute path.
    pollutant: Character vector indicating the name of the pollutant to calculate the mean for; either "sulfate" or "nitrate".
    id: Integer vector specifying the monitor ID numbers to be used. Default is 1:332, meaning all monitors are included.

Returns:

    A numeric value representing the mean of the specified pollutant across the given monitors, ignoring missing values.

Example:

Calculate the mean sulfate level across monitors 1 to 10
pollutantmean("specdata", "sulfate", 1:10)

complete

Reports the number of completely observed cases (rows with no missing values) in each data file in the specified directory.

Usage:
complete(directory, id = NULL)

Parameters:

    directory: Character vector specifying the location of the CSV files.
    id: Integer vector of monitor IDs to be used. If NULL, the function processes all files in the directory. Default is NULL.

Returns:

    A data frame with two columns: file (the name of the file) and complete_cases (the number of completely observed cases).

Example:
Get the number of complete cases for all files in the "specdata" directory
complete("specdata")
Get the number of complete cases only for files with IDs 1, 3, and 5
complete("specdata", id = c(1, 3, 5))

corr

Calculates the correlation between sulfate and nitrate for monitors where the number of completely observed cases exceeds a given threshold.

Usage:
corr(directory, threshold = 0)

Parameters:

    directory: Character vector specifying the location of the CSV files.
    threshold: Integer specifying the minimum number of complete cases required to calculate the correlation. Default is 0.

Returns:

    A numeric vector containing the correlations between sulfate and nitrate for monitors meeting the threshold. If no monitors meet the threshold, returns a numeric vector of length 0.

Example:
Calculate correlations for monitors with more than 150 complete cases
corr("specdata", 150)
