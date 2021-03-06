######GG PLOT
#https://github.com/rstudio/cheatsheets/blob/master/data-visualization-2.1.pdf
##################################################
######### Iris Plotting
################
#http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data
iris <- read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"), header = FALSE)
iris

#iris starts here
library(ggplot2)
#iris <- read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"), header = FALSE)
iris <- read.csv("iris.csv")
####################################################################################################
names(iris) <- c( "Petal.Length", "Petal.Width","Sepal.Length", "Sepal.Width", "Species")
#aes - > aesthetics
ir <- ggplot(iris, aes(x=Petal.Length, y=Petal.Width)) + geom_point(color="red") + geom_smooth(method="lm")  # set se=FALSE to turnoff confidence bands
plot(ir)
#require(ggplot2)
######GG PLOT
# Setup
options(scipen=999)  # turn off scientific notation like 1e+06
library(ggplot2)
midwest_graph  <- data("midwest", package = "ggplot2")  # load the data
nrow(midwest)
ncol(midwest)

# midwest <- read.csv("http://goo.gl/G1K41K") # alt source
plot(midwest_graph)
# Init Ggplot
ggplot(midwest, aes(x=area, y=poptotal))  # area and poptotal are columns in 'midwest'
cols(midwest)
names(midwest)

################################
#Scatter Plotting
library(ggplot2)
a<-ggplot(midwest, aes(x=area, y=poptotal))
plot(a)

b<-ggplot(midwest, aes(x=area, y=poptotal)) + geom_point()

plot(b)

################
#linear plotting
library(ggplot2)
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point(color = "red",shape="hexagon",stroke =6.0) + geom_smooth(method="lm",color="green")  # set se=FALSE to turnoff confidence bands
plot(g)
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point(color = "red",fill="blue",shape="square",stroke =0.2) + geom_smooth(method="lm",color="green")  # set se=FALSE to turnoff confidence bands
plot(g)
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point(color="magenta",shape="circle",stroke =2.0) + geom_smooth(method="lm",color="green")  # set se=FALSE to turnoff confidence bands
plot(g)
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point(color = "green", alpha = 0.5, fill="blue",shape="triangle",stroke =6.0) + geom_smooth(method="lm",color="red")  # set se=FALSE to turnoff confidence bands
plot(g)
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point(color = "green", alpha = 1.0, size = 12.0, fill="blue",shape="circle",stroke =6.0) + geom_smooth(method="lm",color="green")  # set se=FALSE to turnoff confidence bands
plot(g)
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point( alpha = 1.0, fill="red",shape="diamond plus",stroke =6.0) + geom_smooth(method="lm",color="red") +geom_count(1)
plot(g)
#Geom_hex
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_hex(aes(x=area, y=poptotal, fill="brown", alpha= 0.2))# set se=FALSE to turnoff confidence bands
plot(g)
#Geom_line
#https://cran.r-project.org/web/packages/ggplot2/vignettes/ggplot2-specs.html
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point( alpha = 1.0, color="yellow",shape="triangle",stroke =1.0, size=1.0) + geom_line(aes(x=area, y=poptotal, fill="brown", linetype=dashed))# set se=FALSE to turnoff confidence bands
plot(g)
#Alternatively, you can summarise the number of points at each location and display that in some way, using geom_count(), geom_hex(), or geom_density2d().
alpha
##########################################
## aesthetics 
# values for different aesthetics
#https://cran.r-project.org/web/packages/ggplot2/vignettes/ggplot2-specs.html
x 
y
alpha
colour
fill
group
shape
size
stroke
#############################
#Setting Plotting limits
library(ggplot2)
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method="lm")  # set se=FALSE to turnoff confidence bands

#Another technique is to make the points transparent (e.g. geom_point(alpha = 0.05)) or very small (e.g. geom_point(shape = "."))
# Delete the points outside the limits
g <- g + xlim(c(0.0125, 0.1051)) + ylim(c(0, 2500000))   # deletes points
plot(g)
# g + xlim(0, 0.1) + ylim(0, 1000000)   # deletes points
g <- g + xlim(c(0, 0.5)) + ylim(c(0, 200000))   # deletes points
plot(g)

g <- g + xlim(c(0, 0.1)) + ylim(c(0, 500000))
plot(g)

##########
#Changing the limits using zoom options
library(ggplot2)
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method="lm")  # set se=FALSE to turnoff confidence bands
# Zoom in without deleting the points outside the limits.
# As a result, the line of best fit is the same as the original plot.
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method="lm") + coord_cartesian(xlim=c(0,0.05), ylim=c(0, 200000))
plot(g)
#g <- g + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 200000))  # zooms in

g <- g + coord_cartesian(xlim=c(0,0.1051), ylim=c(0, 200000))  # zooms in
plot(g)

g <- g + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 5000000))  # zooms in
plot(g)

g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method="lm")
plot(g)

g + xlim(c(0, 0.1)) + ylim(c(0, 500000))   # deletes points
g + xlim(c(0, 0.1)) + ylim(c(0, 5000000))   # deletes points
plot(g)

