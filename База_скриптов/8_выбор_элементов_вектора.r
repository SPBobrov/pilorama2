fib <- c(0, 1, 1, 2, 3, 5, 8, NA, 13, 21, 34, NULL)
fib
fib[6]
fib[4:9]
fib[c(1,7,3)]
fib[-2]
length(fib) # количество элементов в векторе
fib[-(2:5)] # исключить элементы со 2 по 5
fib[fib>13] # выбрать элементы больше 13
fib[fib%%2 == 0] # выбрать только четные элементы
fib < 10
fib[fib < median(fib)]
fib[fib < mean(fib)]
fib[!is.na(fib) & !is.null(fib)]

ДАТЫ <- c(as.Date('1974-05-01'), as.Date('2003-07-23'), as.Date('2001-09-09'))
names(ДАТЫ) <- c("Мой день рождения", "День рождения Маши", "День свадьбы")
print(ДАТЫ)
