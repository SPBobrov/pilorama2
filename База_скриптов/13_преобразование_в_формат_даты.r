library("googlesheets4")
gs4_deauth() #очистить идентификацию
gs4_auth(email = "stollstoy@gmail.com") #авторизироваться

# прочитать таблицу в переменную
МОЯ_ТАБЛИЦА_ДАТА=read_sheet(ss="https://docs.google.com/spreadsheets/d/14XuVMGKP3EkbMj-ZPjhrEXFaD6NjmV5_pXdR5q6rjxw/edit#gid=0", sheet="Лист1", range="A:E")

МОЯ_ТАБЛИЦА_ДАТА$Date <- format(as.Date(МОЯ_ТАБЛИЦА_ДАТА$Date, format = "%Y-%m-%d"), "%Y/%m/%d")
View(МОЯ_ТАБЛИЦА_ДАТА)

class(МОЯ_ТАБЛИЦА_ДАТА$Date[5])

МОЯ_ТАБЛИЦА_ДАТА$Date <- as.Date(МОЯ_ТАБЛИЦА_ДАТА$Date)
class(МОЯ_ТАБЛИЦА_ДАТА$Date[5])
View(МОЯ_ТАБЛИЦА_ДАТА)
