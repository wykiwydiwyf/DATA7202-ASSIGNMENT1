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


ggplot(bank_train_raw,aes(x = y,y = duration,color = y))+
geom_boxplot(color = "#FF9999")+
ggtitle("Relation Between 'Duration' and 'Agree deposit(y)'")+
xlab("Agree deposit(y)")+
ylab("Duration")+
ylim(0,1000)

  
head(bank_train_raw)

#   From the plot we can see that people who refused to make a deposit mostly have very short phone call length
#   (below 300 sec). So, yes, "y" is highly affected by "Duration"
#-------------------------------------------------------------------------------------------------
#  Missing value analysis
which(!complete.cases(bank_train_raw))

ggplot(bank_train_raw,aes(x = age,y = duration))+
  geom_jitter(color = "#FF9999",size = 1)+
  geom_smooth()+
  ggtitle("Relation Between 'Duration' and 'Age'")+
  xlab("Age")+
  ylab("Duration")+
  facet_wrap(~job)+
  ylim(0,2000)


ggplot(bank_train_raw,aes(x = marital,y = duration))+
  geom_boxplot(color = "#FF9999")+
  ggtitle("Relation Between 'Duration' and 'Age'")+
  xlab("Age")+
  ylab("Duration")+
  ylim(0,500)

ggplot(bank_train_raw,aes(x = education,y = duration))+
  geom_boxplot(color = "#FF9999")+
  ggtitle("Relation Between 'Duration' and 'Age'")+
  xlab("Age")+
  ylab("Duration")+
  ylim(0,500)


ggplot(bank_train_raw,aes(x = default,y = duration))+#******
  geom_boxplot(color = "#FF9999")+
  ggtitle("Relation Between 'Duration' and 'Age'")+
  xlab("Age")+
  ylab("Duration")+
  ylim(0,500)

ggplot(bank_train_raw,aes(x = housing,y = duration))+
  geom_boxplot(color = "#FF9999")+
  ggtitle("Relation Between 'Duration' and 'Age'")+
  xlab("Age")+
  ylab("Duration")+
  ylim(0,500)


ggplot(bank_train_raw,aes(x = contact,y = duration))+
  geom_boxplot(color = "#FF9999")+
  ggtitle("Relation Between 'Duration' and 'Age'")+
  xlab("Age")+
  ylab("Duration")+
  ylim(0,500)



ggplot(bank_train_raw,aes(x = age,y = duration,color = month))+
  geom_jitter(size = 1,aes(fill = month))+
  geom_smooth(size =1,data = subset(bank_train_raw,month == "apr"))+
  geom_smooth(size =1,data = subset(bank_train_raw,month == "aug"))+
  geom_smooth(size =1,data = subset(bank_train_raw,month == "dec"))+
  geom_smooth(size =1,data = subset(bank_train_raw,month == "jul"))+
  geom_smooth(size =1,data = subset(bank_train_raw,month == "jun"))+
  geom_smooth(size =1,data = subset(bank_train_raw,month == "mar"))+
  geom_smooth(size =1,data = subset(bank_train_raw,month == "may"))+
  geom_smooth(size =1,data = subset(bank_train_raw,month == "nov"))+
  geom_smooth(size =1,data = subset(bank_train_raw,month == "oct"))+
  geom_smooth(size =1,data = subset(bank_train_raw,month == "sep"))+
  ggtitle("Relation Between 'Duration' and 'Age'")+
  xlab("Age")+
  ylab("Duration")+
  ylim(0,2000)

ggplot(bank_train_raw,aes(x = month,y = duration))+
  geom_boxplot(color = "#FF9999")+
  ggtitle("Relation Between 'Duration' and 'Age'")+
  xlab("Age")+
  ylab("Duration")+
  ylim(0,500)

ggplot(bank_train_raw,aes(x = day_of_week,y = duration))+
  geom_boxplot(color = "#FF9999")+
  ggtitle("Relation Between 'Duration' and 'Age'")+
  xlab("Age")+
  ylab("Duration")+
  ylim(0,500)


