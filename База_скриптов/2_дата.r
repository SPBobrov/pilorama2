# сделать сортировку гугл-таблицы по дате более простым способом чем СПОСОБ1

library("googlesheets4")
gs4_deauth() #очистить идентификацию
gs4_auth(email = "stollstoy@gmail.com") #авторизироваться
# gs4_auth() #авторизироваться
# gs4_auth_configure()

# прочитать таблицу в переменную
МОЯ_ТАБЛИЦА=read_sheet(ss="https://docs.google.com/spreadsheets/d/14XuVMGKP3EkbMj-ZPjhrEXFaD6NjmV5_pXdR5q6rjxw/edit#gid=0", sheet="Лист1", range="A:E")

# отсортировать
МОЯ_ТАБЛИЦА_СОРТ <- subset(МОЯ_ТАБЛИЦА, B == "khkhgf")

# определить тип данных
B5 <- МОЯ_ТАБЛИЦА_СОРТ$Date[5]
print(B5)
class(B5)
B5 <- as.Date(B5)
print(B5)
class(B5)

# отсортировать по дате СПОСОБ1
МОЯ_ТАБЛИЦА_СОРТ_ДАТА = subset(transform(МОЯ_ТАБЛИЦА_СОРТ, Date = as.POSIXct(Date, format = "%Y-%m-%d")), 
                               as.integer(format(Date, "%m")) >= 12)

# создаём Google Таблицу
GS_МОЯ_ТАБЛИЦА <- gs4_create(name = "my_new_tutor", locale = "ru_RU", sheets = МОЯ_ТАБЛИЦА_СОРТ)

# просмотреть таблицу в браузере по умолчанию
gs4_browse(GS_МОЯ_ТАБЛИЦА)

# отсортировать по дате СПОСОБ2
# трансформируем данные в колонке Date в формат даты
МОЯ_ТАБЛИЦА_СОРТ_AS_DATE <- transform (МОЯ_ТАБЛИЦА_СОРТ, Date = as.Date(Date, format = "%Y-%m-%d"))

# создаём Google Таблицу
GS_МОЯ_ТАБЛИЦА <- gs4_create(name = "my_new_tutor", locale = "ru_RU", sheets = МОЯ_ТАБЛИЦА_СОРТ_AS_DATE)

# просмотреть таблицу в браузере по умолчанию
gs4_browse(GS_МОЯ_ТАБЛИЦА)

# сортируем таблицу по дате
МОЯ_ТАБЛИЦА_СОРТ_AS_DATE_СОРТ <- subset(x = МОЯ_ТАБЛИЦА_СОРТ_AS_DATE, subset = Date >= "2021-11-27")
sheet_write(МОЯ_ТАБЛИЦА_СОРТ_AS_DATE_СОРТ, ss = "https://docs.google.com/spreadsheets/d/1sWJpfPxIoBZMwp3OTDn1q9PybYnQSWqUJ6iAIH_LqSc/edit#gid=1340328196", sheet = "МОЯ_ТАБЛИЦА_СОРТ_AS_DATE_СОРТ")
gs4_browse(GS_МОЯ_ТАБЛИЦА)