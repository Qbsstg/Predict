x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)

relation <- lm(y~x)

a <- data.frame(x = 170)
result <- predict(relation,a)
print(result)

png(file = "linshi.png")

plot(y,x,col = "blue",main = "Height",abline(lm(x~y)),cex = 1.3,pch=16,xlab="Wight",ylab = "Height")

dev.off()