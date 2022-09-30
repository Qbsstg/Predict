library(ggplot2)

pathTemplate <- "E:/电无忧/项目/20220810-国能软件需求/电无忧-预测模型/数据处理/20220"

dailyDataFrame <- c()

for (i in 1:8) {
  dailyData <- read.table(paste(pathTemplate,i,".csv", sep=""), header=TRUE, sep=",")
  
  # 剔除前104组大客户
  predictDailyData <- dailyData[dailyData[,1] > 104,]
  # 剔除客户id
  predictDailyData <- predictDailyData[,-(1)]
  # 将矩阵中的NA置为0，否则无法求和
  predictDailyData[is.na(predictDailyData)] <- 0
  
  dailyDataFrame <- cbind(dailyDataFrame, colSums(predictDailyData))
  
}

dailyDataFrame <- t(dailyDataFrame)
rownames(dailyDataFrame) <- c("一月","二月","三月","四月","五月","六月","七月","八月")
data(dailyDataFrame)

print(dailyDataFrame)
plot(dailyDataFrame,ylab='Usage') 

#write.table(dailyDataFrame, file = "E:/电无忧/项目/20220810-国能软件需求/电无忧-预测模型/数据处理/2022.csv", row.names = FALSE, sep=",")


