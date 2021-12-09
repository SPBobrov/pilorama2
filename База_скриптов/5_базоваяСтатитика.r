# базовая статистика

x <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 150, NA)
y <- log(x+1)
print(y)
mean(x, na.rm = TRUE) # среднее
median(x, na.rm = TRUE) # медиана
sd(x, na.rm = TRUE) # стандартное отклонение
var(x, na.rm = TRUE) # дисперсия

#summary(ТАБЛИЦА_АНАЛИЗА$view)
summary(x)
#tapply(X = ТАБЛИЦА_АНАЛИЗА$view, INDEX = ТАБЛИЦА_АНАЛИЗА$topic, FUN = mean, na.rm = TRUE)