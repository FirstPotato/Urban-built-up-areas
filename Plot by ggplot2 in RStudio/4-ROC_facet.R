
library(readr)
library(ggplot2)
library("plotROC")
library(reshape2)
GT <- read_csv("data/Ground_truth.csv")
proba1 <- read_csv("data/pred_proba1_test.csv")
proba_new = data.frame(proba = unlist(proba1))
proba_new$Test = rep(GT[GT$Train_Test == 1,]$Target,35)
data_name = c('POI','RN','NTL','POI_RN','POI_NTL','RN_NTL','POI_RN_NTL')
clf_name = c('LR','DT','RF','AdaBoost','GBDT')
proba_new$data_name = rep(data_name, each = 5*171791)
proba_new$clf_name = rep(rep(clf_name, each = 171791),7)

# rename
proba_new$data_name = factor(proba_new$data_name, ordered=TRUE, levels=rev(c('POI','RN','NTL','POI_RN','POI_NTL','RN_NTL','POI_RN_NTL')))
proba_new$clf_name = factor(proba_new$clf_name, ordered=TRUE, levels=c("LR","DT","RF","GBDT","AdaBoost"))


p = ggplot(proba_new, aes(d=Test, m = proba)) +
  # geom_roc(cutoffs.at=seq(0.3,0.7,by=0.2)) +
  geom_roc(n.cuts = 0) +
  ggsci::scale_color_lancet() +
  scale_x_continuous(breaks = seq(0,1,by=0.2)) +
  scale_y_continuous(breaks = seq(0,1,by=0.2)) +
  xlab("FPR") +
  ylab("FPR")

# p + facet_grid(vars(data_name))
# p + facet_grid(vars(data_name),vars(clf_name))

# p + facet_wrap(data_name~clf_name) # single
p + facet_grid(data_name~clf_name) # rows x cols
ggsave("plot/15-ROC_T2.png", width = 6.5, height = 9.5)





