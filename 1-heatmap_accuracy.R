library(readr)
AUC <- read_csv("data/AUC.csv")
pred_df <- read_csv("data/pred_df.csv")
pred_df$new_name = c("LR","DT","RF","AdaBoost","GBDT")
pred_df$new_name = factor(pred_df$new_name, ordered=TRUE, levels=c("LR","DT","RF","GBDT","AdaBoost"))
# rename
pred_df$data_name = factor(rep(c('POI','RN','NTL','POI_RN','POI_NTL','RN_NTL','POI_RN_NTL'),each = 5))
pred_df$data_name = factor(pred_df$data_name, ordered=TRUE, levels=c('POI','RN','NTL','POI_RN','POI_NTL','RN_NTL','POI_RN_NTL'))

pred_df$accuracy = pred_df$accuracy*100
pred_df$AUC = AUC$auc
library(ggplot2)


# Create the ggplot object with the data and the aesthetic mapping:
scatterplot = ggplot(pred_df, aes(x = accuracy, y = f1_score, color = data_name, shape = clf_name))

# Add the geom_point geometry
scatterplot + geom_point()

# rename
pred_df$data_name = factor(rep(c('POI','RN','NTL','POI_RN','POI_NTL','RN_NTL','POI_RN_NTL'),each = 5))

# base heatmap
pred_df$data_name = factor(pred_df$data_name, ordered=TRUE, levels=c('POI','RN','NTL','POI_RN','POI_NTL','RN_NTL','POI_RN_NTL'))
pred_df$clf_name = factor(pred_df$clf_name, ordered=TRUE, levels=c('LogisticRegression','Decision Tree','Random Forest','AdaBoost','GradientBoosting'))

ggplot(pred_df , aes(x = clf_name,y = data_name)) + 
  geom_tile(aes(fill = accuracy*100)) + 
  scale_fill_gradient(name="Accuracy", low="white", high="red") 
  #+ theme(axis.text.x=element_text(angle=45,hjust=1, vjust=1))

## 1 discrete 
pred_df$acc1 <- cut(pred_df$accuracy, breaks = c(-Inf,seq(70,90,0.02),Inf),right = FALSE)
ggplot(pred_df , aes(x = clf_name,y = data_name)) + 
  geom_tile(aes(fill = acc1),colour = "white") +
  scale_fill_brewer(palette = "PRGn", name="Accuracy") +
  geom_text(aes(label=round(accuracy,2)), angle=0, size=4) #显示每个栅格的数值及字体设置 

## 2 continus
# library("scales")
# http://colorbrewer2.org/
p1 = ggplot(pred_df, aes(x = new_name,y = data_name)) + 
  geom_tile(aes(fill = accuracy)) +
  scale_fill_gradientn(colours=c('#762a83','#af8dc3','#e7d4e8','#f7f7f7','#d9f0d3','#7fbf7b','#1b7837'),
                       # values=rescale(seq(0.7,0.9,0.02)),
                       guide="colorbar", name="OA (%)",breaks = seq(70,90,2)) +
  geom_text(aes(label=round(accuracy,0)), angle=0, size=5) + #显示每个栅格的数值及字体设置
  xlab("Classifiers") + ylab("Input Data")
p1
save_name = sprintf("plot/%s.png", "14-1-Acc_heatmap")
ggsave(save_name)

p2 = ggplot(pred_df, aes(x = new_name,y = data_name)) + 
  geom_tile(aes(fill = f1_score)) +
  scale_fill_gradientn(colours=c('#762a83','#af8dc3','#e7d4e8','#f7f7f7','#d9f0d3','#7fbf7b','#1b7837'),
                       # values=rescale(seq(0.7,0.9,0.02)),
                       guide="colorbar", name=expression(F[1]),breaks = seq(0.70,0.90,0.02)) +
  geom_text(aes(label=round(f1_score,2)), angle=0, size=5) + #显示每个栅格的数值及字体设置
  xlab(expression('Classifiers')) + ylab("Input Data")
