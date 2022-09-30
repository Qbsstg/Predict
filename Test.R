# data <- read.csv("C:/Users/wuyan/Desktop/powerUsePredict/powerUsePredict/test.csv",encoding="UTF-8")
#
# newData <- data[,c(-1)]
#
# print(data)
# print(newData)
#
# library(glmnet)

# f <- "total~."
# print(as.formula(f))

# 已有300天的太阳能数据
# predictFile <- read.csv("C:/Users/wuyan/Desktop/powerUsePredict/powerUsePredict/data1/sunshine.csv")

# trainfile <- read.csv("C:/Users/wuyan/Desktop/powerUsePredict/powerUsePredict/data1/sunshine.csv",header = TRUE,sep = ",",quote = "\"",fill = TRUE,comment.char = "")
# featureData1 <- read.csv("C:/Users/wuyan/Desktop/powerUsePredict/powerUsePredict/data1/temp.csv",header = TRUE,sep = ",",quote = "\"",fill = TRUE,comment.char = "")
# featureData2 <- read.csv("C:/Users/wuyan/Desktop/powerUsePredict/powerUsePredict/data1/wind.csv",header = TRUE,sep = ",",quote = "\"",fill = TRUE,comment.char = "")

trainFile <- read.csv("C:/Users/wuyan/Desktop/powerUsePredict/powerUsePredict/data1/111.csv", header = TRUE, sep = ",", quote = "\"", fill = TRUE, comment.char = "")
predictFile <- read.csv("C:/Users/wuyan/Desktop/powerUsePredict/powerUsePredict/data1/predictFile.csv", header = TRUE, sep = ",", quote = "\"", fill = TRUE, comment.char = "")

# print(trainFile)

trainData <- trainFile
predictData <- predictFile

# print(trainData)

library(glmnet)
model <- lm(Radiation ~ Hour + Temp + Dir + Spd, data = trainData)
summary(model)

result <- predict(model, predictData, level = 0.99, se.fit = FALSE)

print(result)

write.csv(result, "C:/Users/wuyan/Desktop/powerUsePredict/powerUsePredict/data1/result.csv")

