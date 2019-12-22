library(readr)
library(ggplot2)
library("reshape2")
POIP<- read_csv("data/POI_Proportion.csv")
POIP$Category
POIP$Category = factor(POIP$Category, ordered=TRUE, levels=POIP$Category)

data = melt(POIP,id="Category")

p <- ggplot(data, aes(Category,value,fill = variable)) +
  geom_bar(stat="identity",position = position_stack(reverse = TRUE)) +
  theme(legend.position = "top") +
  guides(fill=guide_legend(title=NULL)) +
  coord_flip() +
  scale_y_continuous(breaks = seq(0,100,by=10)) +
  scale_fill_manual(values=c("#0571b0","#e66101")) +
  xlab("") +
  ylab("Proportion (%)")
p
ggsave("plot/POI_Proportion.png", width = 5.5, height = 4.5)
