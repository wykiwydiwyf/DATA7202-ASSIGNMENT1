#using non-replacement sampling

bank_train_raw= read.csv("bank-additional-full.csv",sep = ";")

bank_train = bank_train_raw[sample(nrow(bank_train_raw),size = 2000,replace = FALSE), ]

#   The aim of this analysis is to predict whether or not a client will agree to deposit and
#   the length of phone call. By analyzing our train dataset, "duration" represent length of phone call and
#   "y" represent whether or not client agrees the deposit.
#   Also note that the value of "y" is highly depends on the value of "duration". So firstly we should
#   build predictive models between "duration" and other variables beside "y", then build another
#   predictive models between "y" and other varibles including "duration".
#   Let's verify the statement above

library(ggplot2)

ggplot(bank_train,aes(x = duration,y = y,color = y))+
geom_jitter(color = "#FF9999",size = 1)+
ggtitle("Relation Between 'Duration' and 'y'")+
xlab("Duration")+
ylab("y")

#   From the plot we can see that people who refused to make a deposit mostly have very short phone call length
#   (below 300 sec). So, yes, "y" is highly affected by "Duration"
#-------------------------------------------------------------------------------------------------
#  Missing value analysis
