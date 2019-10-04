install.packages("readr")
library(readr)

IrisDataset <- read.csv("C:\\Users\\nisso\\Desktop\\All Ubiqum\\Module 2 - Task 1\\R Tutorial Data Sets\\iris.csv")
attributes(IrisDataset)
summary(IrisDataset)
str(IrisDataset)
names(IrisDataset)

hist(IrisDataset$Sepal.Length)
plot(IrisDataset$Sepal.Length)

IrisDataset$Species <- as.numeric(IrisDataset$Species)
qqnorm(IrisDataset$Species)

set.seed(123)
trainSize <- round(nrow(IrisDataset) * 0.2)
testSize <- nrow(IrisDataset) - trainSize
trainSize
testSize
training_indices <- sample(seq_len(nrow(IrisDataset)), size=trainSize)
trainSet <- IrisDataset[training_indices, ]
testSet <- IrisDataset[-training_indices, ]

LinearModel <- lm(Petal.Length ~ Petal.Width, data = trainSet)
summary(LinearModel)

prediction <- predict(LinearModel,testSet)
prediction

plot(testSet$Petal.Width,prediction)
plot(testSet$Petal.Width,testSet$Petal.Length)
abline(LinearModel)
