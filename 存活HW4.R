#統計三B 46 李宥瑩 405651737
library(survival)
LC=read.table(file="C:/Users/user/Desktop/survVATrial.xls",header=TRUE)



#畫出Q1 KM Curve
fit=survfit(Surv(time,censor)~treat,type="kaplan-meier")
summary(fit)
plot(fit,xlab="Survival Time",ylab="S(t)",lty=c(1,2))
legend(800,0.9,c("療程","treat=0","treat=1"),lty=c(0,1,2))

#畫出Q2 KM Curve
aa=survfit(Surv(time,censor)~cellcode,type="kaplan-meier")
summary(aa)
plot(aa,xlab="Survival Time",ylab="S(t)",col=c("red","blue","green","black"))
legend(800,0.9,c("細胞型態","cellcode=1","cellcode=2","cellcode=3","cellcode=4"))

#畫出Q3 KM Curve
bb=survfit(Surv(time,censor)~treat+strata(cellcode),type="kaplan-meier")
summary(bb)
plot(bb,xlab="Survival Time",ylab="S(t)",col=c("red","blue","green","black"),lty=c(1,1,1,1,2,2,2,2))
legend(700,0.9,c("細胞型態","cellcode=1","cellcode=2","cellcode=3","cellcode=4","療程","treat=0","treat=1"),col=c("0","red","blue","green","black","0","black","black"),lty=c(0,1,1,1,1,0,1,2))