g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method="lm")
g <- g + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 500000))  # zooms in
plot(g)
g <- g + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000))  # zooms in
plot(g)



######################################
g1 <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method="lm")
plot(g1)

# Add Title and Labels
g1 <- g1 + labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")
plot(g1)

# or

g1 <- g1 + ggtitle("Area Vs Population1", subtitle="From midwest dataset1") + xlab("Area1") + ylab("Population1") 
plot(g1)
######################################
### Changing Color and Size
library(ggplot2)
g <- ggplot(midwest, aes(x=area, y=poptotal)) +
  geom_point(col="blue", shape="diamond open", size=3) +   # Set static color and size for points
  geom_smooth(method="auto", col="firebrick") +  # change the color of line
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) +
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")
plot(g)
#"auto", "lm", "glm", "gam", "loess" 
#auto picks one among those 4 methods above suiting the dat
#changing various Methods 
library(ggplot2)
ggplot(midwest, aes(x=area, y=poptotal)) +
  geom_point(col="red", size=3, shape="bullet") +   # Set static color and size for points
  geom_smooth(method="loess", col="firebrick") +  # change the color of line
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) +
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

library(ggplot2)
ggplot(midwest, aes(x=area, y=poptotal)) +
  geom_point(col="yellow", size=3) +   # Set static color and size for points
  geom_smooth(method="loess", col="firebrick") +  # change the color of line
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) +
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

#W###########################
### Changing Color and Size
library(ggplot2)
midwest
gg <- ggplot(midwest, aes(x=area, y=poptotal)) +
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) +
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) +
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")
plot(gg)
#########################################
gg <- gg + theme(legend.position="None")  # remove legend
plot(gg)
gg <- gg + theme(legend.position="left")
plot(gg)
gg <- gg + theme(legend.position="right")
plot(gg)
gg <- gg + theme(legend.position="top")
plot(gg)
gg <- gg + theme(legend.position="bottom")
plot(gg)
plot(gg)

gg <- gg + scale_colour_brewer(palette = "set1", direction = 1)  # change color palette #palette fro 1 to 1024
plot(gg)
gg <- gg + scale_colour_brewer(palette = "set5")  # change color palette
plot(gg)
gg <- gg + scale_colour_brewer(palette = 13)  # change color palette
plot(gg)
gg <- gg + scale_colour_brewer(palette = 18)  # change color palette
plot(gg)
#########################################
#How to Change the X and Y Axis Text and its Location?

# Base plot
gg <- ggplot(midwest, aes(x=area, y=poptotal)) +
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) +
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) +
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

plot(gg)

# Change breaks
#changing the scale
gg <- gg + scale_x_continuous(breaks=seq(0, 0.1, 0.01))
gg <- gg + scale_y_continuous(breaks=seq(0, 1000000, 200000))
plot(gg)
#################
#Changing X and Y Scale
# Base Plot
gg <- ggplot(midwest, aes(x=area, y=poptotal)) +
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) +
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) +
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

# Change breaks + label
gg <- gg + scale_x_continuous(breaks=seq(0, 0.1, 0.01))
plot(gg)
gg <- gg + scale_x_continuous(breaks=seq(0, 0.1, 0.01), labels = month.abb[1:11])
plot(gg)
gg <- gg + scale_y_continuous(breaks=seq(0, 1000000, 50000))
plot(gg)
gg <- gg + scale_y_continuous(breaks=seq(0, 1000000, 250000), labels = letters[1:5])
plot(gg)
##################################
# Reverse X Axis Scale
gg <- gg + scale_x_reverse()
plot(gg)
gg <- gg + scale_y_reverse()
plot(gg)

#################################
##Using Theme
library(ggplot2)

# Base plot
gg <- ggplot(midwest, aes(x=area, y=poptotal)) +
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) +
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) +
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

gg <- gg + scale_x_continuous(breaks=seq(0, 0.1, 0.01))
plot(gg)
# method 1: Using theme_set()
gg <- gg + theme_set(theme_classic())  # not run
plot(gg)

# method 2: Adding theme Layer itself.
gg <- gg + theme_bw() + labs(subtitle="BW Theme")
plot(gg)
gg + theme_classic() + labs(subtitle="Classic Theme")
#https://www.rdocumentation.org/packages/ggplot2/versions/3.2.0/topics/theme
gg1 <- gg + theme(panel.background = element_rect(fill = "white", colour = "blue"))
plot(gg1)
gg + theme(panel.border = element_rect(linetype = "dashed", fill = NA))
gg + theme(panel.grid.major = element_line(colour = "yellow"))
#geom_bar
gg <- gg + geom_bar(position = "fill")
plot(gg)



library(plotly)
x <- c(1:100)
random_y <- rnorm(100, mean = 0)
data <- data.frame(x, random_y)

p <- plot_ly(data, x = ~x, y = ~random_y, type = 'scatter', mode = 'lines')

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="line-basic")
chart_lin
