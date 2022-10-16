library(dplyr)
str(a)
##filter
fdiamonds = filter(a, cut=="Ideal", color=="E" )
head(fdiamonds)
##filter with logical | & !
unique(a$cut)
Cut_C= filter(a, cut=="Premium"| cut=="Good")
head(Cut_C)
#quality and color
Cut_C = filter(a, (cut=="Premium"| cut=="Ideal") & color=="E")
Cut_C
#quality
Cut_C= filter(a, cut!= (cut=="Premium"| cut=="Ideal"))
Cut_C
#function %in%
unique(a$price)
filter(a, price%in% c(300, 500))
filter(a, cut%in% c("Ideal", "Good"))
#numerical <,>, ==
filter(a, price<400)
#arrange
names(a)
head(arrange(a, desc(depth)))
head(arrange(a, color))
#select
names(a)
select(a, c(x, y,z))
select(a, x, everything())
select(a, x:y)
select(a, -(x:y))
#rename
names(a)
a1 = rename(a, total_color=color)
head(a1)
#mutate
head(a)
head(mutate(a, x = y+z))
#pull
pull(a, cut)
