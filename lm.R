## Linear Regression

x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)

# Apply the lm() function.
relation <- lm(y~x)

print(summary(relation))


iris
# Apply the lm() function.
relation <- lm(Petal.Length~Petal.Width)

print(summary(relation))

a <- data.frame(x = 6.5)
result <-  predict(relation,a)
print(result)

png(file = "linearregression.png")

# Plot the chart.
plot(y,x,col = "blue",main = "Height & Weight Regression",
     abline(lm(x~y)),cex = 1.3,pch = 16,xlab = "Petal Length",ylab = "Petal Width")

# Save the file.
dev.off()
