#Statistical Data Analysis - ITC 255 
# DR. Asadullah Jawid
# Hasibullah Amanzay - 45323 - 2022.12.26

# In this project, we have to variables on which I have generated random data as my sample
# 1. Y = On Time Or Late  Dependent vaue
# 2. X = Daily rainfall in mm Independent value 

# Mean of daily rainfall = 3
# Standard deviation = 1.1

# For this project I am generating data and use it as a sample of the population by using rbinom and rnorm:


OnTimeOrLate = rbinom(1000, size=1, prob=0.5)
daily = abs(round(rnorm (1000, mean=3, sd=1.1),2))

# 

t = data.frame(a = OnTimeOrLate, b = daily)


tabletime=table(t$a)
tabletime=as.data.frame(tabletime)
colnames(tabletime)=c('onTimeOrLate', 'Count')

g0=ggplot(tabletime, aes(x=onTimeOrLate, y=Count, fill=onTimeOrLate))
g0+geom_bar(stat='identity')+
  theme_classic()+
  theme(legend.position = '')+
  theme(axis.title.x = element_text(),
        axis.title.y = element_text(),
        plot.title = element_text(face = 'bold', hjust=.3))+
  ggtitle('Time Distribution')+
  geom_text(aes(label=Count), vjust=2)+
  scale_fill_manual(values=c('#EAA697', '#E3EC98'))
ggsave('TimeBar.png')

## Linear model
liner_model = glm(t$a~t$b, family = 'binomial')
summary (liner_model)


#p value = 0.01570
#bHat = -0.14088
#AHat = 0.51433
#Bhat is lesser than 0 which is means that there is an indirect effect of X on Y
#Alpha = 0.05
#P value < Alpha, therefore we rejected H0
#There is 1 percent possibility of rejecting the correct H0

#H0 says b=0  meaning that there is no effect of Daily Rainfall on  Arriving On Time or Late. 
#• H1 says b>0 meaning that there is direct relationship between  Rainfall and Arriving On Time Or Late
#X value


# Two way Table FDT
abs = table(t$b)
relfrq = round(prop.table(abs)*100,2)
cumfreq = cumsum(relfrq)
RainfallFDT = cbind(abs,relfrq,cumfreq)
head(RainfallFDT)

## Visual representation of variables
## Probabality of Success

library(tidyverse)
df <- tibble(X = t$a, t$b)
fit <- lm(Y ~ X, data = df)
predictions <- predict(fit, newdata = tibble(X = c(0.2, 0.5, 0.8)))
predictions

#         1         2         3 
# 0.5292182 0.5196981 0.5101781 

summary(fit)


abline(fit)


g0=ggplot(df, aes(x= t$a, y= t$b))
g0+geom_point(color=3, shape=20, size=3)+
  geom_vline(xintercept = 1, linetype='dashed')+
  geom_hline(yintercept = 0, linetype='dashed')+
  theme_bw()+
  theme(axis.title.x = element_text(), 
        axis.title.y = element_text(), 
        plot.title = element_text(hjust = .5), 
        legend.title = element_blank())+
  ggtitle('Scatter plot of Probablity of Success')+
  xlab('A')+
  ylab('B')+
  theme(legend.position = 'bottom')

## comments 


## Visualization of Rainfall

g0=ggplot(t, aes(x=t$b))
g0+geom_histogram(bins = 10, fill='#EAA697', colour=1)+
  theme_light()+
  theme(plot.title = element_text(face = 'bold',
                                  hjust = .5), 
        axis.title.x = element_text(), 
        axis.title.y = element_text())+
  ggtitle('rainfall Distribution')+
  xlab('Daily rainfall')+
  ylab('Frequency')+
  geom_vline(xintercept = 3,
             linetype='dashed',
             color='black', 
             size=1)
ggsave('rainfallDistHist.png')








