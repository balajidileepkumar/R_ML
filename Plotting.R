#require(ggplot2)
######GG PLOT
# Setup
options(scipen=999)  # turn off scientific notation like 1e+06
library(ggplot2)
data("midwest", package = "ggplot2")  # load the data
# midwest <- read.csv("http://goo.gl/G1K41K") # alt source

# Init Ggplot
ggplot(midwest, aes(x=area, y=poptotal))  # area and poptotal are columns in 'midwest'

####################
#http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data
iris <- read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"), header = FALSE)
iris
############
#Scatter Plotting
library(ggplot2)
a<-ggplot(midwest, aes(x=area, y=poptotal))
plot(a)

b<-ggplot(midwest, aes(x=area, y=poptotal)) + geom_point()

plot(b)

################
#linear plotting
library(ggplot2)
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method="lm")  # set se=FALSE to turnoff confidence bands
plot(g)
################
#iris starts here

library(ggplot2)
#iris <- read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"), header = FALSE)
iris <- read.csv("iris.csv")

names(iris) <- c( "Petal.Length", "Petal.Width","Sepal.Length", "Sepal.Width", "Species")
ir <- ggplot(iris, aes(x=Petal.Length, y=Petal.Width)) + geom_point() + geom_smooth(method="lm")  # set se=FALSE to turnoff confidence bands
plot(ir)

#############################
#Setting Plotting limits
library(ggplot2)
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method="lm")  # set se=FALSE to turnoff confidence bands

# Delete the points outside the limits
g + xlim(c(0, 0.1)) + ylim(c(0, 1000000))   # deletes points
# g + xlim(0, 0.1) + ylim(0, 1000000)   # deletes points
g + xlim(c(0, 0.1)) + ylim(c(0, 200000))   # deletes points
g + xlim(c(0, 0.1)) + ylim(c(0, 500000))
plot(g)

##########
#Changing the limits using zoom options
library(ggplot2)
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method="lm")  # set se=FALSE to turnoff confidence bands
# Zoom in without deleting the points outside the limits.
# As a result, the line of best fit is the same as the original plot.
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method="lm") + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 200000))

#g <- g + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 200000))  # zooms in

g <- g + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 200000))  # zooms in

g <- g + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 5000000))  # zooms in

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



plot(g1)
######################################

# Add Title and Labels
g1 + labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

# or

g1 + ggtitle("Area Vs Population1", subtitle="From midwest dataset1") + xlab("Area1") + ylab("Population1")
plot(g1)
######################################
### Changing Color and Size
library(ggplot2)
ggplot(midwest, aes(x=area, y=poptotal)) +
  geom_point(col="yellow", size=3) +   # Set static color and size for points
  geom_smooth(method="lm", col="firebrick") +  # change the color of line
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) +
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

#W###########################
### Changing Color and Size
library(ggplot2)
gg <- ggplot(midwest, aes(x=area, y=poptotal)) +
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) +
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) +
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")
plot(gg)
#########################################
gg + theme(legend.position="None")  # remove legend
gg + theme(legend.position="left")
plot(gg)

gg + scale_colour_brewer(palette = "Set2")  # change color palette
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
gg + scale_x_continuous(breaks=seq(0, 0.1, 0.01))
#################
#Changing Labels
# Base Plot
gg <- ggplot(midwest, aes(x=area, y=poptotal)) +
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) +
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) +
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

# Change breaks + label
gg + scale_x_continuous(breaks=seq(0, 0.1, 0.01), labels = month.abb[1:11])

gg + scale_x_continuous(breaks=seq(0, 0.1, 0.01), labels = LETTERS[1:11])

plot(gg)
##################################
#Reverse the axis
library(ggplot2)
gg <- ggplot(midwest, aes(x=area, y=poptotal)) +
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) +
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) +
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

# Reverse X Axis Scale
gg + scale_x_reverse()
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

# method 1: Using theme_set()
theme_set(theme_classic())  # not run
gg

# method 2: Adding theme Layer itself.
gg + theme_bw() + labs(subtitle="BW Theme")

gg + theme_classic() + labs(subtitle="Classic Theme")