p2
save_name = sprintf("plot/%s.png", "14-2-f1_heatmap")
ggsave(save_name)

p3 = ggplot(pred_df, aes(x = new_name,y = data_name)) + 
  geom_tile(aes(fill = AUC)) +
  scale_fill_gradientn(colours=c('#762a83','#af8dc3','#e7d4e8','#f7f7f7','#d9f0d3','#7fbf7b','#1b7837'),
                       # values=rescale(seq(0.7,0.9,0.02)),
                       guide="colorbar", name="AUC",breaks = seq(0.82,0.96,0.02)) +
  geom_text(aes(label=round(AUC,2)), angle=0, size=5) + #显示每个栅格的数值及字体设置
  xlab("Classifiers") + ylab("Input Data")
p3
save_name = sprintf("plot/%s.png", "14-3-AUC_heatmap")
ggsave(save_name)

library(ggpubr)
ggarrange(
  p1, p2, p3,
  labels = c("a", "b", "c"),
  ncol = 1, nrow = 3)


### palette
palette("default")
palette(rainbow(6))


# 5. boxplot --------------------------------------------------------------

# classifers
ggplot(pred_df, aes(new_name, accuracy)) +
  geom_boxplot(aes(fill = new_name)) +
  scale_fill_manual(values=c('#377eb8','#4daf4a','#984ea3','#ff7f00','#ffff33'),name="Legend") +
  scale_y_continuous(breaks = seq(70,90,2)) +
  xlab("Classifiers") + ylab("OA (%)")
  # stat_summary(fun.y="mean",geom="point",shape=23,size=3,fill="white")
# theme_bw()+
save_name = sprintf("plot/%s.png", "15-1-Acc_boxplot")
ggsave(save_name)

ggplot(pred_df, aes(new_name, + f1_score)) +
  geom_boxplot(aes(fill = new_name)) +
  scale_fill_manual(values=c('#377eb8','#4daf4a','#984ea3','#ff7f00','#ffff33'),name="Legend") +
  scale_y_continuous(breaks = seq(0.70,0.90,0.02)) +
  xlab("Classifiers") + ylab(expression(F[1]))
  # stat_summary(fun.y="mean",geom="point",shape=23,size=3,fill="white")
# theme_bw()+
save_name = sprintf("plot/%s.png", "15-2-F1_boxplot")
ggsave(save_name)

ggplot(pred_df, aes(new_name, AUC)) +
  geom_boxplot(aes(fill = new_name)) +
  scale_fill_manual(values=c('#377eb8','#4daf4a','#984ea3','#ff7f00','#ffff33'),name="Legend") +
  scale_y_continuous(breaks = seq(0.82,0.96,0.02)) +
  xlab("Classifiers") + ylab("AUC")
  # stat_summary(fun.y="mean",geom="point",shape=23,size=3,fill="white")
  # theme_bw()+
save_name = sprintf("plot/%s.png", "15-3-AUC_boxplot")
ggsave(save_name)

# data

ggplot(pred_df, aes(data_name, accuracy)) +
  geom_boxplot(aes(fill = data_name)) +
  scale_fill_manual(values=c('#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462','#b3de69'),name="Legend") +
  scale_y_continuous(breaks = seq(0.70,0.90,0.02)) +
  xlab("Input Data") + ylab("OA (%)")
# theme_bw()+

ggplot(pred_df, aes(data_name, f1_score)) +
  geom_boxplot(aes(fill = data_name)) +
  scale_fill_manual(values=c('#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462','#b3de69'),name="Legend") +
  scale_y_continuous(breaks = seq(0.70,0.90,0.02)) +
  xlab("Input Data") + ylab(expression(F[1]))
# theme_bw()+

ggplot(pred_df, aes(data_name, AUC)) +
  geom_boxplot(aes(fill = data_name)) +
  scale_fill_manual(values=c('#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462','#b3de69'),name="Legend") +
  scale_y_continuous(breaks = seq(0.70,0.90,0.02)) +
  xlab("Input Data") + ylab("AUC")
# theme_bw()+


