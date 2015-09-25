#Рекомендации по выполнению домашниего задания по курсу "Алгоритмы и структуры данных"

*Внимание, следование этому руководству позволит быстрее справиться с заданиями.*

##1. Стиль
###1.1 Придерживайтесь стиля кодирования, рекомендованного вашим семинаристом. 
Я советую писать в соотвествии со стилем кодирования Google https://google-styleguide.googlecode.com/svn/trunk/cppguide.html .
Обратите внимание, каждый пункт правил сопровождается обсуждением За и Против.
Соотвествие программы стилю Google можно проверить утилитой: https://google-styleguide.googlecode.com/svn/trunk/cpplint/cpplint.py .
Или воспользоваться онлайн версией http://cpplint.appspot.com/ .

###1.2 Старайтесь писать программы с использованием минимального достаточного набора выразительных средств языка.
Если одно и то же можно реализовать средствами одной функции или с помощью иерархии шаблонов с параметрами-стратегиями, лучше написать одну функцию.

В зависимости от сложности задачи, хорошее решение щанимает не более 50 .. 200 строк. Большинство задач можно решить используя только 100 строк кода.
Короткие программы быстрее писать и проще отлаживать.

###1.3 Старайтесь писать код так, чтобы для обобщения его функциональности не требовалась полная переделка.
Например, если вы реализуете массив или список, не закладывайтесь на фиксированный размер и тип элемента.
Старайтесь написать максимум кода так, чтобы он продолжил работать с любым типом элемента СД.

##2. Самостоятельная проверка решения
###2.1 Проверяйте собственную программу на компилируемость и прохождение собственных тестов.
В тестирующую систему следует сдавать готовое решение, в правильности которого вы уверены.

Решение сложных задач, предполагающих использование сложных структур данных, можно разделить на 2 части.
Сначала написать решение с использованием аналогичной структуры данных или алгоритма из стандартной библиотеки, убедиться, что решение правильно.
Затем, заменить библиотечную структуру на собственную реализацию.

Большинство задач предполагает использование конкретного алгоритма или структуры данных.
В некоторых задачах это требование указано явно, в других - задано через максимальные затраты памяти и времени.
Перед написанием кода, рекомендуется проверить, подходит ли выбранная структура даннях или алгоритм.

###2.2 Проверка собственного решения на правильность.
0. Установите себе unix-совместимую ОС. Или запуститие ее в эмуляторе.

1. Старайтесь пользоваться системой контроля версий при разработке решения.
Я рекомендую использовать Git. На bitbucket.org можно завести бесплатный закрытый репозиторий.
Старайтесь коммитить программу и тестовые примеры после завершения существенных частей решения, написания тестов, исправления ошибок, перед отправкой в систему тестирования и *перед отправкой преподавателю на проверку*.

2. Проверяйте компилируется ли программа в свежей версии g++. Стандарт C++03&. Или онлайн с помощью сервисов типа ideone.com .
3. Напишите несколько тестовых примеров и варианты правильных ответов к ним, для проверки своего решения.
4. Тесты удобно запускать все разом из командной строки. Для этого можно использовать скрипт автоматизации. Например: 
```bash
# Checkout sample repo
git clone https://github.com/tpAlgorithms/hw_sample
cd hw_sample

# Go to problem forlder
cd p01_sum_numbers

# Build the solution
make

# Generate extra tests
cd tests
bash ./generate_tests.sh

# Run tests
../check.sh . ./sum_numbers
```
5. Пишите тесты на проверку коректной работы в крайних случаях.
 * Программа работает с отдельными числами: проверьте границы допустимого диапазона значений.
 * Программа работает с массивами: проверьте, что массивы размеров (0,1,2,3 ... max_size-1, max_size) обрабатываются правильно.
 * Старайтесь предугатать вероятные ошибки в алгоритме и писать короткие тестовые примеры.
 
 * Напишите скрипт, генерирующий несколько тестовых примеров большого размера, для проверки производительности. 
 Я использую для этих целей Python или Perl. Но можно писать вспомогательные программы на любом сзяке в том числе C++.


6. В разных задачах время работы зависит от разных параметров, поэтому для каждой задачи нужно придумывать отдельный способ генерации примеров.
Для большинства задач это можно сделать использовав 1,2,3 консольных команды. Для каких-то придется писать программу-генератор.

Для тестирования программы, суммирующей все числа из входного потока, можно сделать тесты так:
```bash
mkdir tests
cd tests

echo "1 1" > t001.dat
echo 2 > t001.dat.ans

echo "1 2" > t002.dat
echo 3 > t002.dat.ans

echo "1 1 1" > t003.dat
echo 3 > t003.dat.ans

echo "1000000000 1000000000" > t004.dat
echo 2000000000 > t004.dat.ans

seq 10 > t011.dat
echo 55 > t011.dat.ans
seq 100 > t012.dat
echo 5050 > t012.dat.ans
seq 1000 > t013.dat
echo 500500 > t013.dat.ans

perl -e 'print "1\n" for 1..1000' > t021.dat
echo 1000 > t021.dat.ans
perl -e 'print "0\n" for 1..1000' > t022.dat
echo 0 > t022.dat.ans
```

7. Если задача предполагает использование сложной СД или алгоритма, протестируйте их отдельно.
Для этого можно написать отдельную программу, реализующую тривиальные операции с СД, или запускающую алгоритм на простых данных.
Например, если нужно решить задачу с помощью сортировки объектов типа "дата", разумно проверить,
что алгоритм соктировки корректно работает на последовательности целых чисел.

8. Проверяйте асимптотическое время работы программы экспериментально.
Большинство задач требуют написания решения, укладывающегося в асимптотическую оценку O(log(n)), O(n), O(n^2), O(n*log(n)) etc.
Мы указываем это в условии задачи.
Если вы написали решение, которое проходит ejudje, но использовали алгоритм с более высокой оценкой времени работы, решение не будет принято.

Для определения асимптотической сложности решения, можно создать несколько (минимум 2) входных тестовых файла.
И проверить время работы программы на них.

Приведу пример проверки "почти линейного" времени работы утилиты sort
```bash
$ seq 100000 > t001.txt
$ seq 200000 > t002.txt
$ seq 400000 > t003.txt

$ time sort t001.txt > /dev/null
real	0m0.028s
user	0m0.023s
sys	0m0.005s

$ time sort t002.txt > /dev/null
real	0m0.061s
user	0m0.053s
sys	0m0.008s

$ time sort t003.txt > /dev/null
real	0m0.114s
user	0m0.098s
sys	0m0.015s
```


##3. Отправка решения на проверку семинаристу:
По договоренности с преподавателем, задачи можно сдавать лично после семинара или дистанционно по почте.
Для того чтобы задача была зачтена, она должна пройти тесты в автоматической системе проверки и получить вердикт "ОК".
Начинайте тему письма с префикса "TP".
Указывайте в теме письма свои Фамилию Имя, номер задания, номер задачи, номер варианта.
Например так: "TP: Иванов Иван m1 p4 v2"
Отправляйте все письма по одной задаче в одной цепочке писем.

Разные задачи, отвеправляйте в разных письмах.

В письме достаточно указать run-id решения, сданного в систему тестирования.



##9. Успевайте вовремя
Дедлайн по каждому модулю прописывается в задании.
Обычно это дата последнего семинара перед РК + 2 недели. 
Т.е. начальные задачи модуля можно решать 4 недели, последние 2 недели. Р
После дедлайна задачи не принимаются.

Рекомандуется приступать к решению задачи не позднее 1 недели после семинара, на котором рассказывался соотвествующий материал.





