# вычислить выход продукции
# прочитать R объект
ТАБЛИЦА_СКЛАДА <- readRDS(file = "TABLICA_SKLADA.rds")
# просмотр полученной таблицы
View(ТАБЛИЦА_СКЛАДА)


ТОЛЩИНА <-34
ШИРИНА <- 112
ДАТА_НАЧАЛО <- as.Date("2021-12-06")
ДАТА_КОНЕЦ <- as.Date("2021-12-09")

ТАБЛИЦА_СКЛАДА_34_112 = subset(x = ТАБЛИЦА_СКЛАДА, subset = толщина...9 == ТОЛЩИНА&ширина == ШИРИНА) # сортировать по типоразмеру
# просмотр полученной таблицы
View(ТАБЛИЦА_СКЛАДА_34_112)

ТАБЛИЦА_СКЛАДА_34_112$дата <- format(ТАБЛИЦА_СКЛАДА_34_112$дата,"%Y-%m-%d")

ТАБЛИЦА_СКЛАДА_34_112$дата <- as.Date(ТАБЛИЦА_СКЛАДА_34_112$дата) # трансформируем дату в формат даты
# просмотр полученной таблицы
View(ТАБЛИЦА_СКЛАДА_34_112)

ТАБЛИЦА_СКЛАДА_34_112_DATE <- subset(x = ТАБЛИЦА_СКЛАДА_34_112, subset = дата >= ДАТА_НАЧАЛО&дата <= ДАТА_КОНЕЦ)

# просмотр полученной таблицы
View(ТАБЛИЦА_СКЛАДА_34_112_DATE)


ВЫХОД_1_СОРТ <- subset(x = ТАБЛИЦА_СКЛАДА_34_127_DATE, влажность == "сухая"&сорт == 1)# отсортировать выходящие 1 сорт
ВЫХОД_3_СОРТ <- subset(x = ТАБЛИЦА_СКЛАДА_34_127_DATE, влажность == "сухая"&сорт == 3)# отсортировать выходящие 3 сорт

ВЫХОД_СУМ_1_СОРТ_М3 <- round(sum(ВЫХОД_1_СОРТ$м3, na.rm=TRUE), digits = 1) # просуммировать кубы на выходе 1 сорт
ВЫХОД_СУМ_3_СОРТ_М3 <- round(sum(ВЫХОД_3_СОРТ$м3, na.rm=TRUE), digits = 1) # просуммировать кубы на выходе 3 сорт
ВХОД_СУМ_УСЛОВНЫЙ <- ВЫХОД_СУМ_1_СОРТ_М3 + ВЫХОД_СУМ_3_СОРТ_М3

print(ВЫХОД_СУМ_1_СОРТ_М3)
print(ВЫХОД_СУМ_3_СОРТ_М3)


# вычислить процент
library('scales')
percent(ВЫХОД_СУМ_1_СОРТ_М3/ВХОД_СУМ_УСЛОВНЫЙ)
percent(ВЫХОД_СУМ_3_СОРТ_М3/ВХОД_СУМ_УСЛОВНЫЙ)

# построить столбчатую диаграмму

ДАННЫЕ <- c(ВХОД_СУМ_УСЛОВНЫЙ, ВЫХОД_СУМ_1_СОРТ_М3, ВЫХОД_СУМ_3_СОРТ_М3)
ЗАГОЛОВКИ <- c("Вход", "1 сорт", "3 сорт")

barplot(height = ДАННЫЕ, col = topo.colors(3), xlab = "ПРОДУКЦИЯ", ylab = "М3", names.arg = ЗАГОЛОВКИ, legend.text = ДАННЫЕ)

