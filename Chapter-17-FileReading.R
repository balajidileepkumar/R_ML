#read.csv and read.csv2 are identical to read.table except for the defaults. They are intended for reading 'comma separated value' files ('.csv') or (read.csv2) the variant used in countries that use a comma as decimal point and a semicolon as field separator. Similarly, read.delim and read.delim2 are for reading delimited files, defaulting to the TAB character for the delimiter.read.csv and read.csv2 are identical to read.table except for the defaults. They are intended for reading 'comma separated value' files ('.csv') or (read.csv2) the variant used in countries that use a comma as decimal point and a semicolon as field separator. Similarly, read.delim and read.delim2 are for reading delimited files, defaulting to the TAB character for the delimiter.
#comma separated values 
data <- read.csv("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/msft.csv")

# Load a CSV file that doesn't have headers
data <- read.csv("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/iris.csv", header=FALSE)
data <- read.csv("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/msft.csv", header=TRUE)
typeof(data)

#Read with delimiter set
data <- read.table("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/msft.csv",
                   header=FALSE,
                   sep=","         # use "\t" for tab-delimited files
)
#Read with delimiter set
data <- read.delim("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/iris.csv",
                   header=FALSE)
data[0]
typeof(data)
#Choosing the file
data <- read.csv(file.choose())
#Read the strings of data as strings instead of Factors
data <- read.csv("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/iris.csv", header=FALSE, stringsAsFactors=TRUE)


# You might have to convert some columns to factors
data <- read.csv("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/msft.csv")
data$Date <- factor(data$Date)

data <- read.csv("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/iris.csv", header= FALSE,col.names =c("PetalLength","PetalWidth","SepalLength","SepalWidth","Species"),stringsAsFactors=FALSE)
data$Species <- factor(data$Species)
data$PetalLength <- as.character(data$PetalLength)
data$PetalWidth  <- as.integer(data$PetalWidth)
data$SepalLength <- as.double(data$SepalLength)
data$SepalWidth  <- as.complex(data$SepalWidth)


###TempFIle
file1 = tempfile()
write.csv(data, file=file1)
write.csv(data, "c:\\Test\\helloworld.txt")
write.csv(data, "c:\\Test\\helloworld.txt",sep=" ")
#list.files(tempdir())
write.table(iris,file=tempfile())
#tempdir()
file_list = list.dirs("C:\\")

#Function	Description
#list.files	Lists files in a directory.
files_list = list.files("c:\\Test\\")
files_list = list.files("C:\\Source\\PythonDSML", pattern ="*.csv",ignore.case = TRUE, recursive = TRUE)


#list.dirs	Lists subdirectories of a directory.
direc = list.dirs("C:\\Source\\PythonDSML",  recursive = TRUE,full.names = TRUE)

#file.exists	Tests whether a specific file exists in a location.
file_exists = file.exists("C:\\Source\\PythonDSML\\PythonPandas/Pandas2ndLevel/data/msft_modified_01.csv")

#file.create	Creates a file.
file.create("C:\\Source\\PythonDSML\\PythonPandas/Pandas2ndLevel/data/msft_modified_21.csv")


#file.remove	Deletes files (and directories in Unix operating systems).

#tempfile	Returns a name for a temporary file. If you create a file
result_file  = tempfile()
file.create(tempfile())
tempdir()
#- for example, with file.create()
#or write.table() using this returned name
#- R will create a file in a temporary folder.
#tempdir	Returns the file path of a temporary folder on your file
#system.