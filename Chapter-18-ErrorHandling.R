#Error Handling
#warning(.) - generates warnings
#error()- provides method to handle errors 
#stop(.) - generates errors
#suppressWarnings(expr) - evaluates expression and ignores any warnings
#tryCatch(.) - evaluates code and assigns exception handlers

inputs = list(1, 2, 4, -5, 'oops', 0, 10)
for(input in inputs) {
tryCatch(print(paste("log of", input, "=", log(input))),
warning = function(w) {print(paste("negative argument", input));log(-input)},
error = function(e) {print(paste("non-numeric argument", input));NaN}
)}

###################################################################
robustLog = function(x) {
  tryCatch(stop(x),
  warning = function(w) {print(paste("negative argument", x)); log(-x)},
  error = function(e) {print(paste("error Occured", x)); NaN}) 
}
for(input in inputs) {
  print(paste("robust log of", input, "=", robustLog(input)))
}
###################################################################
check_value <- function(x){if(x>10) {"success"} else {stop(x)}}
check_value(20)
##########################
check_value(9)
inputs_2 = list(11,12,14,9)
robustLog = function(x) {
  tryCatch(check_value(x),
           warning = function(w) {print(paste("negative argument", x, w)); log(-x)},
           error = function(e) {print(paste("error Occured", x, e)); NaN}) 
}
for(input in inputs_2) {
  print(paste("robust log of", input, "=", robustLog(input)))
}
###################################################################
check_value(9)
inputs_2 = list(11,12,14,9)
robustLog = function(x) {
  tryCatch(check_value(x),
           warning = function(w) {print(paste("negative argument", x, w)); log(-x)},
           error = function(e) {print(paste("error Occured", x, e)); NaN} )
           #suppressWarnings({"Ignore"}))
}
for(input in inputs_2) {
  print(paste("robust log of", input, "=", robustLog(input)))
}
######################################################
robustLog = function(x) {
  tryCatch(log(x),
  warning = function(w) {print(paste("negative argument", x)); log(-x)},
  error = function(e) {print(paste("non-numeric argument", x)); NaN}) 
}
for(input in inputs) {
print(paste("robust log of", input, "=", robustLog(input)))
}

expensiveBigLibraryFunction <- function(x,
  warning=function(w) {
  print(paste('warning:',w)); 
  browser()},
  error=function(e) {  print(paste('e:',e));  browser()}) 
  {
  print(paste("big expensive step we don't want to repeat for x:",x))
  z <- x  # the "expensive operation" 
  # (not really, just standing in for computation)
  repeat 
  withRestarts(
  withRestarts(
  tryCatch(   # you could call withCallingHandlers 
            # with identical arguments here, too
                {
                       print(paste("attempt cheap operation for z:",z))
                       return(log(z))
                  },
                      warning = warning,
                       error = error ),
                  flipArg = function() {z <<- -z} ),
              zapOutArg = function() {z <<- 1} )
}




######################################################################################################################################
###################################################################
#DateTime Functions
dob = as.Date("25/04/1991", format = "%d,%m,%y")
typeof(dob)
d<- date()
typeof(d)

Sys.Date()
current_date <- Sys.Date()
current_date <- format(Sys.Date(), "%a %b %d %m %H:%M:%S %Y")

dob = strptime("25-06-1991-23", "%d-%m-%Y-%H")
typeof(dob)

result_date <- as.Date("25-06-1991", "%d-%m-%Y")
result_formatted = strftime(result_date,"%d-%Y-%m:%H")
result_formatted

