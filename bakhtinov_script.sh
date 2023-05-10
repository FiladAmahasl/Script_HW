#!/bin/bash

# Проверка наличия аргументов
if [[ $# -lt 4  && "$1" != "-i" && "$3" != "-o" ]]
then
  echo "Ошибка: не указаны все необходимые аргументы"
  echo "Пример запуска: $0 -i input_file -o output_file"
  exit 1
fi

# Получение аргументов командной строки
input_file="$2"
output_file="$4"

# Проверка существования входного файла
if [ ! -f "$input_file" ]
then
  echo "Ошибка: входной файл $input_file не существует"
  exit 1
fi

# Запрос и чтение слова, количество вхождений которого нужно посчитать
echo "Введите слово, количество вхождений которого нужно посчитать:"
read word

# Запрос и чтение флага регистрозависимости
echo "Учитывать регистр? (yes или no)"
read case_sensitive

# Проверка флага регистрозависимости и выполнение соответствующего действия
if [ "$case_sensitive" = "no" ] 
then
  # Не учитывать регистр
  num_occurrences=$(grep -o -i "$word" "$input_file" | wc -l)
else
  # Учитывать регистр
  num_occurrences=$(grep -o "$word" "$input_file" | wc -l)
fi

# Запись ответа в выходной файл
echo "Слово \"$word\" встретилось $num_occurrences раз(а) в файле $input_file." > "$output_file"
echo "Количество вхождений слова записано в файл $output_file"