library("googlesheets4")
gs4_deauth() #очистить идентификацию
gs4_auth(email = "stollstoy@gmail.com") #авторизироваться

# прочитать таблицу в переменную
МОЯ_ТАБЛИЦА=read_sheet(ss="https://docs.google.com/spreadsheets/d/14XuVMGKP3EkbMj-ZPjhrEXFaD6NjmV5_pXdR5q6rjxw/edit#gid=0", sheet="Лист1", range="A:E")

# отсортировать
МОЯ_ТАБЛИЦА_СОРТ <- subset(МОЯ_ТАБЛИЦА, B == "khkhgf")

# просмотр полученной таблицы
View(МОЯ_ТАБЛИЦА_СОРТ)

# отсортировать по дате
МОЯ_ТАБЛИЦА_СОРТ_ДАТА = subset(transform(МОЯ_ТАБЛИЦА_СОРТ, Date = as.POSIXct(Date, format = "%Y-%m-%d")), 
       as.integer(format(Date, "%m")) >= 12)

# создаём Google Таблицу
GS_МОЯ_ТАБЛИЦА <- gs4_create(name = "my_new_tutor", locale = "ru_RU", sheets = МОЯ_ТАБЛИЦА_СОРТ)

# просмотреть таблицу в браузере по умолчанию
gs4_browse(GS_МОЯ_ТАБЛИЦА)

# просмотреть определеную строку таблицы
View(МОЯ_ТАБЛИЦА[10,])

# добавить страницу и данные на страницу
sheet_write(МОЯ_ТАБЛИЦА_СОРТ_ДАТА, ss = "https://docs.google.com/spreadsheets/d/11SMlIX13zZRBGqw0LTTds1phAKZV34WtWJeATmoQhkw/edit#gid=455421494", sheet = "МОЯ_ТАБЛИЦА_СОРТ_ДАТА")

СУММ_А <- sum(МОЯ_ТАБЛИЦА_СОРТ$A, na.rm=TRUE) # просуммировать столбец А
print(СУММ_А)




