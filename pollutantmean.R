pollutantmean <- function(directory, pollutant, id = 1:332) {
	
	## directory argument is a CHAR vector of length 1 indicating the location of the CSV files
	
	## pollutant argument is a CHAR vector of length 1 indicating the name of the pollutant that we will calculate mean of either "sulfate" or "nitrate"
	
	## id argument is an INT vector indicating the monitor ID numbers to be used
	
	## The result will return the mean (not rounded) of the pollutant across all monitors list in the 'id' vector. Ignoring NA values.
	
	fileslist <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
	means <- numeric()
	
	for(i in id) {
		data <- read.csv(fileslist[i])
		means <- c(means, data[[pollutant]])
	}
	mean(means, na.rm = TRUE)
}