library("googlesheets4")
gs4_deauth() #очистить идентификацию
gs4_auth(email = "stollstoy@gmail.com") #авторизироваться

# прочитать таблицу в переменную
МОЯ_ТАБЛИЦА=read_sheet(ss="https://docs.google.com/spreadsheets/d/14XuVMGKP3EkbMj-ZPjhrEXFaD6NjmV5_pXdR5q6rjxw/edit#gid=0", sheet="Лист1", range="A:E")

# создать R объект
saveRDS(object = МОЯ_ТАБЛИЦА, file = "MOIA_TABLICA.rds")

# прочитать R объект
МОЯ_ТАБЛИЦА <- readRDS(file = "MOIA_TABLICA.rds")

print(МОЯ_ТАБЛИЦА)
