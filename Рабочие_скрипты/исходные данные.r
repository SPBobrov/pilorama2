library("googlesheets4")
gs4_deauth() #очистить идентификацию
gs4_auth(email = "stollstoy@gmail.com") #авторизироваться

# скачать таблицу склада в переменную
ТАБЛИЦА_СКЛАДА=read_sheet(ss = "https://docs.google.com/spreadsheets/d/1Whng31XfivMScu67JFtzteEoeju8zhVtWNk9Y6Bt2Fk/edit#gid=1748636237", sheet="Новый (2019)", range="A:AN")

# более быстрый способ, применяемый в RFlow
ТАБЛИЦА_СКЛАДА1 <- range_speedread(ss="https://docs.google.com/spreadsheets/d/1Whng31XfivMScu67JFtzteEoeju8zhVtWNk9Y6Bt2Fk/edit?ts=5bd41fba#gid=1748636237", range="a:ap", col_types = "ccccccccnnnnnnnnnnncccccccccccccncccccccn?")

# создать R объект
saveRDS(object = ТАБЛИЦА_СКЛАДА, file = "TABLICA_SKLADA.rds")

saveRDS(object = ТАБЛИЦА_СКЛАДА1, file = "TABLICA_SKLADA1.rds")
