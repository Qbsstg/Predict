# 七月预测
# trainFile <- read.csv("E:/电无忧/项目/20220810-国能软件需求/电无忧-预测模型/数据处理/2022-7-tran-data.csv", header = TRUE, sep = ",", quote="\"", dec=".", fill = TRUE, comment.char="");
predictFile <- read.csv("E:/电无忧/项目/20220810-国能软件需求/电无忧-预测模型/数据处理/2022-7-predict7-feather.csv", header = TRUE, sep = ",", quote="\"", dec=".", fill = TRUE, comment.char="");

# 八月预测
#trainFile <- read.csv("E:/电无忧/项目/20220810-国能软件需求/电无忧-预测模型/数据处理/2022-8-tran-data.csv", header = TRUE, sep = ",", quote="\"", dec=".", fill = TRUE, comment.char="");
#predictFile <- read.csv("E:/电无忧/项目/20220810-国能软件需求/电无忧-预测模型/数据处理/2022-8-predict10-feather.csv", header = TRUE, sep = ",", quote="\"", dec=".", fill = TRUE, comment.char="");


# trainData <- trainFile[,c(-1)]
featureData <- predictFile[,c(-1)]

#print(trainData)
#print(featureData)

# install.packages("glmnet")
library(glmnet)

formulaStr <- "total~."
model <- lm(as.formula(formulaStr),trainData)

summary(model)

# regressData <- predict(model,trainData,level=0.95,se.fit=FALSE)
#plot.ts(regressData)
predictData <- predict(model,featureData,level=0.95,se.fit=FALSE)
predictData <- t(predictData)
#plot.ts(predictData)

print(predictData)

#绘制回归对比折线图
library(ggplot2)
library(reshape2)
realData <- trainData$total
day <- c(1:length(regressData))
ggptdata <- cbind(day,regressData,realData)
ggptdata <- data.frame(ggptdata)
emp <- melt(ggptdata, id = "day",measure = c("regressData", "realData"))
qplot(day,value,data=emp,geom=c("line", "point"),color=variable,linetype = variable, main="geom=c(\"line\", \"point\")")


