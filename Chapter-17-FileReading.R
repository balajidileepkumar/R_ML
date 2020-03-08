#read.csv and read.csv2 are identical to read.table except for the defaults. They are intended for reading 'comma separated value' files ('.csv') or (read.csv2) the variant used in countries that use a comma as decimal point and a semicolon as field separator. Similarly, read.delim and read.delim2 are for reading delimited files, defaulting to the TAB character for the delimiter.read.csv and read.csv2 are identical to read.table except for the defaults. They are intended for reading 'comma separated value' files ('.csv') or (read.csv2) the variant used in countries that use a comma as decimal point and a semicolon as field separator. Similarly, read.delim and read.delim2 are for reading delimited files, defaulting to the TAB character for the delimiter.
#comma separated values 
# read.table(file, header = FALSE, sep = "", quote = "\"'",
#            dec = ".", numerals = c("allow.loss", "warn.loss", "no.loss"),
#            row.names, col.names, as.is = !stringsAsFactors,
#            na.strings = "NA", colClasses = NA, nrows = -1,
#            skip = 0, check.names = TRUE, fill = !blank.lines.skip,
#            strip.white = FALSE, blank.lines.skip = TRUE,
#            comment.char = "#",
#            allowEscapes = FALSE, flush = FALSE,
#            stringsAsFactors = default.stringsAsFactors(),
#            fileEncoding = "", encoding = "unknown", text, skipNul = FALSE)
# 
# read.csv(file, header = TRUE, sep = ",", quote = "\"",
#          dec = ".", fill = TRUE, comment.char = "", ...)
# 
# read.csv2(file, header = TRUE, sep = ";", quote = "\"",
#           dec = ",", fill = TRUE, comment.char = "", ...)
# 
# read.delim(file, header = TRUE, sep = "\t", quote = "\"",
#            dec = ".", fill = TRUE, comment.char = "", ...)
# 
# read.delim2(file, header = TRUE, sep = "\t", quote = "\"",
data <- read.csv("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/msft.csv")# default header = TRUE
data <- read.csv("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/msft.csv", header=FALSE)

# Load a CSV file that doesn't have headers
data <- read.csv("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/iris.csv", header=TRUE)
#numerical header is converted in string by appending a character
data <- read.csv("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/iris.csv", header=TRUE)

#with colon separated
data <- read.csv("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/msft_colon.csv", header=TRUE)
 
data <- read.csv("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/msft_colon.csv", header=TRUE, sep =":")


#Read with delimiter set
#read all the type of delimited data
data <- read.table("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/msft.csv",
                   header=FALSE, sep=",")         # use "\t" for tab-delimited files
data <- read.table("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/msft_colon.csv",
                   header=FALSE, sep=":")         # use "\t" for tab-delimited files

#Read with delimiter set
data <- read.delim("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/msft_tab.csv",header=FALSE)

data <- read.delim("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/msft.csv",header=FALSE)

#Choosing the file
data <- read.csv(file.choose())
#Read the strings of data as strings instead of Factors
data <- read.csv("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/iris.csv", header=FALSE, stringsAsFactors=TRUE)
#data.col.names 
data.v5
col_names = c("col1","COL2","col3","COL4","5thcol","6thcol","7thcol")
data <- read.delim("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/msft_tab.csv",header=FALSE,col.names = col_names)
data <- read.delim("C:/Users/balaji.arumugham/Documents/R_ML/R_ML/msft_tab.csv",header=TRUE,col.names = col_names)
typeof(data)
data[1,1]
#stringAsFactors = TRUE it will the string data as factored column
#blank.lines.skip
#TRUE skip blanklines

#strip.white = TRUE -> Trim the data without quotes 

#quote char -> it ill consider the data inside the quotes to be contained in a single column
#for instance
#if we read comma separated file, if we don't specify the quote char
#"hello, welcome,to india"
#reads the data as 
#"hello 
# welcome
# to
# indi
#specifiying the quote char to be "
# You might have to convert some columns to factors
filename = "C:/Users/balaji.arumugham/Documents/R_ML/R_ML/msft_quote.csv"
file.exists(filename)
data <- read.csv(filename)
data <- read.csv(filename, quote = '"')
data <- read.csv(filename, quote = "'")
#fill 
#fill unequal rows with blank fields
data <- read.csv(filename, quote = '"')
data <- read.csv(filename, quote = '"', fill = FALSE)
filename = "C:/Users/balaji.arumugham/Documents/R_ML/R_ML/msft_extracol.csv"
data <- read.csv(filename, quote = '"')
data <- read.csv(filename, quote = '"', fill = FALSE)


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
file_list = list.dirs("C:\\Test\\")#recursive = TRUE by default
file_list = list.dirs("C:\\Program Files (x86)")
#Function	Description
#list.files	Lists files in a directory.#recursive = FALSE by default
files_list = list.files("c:\\Test\\")
files_list = list.files("C:\\Source\\PythonDSML", pattern ="*.csv",ignore.case = TRUE, recursive = TRUE)


#list.dirs	Lists subdirectories of a directory.
direc = list.dirs("C:\\Source\\PythonDSML",  recursive = TRUE,full.names = TRUE)
print(direc)
#file.exists	Tests whether a specific file exists in a location.
file_exists = file.exists("C:\\Source\\PythonDSML\\PythonPandas/Pandas2ndLevel/data/msft_modified_01.csv")

#file.create	Creates a file.
file.create("C:\\Source\\PythonDSML\\PythonPandas/Pandas2ndLevel/data/msft_modified_21.csv")

file.exists("C:\\Source\\PythonDSML\\PythonPandas/Pandas2ndLevel/data/msft_modified_21.csv")

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