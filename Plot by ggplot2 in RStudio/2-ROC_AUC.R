library(readr)
GT <- read_csv("data/Ground_truth.csv")
proba1 <- read_csv("data/pred_proba1_test.csv")

Test = GT[GT$Train_Test == 1,]$Target
y = rowMeans(proba1[,seq(1,35,5)])

library(ROCR)
predROCR = prediction(y, Test)
perfROCR = performance(predROCR, "tpr", "fpr")
# plot(perfROCR, colorize=TRUE)
# Add threshold labels 
#text.adj=c(-0.2,1.7)  position of seq   adj oppsit actual X Y
plot(perfROCR, col="grey78", print.cutoffs.at=seq(0.3,0.7,by=0.2), text.adj=c(-0.2,1.7))

# Compute AUC
as.numeric(performance(predROCR, "auc")@y.values)
#This will give us the AUC value on our testing set.
#So we have an AUC of about 74% on our test set,
#which means that the model can differentiate between low risk
#patients and high risk patients pretty well.

library(ggplot2)
ggplot(data=perfROCR, aes(x=perfROCR@x.values,y=perfROCR@y.values)) + geom_point()
data = data.frame()
geom_line(dataaes(x=perfROCR@x.values,y=perfROCR@y.values))

# install.packages("plotROC")
library("plotROC")
data = data.frame(A1=Test,A2=y)
ggplot(data, aes(x = A2, y = A1)) + geom_roc()
