data <- read.csv("datafile.csv")
# Load a CSV file that doesn't have headers
data <- read.csv("datafile-noheader.csv", header=FALSE)

#Read with delimiter set
data <- read.table("datafile-noheader.csv",
                   header=FALSE,
                   sep=","         # use "\t" for tab-delimited files
)
#Choosing the file
data <- read.csv(file.choose())
#Read the strings of data as strings instead of Factors
data <- read.csv("datafile.csv", stringsAsFactors=FALSE)

# You might have to convert some columns to factors
data$Sex <- factor(data$Sex)
data <- read.csv("datafile.csv")

data$First <- as.character(data$First)
data$Last  <- as.character(data$Last)

# Another method: convert columns named "First" and "Last"
stringcols <- c("First","Last")
data[stringcols] <- lapply(data[stringcols], as.character)