# печать

print(pi)
print(matrix(c(1, 2, 3, 4, 5, 6), 2, 3))
print(list("a", "b","c"))

# вывести определенное количество значащих цифр
print(pi, digits = 18)

# вывести несколько элементов одновременно

cat("The zero occurs at", 2*pi, "radians.", "\n")

# перечисление переменных 

ls()
ls.str()

# удаление переменной

rm()

# сохранение текущего рабочего пространства 

save.image()

# просмотр истории

history(20)

# Результат выполнения последний функции

x <- .Last.value

# узнать путь к рабочему каталогу
getwd()

# установить новый рабочий каталог
setwd()

# Конвейер функций
library("magrittr")
library("tidyverse")
data(mpg)
mpg %>% filter(cty>21) %>% head(10) %>% print()

# Какие пакеты загружены в настоящий момент
search()

# Какие библиотеки подключены в настоящий момент
library()

# Получить список установленных пакетов
installed.packages()

# Выполнить сценарий R

source("hello.r")
source("hello.r", echo = TRUE)

# перенаправление вывода в файл
sink("script_output.txt")
source("hello.r")
sink()

# показать файлы в рабочем каталоге
list.files(all.files = TRUE)


