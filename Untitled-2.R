# 读取csv文件
data <- read.csv("E:/wuyan/Documents/OneDrive/桌面/test.csv", encoding="UTF-8")

# 输出csv文件
print(data)

# 查看是否有数据框
print(is.data.frame(data))

# 列数
print(ncol(data))

# 行数
print(nrow(data))

# 返回某一列最大的值
like <- max(data$likes)
print(like)

# 返回likes为222的数据
retval <- subset(data,likes == 222)
print(retval)

# 多条件筛选
retval <- subset(data,likes > 1 & name =='Runoob')
print(retval)

# 生成新的文件
retval <- subset(data,likes == 222)
newPath <- "E:/wuyan/Documents/OneDrive/桌面/runoob.csv"
write.csv(retval,newPath,row.names = FALSE)
newdata <- read.csv(newPath)
print(newdata)