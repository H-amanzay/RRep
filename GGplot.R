library(ggplot2)
#Pie chart of Diamonds Cut
#Cut

fdtcut=table(a$cut)
fdtcut=as.data.frame(fdtcut)
fdtcut
colnames(fdtcut)=c("cut","count")

g0=ggplot(fdtcut, aes(x="", y=count, fill= cut))
g1=g0+geom_col()+
  coord_polar(theta = "y")+
  theme_dark()+
  theme(plot.title = element_text(colour = "darkblue",
                                  size = 13,
                                  face = "bold",
                                  hjust = .5))+
  ggtitle('Diamonds cut Distribution')+
  geom_text(aes(label= count),
            position = position_stack(vjust = .5))+
  scale_fill_manual(values = c("black","blue","red", "yellow", "purple"))+
  theme(legend.position = "left")
ggsave("CutDist.png")
g1 
