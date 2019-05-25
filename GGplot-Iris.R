
library(ggplot2)

iris <- read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"), header = FALSE)
names(iris) <- c( "Petal.Length", "Petal.Width","Sepal.Length", "Sepal.Width", "Species")
#iris
IrisPlot <-ggplot(iris, aes(x=Petal.Length, y=Petal.Width))
plot(IrisPlot)

#PetalPlot<-ggplot(iris, aes(x=Petal.Length, y=Petal.Width)) + geom_point()
#plot(PetalPlot)
IrisPlot <- IrisPlot +  geom_point()
plot(IrisPlot)


################
#linear plotting
IrisPlot <- IrisPlot +  geom_point() +  geom_smooth(method="lm")  # set se=FALSE to turnoff confidence bands
plot(IrisPlot)
# Delete the points outside the limits

IrisPlot <- IrisPlot + xlim(c(5.0, 7.0)) + ylim(c(2.5, 3.5))   #  deletes points
plot(IrisPlot)

IrisPlot <- IrisPlot + xlim(c(0.0, 8.0)) + ylim(c(0.0, 8.0))   #  deletes points
plot(IrisPlot)
################
#Zooming In
#Reassign the Iris data since it's already been eliminated by some limits'

IrisPlot <-ggplot(iris, aes(x=Petal.Length, y=Petal.Width))   +  geom_point() +  geom_smooth(method="lm")

plot(IrisPlot)

IrisPlot <- IrisPlot + coord_cartesian(xlim=c(2.0, 7.0), ylim=c(0.5, 3.5))  # zooms in   # set se=FALSE to turnoff confidence bands

IrisPlot <- IrisPlot + coord_cartesian(xlim=c(2.0, 7.0), ylim=c(0.5, 3.5))  # zooms in   # set se=FALSE to turnoff confidence bands

plot(IrisPlot)
################
#
# Add Title and Labels
IrisPlot <- IrisPlot + labs(title="PetalLength Vs PetalWidth", subtitle="From Iris Dataset", y="Petal Width of the flower", x="Petal Length of the flower", caption="PetalLengthWidhtRatioPoints")

# or

IrisPlot <- IrisPlot + ggtitle("Petal Length Vs Petal Width", subtitle="From Iris Dataset") + xlab("Petal Length of the flower") + ylab("Petal Width of the flower")
plot(IrisPlot)

################
#Adding color based on column
IrisPlot <- IrisPlot +  geom_point(aes(col=Species), size=3)
plot(IrisPlot)

#setting up themes
IrisPlot <- IrisPlot + theme(legend.position="None")  # remove legend
plot(IrisPlot)

IrisPlot <- IrisPlot + theme(legend.position="bottom")
plot(IrisPlot)

IrisPlot <- IrisPlot + theme(legend.position="left")
plot(IrisPlot)
################
#changing color palette
IrisPlot <- IrisPlot + scale_colour_brewer(palette = "Set1")  # change color palette
plot(IrisPlot)
################
#changing color x coordinate sequence
#IrisPlot  <- IrisPlot  + scale_x_continuous(breaks=seq(0, 0.1))
plot(IrisPlot)
################
# Reverse axis for petal length
IrisPlot  <- IrisPlot  + scale_x_reverse()
plot(IrisPlot)

################
#Setting up themes
IrisPlot <- IrisPlot  + theme_classic() + labs(subtitle="Classic Theme")
plot(IrisPlot)

IrisPlot <- IrisPlot  + theme_dark() + labs(subtitle="Classic Theme")
plot(IrisPlot)

IrisPlot <- IrisPlot  + theme_linedraw() + labs(subtitle="Classic Theme")
plot(IrisPlot)


################
# Adding a line chart
IrisPlot <- IrisPlot +  geom_point(col="purple",size=4) + geom_line()
plot(IrisPlot)

#theme_linedraw

#################
IrisBoxPlot  <- ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))
plot(IrisBoxPlot)

IrisBoxPlot  <- ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_boxplot()
plot(IrisBoxPlot)

IrisBoxPlot  <- ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_boxplot(aes(colour = Species))
plot(IrisBoxPlot)

IrisBoxPlot  <- ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_boxplot(aes(colour = Sepal.Length))
plot(IrisBoxPlot)

IrisBoxPlot  <- ggplot(iris, aes(x=Species, y=Sepal.Width)) + geom_boxplot(aes(colour = Sepal.Length))
plot(IrisBoxPlot)


IrisPlot <- IrisPlot  + geom_boxplot(outlier.colour = "red", outlier.shape = 1)
plot(IrisPlot)
####################
#Geom contour and geom tile
IrisContourPlot <- ggplot(iris, aes(Sepal.Length, Petal.Length)) + geom_density_2d()
plot(IrisContourPlot)

