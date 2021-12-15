library("googlesheets4")
library("ggplot2")
install.packages("reshape2")

library("reshape2")
gs4_deauth() #очистить идентификацию
gs4_auth(email = "stollstoy@gmail.com") #авторизироваться


MyNews=read_sheet(ss="https://docs.google.com/spreadsheets/d/1J9oR5J_RfszSgSZcv9xjO9ZyF1QlPmz0BGqyKT42wMQ/edit#gid=651139550", sheet="textRP", range="A:H");
View(MyNews)
summary(MyNews$view)
tapply(X = MyNews$view, INDEX = MyNews$topic, FUN = mean, na.rm=TRUE)
ОБЩЕЕ_КОЛ_ПРОСМОТРОВ <- tapply(X = MyNews$view, INDEX = MyNews$topic, FUN = sum, na.rm=TRUE)
ОБЩЕЕ_КОЛ_ПРОСМОТРОВ_FRAME <- melt(ОБЩЕЕ_КОЛ_ПРОСМОТРОВ)
head(ОБЩЕЕ_КОЛ_ПРОСМОТРОВ_FRAME)
ggplot(ОБЩЕЕ_КОЛ_ПРОСМОТРОВ_FRAME, aes(Var1, value)) + geom_point()
ggplot(ОБЩЕЕ_КОЛ_ПРОСМОТРОВ_FRAME, aes(Var1, value)) + geom_boxplot()
ggplot(ОБЩЕЕ_КОЛ_ПРОСМОТРОВ_FRAME, aes(Var1, value)) + geom_flag() + geom_text(hjust=0.5, vjust=-0.5)

ggplot(MyNews, aes(MyNews$topic, MyNews$view)) +  geom_boxplot()
ggplot(MyNews, aes(MyNews$topic, MyNews$view)) +  geom_histogram()

View(ОБЩЕЕ_КОЛ_ПРОСМОТРОВ)
print(ОБЩЕЕ_КОЛ_ПРОСМОТРОВ)
class(ОБЩЕЕ_КОЛ_ПРОСМОТРОВ)

ggplot(ОБЩЕЕ_КОЛ_ПРОСМОТРОВ, aes(x=Name, y=Value) + geom_point())


ggplot(MyNews, aes(topic, view)) + geom_point()

ОБЩЕЕ_КОЛ_ПРОСМОТРОВ <- sum(MyNews$view, na.rm=TRUE)
print(ОБЩЕЕ_КОЛ_ПРОСМОТРОВ)

ОБЩЕЕ_КОЛ_ПРОСМОТРОВ_ЧЕХИЯ <- sum(MyNews$view, MyNews$topic == "Самара", na.rm=TRUE)
print(ОБЩЕЕ_КОЛ_ПРОСМОТРОВ_ЧЕХИЯ)


