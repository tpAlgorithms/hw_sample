hw_sample
=========

Clone this repository, and commit your solutions and their fixes and|or newer versions.
It's far more convenient than sending archives via e-mail.

Create a new folder for each of your assignments

USAGE:
./check.sh <task_folder>  <your_solution_executable>

Please, don't share your accont address with other students ;)

```bash
# go to problem forlder
cd p01_sum_numbers

# build the solution
make

# generate extra tests
cd tests
bash ./generate_tests.sh

# run tests
../check.sh . ./sum_numbers

#or
cd -
./check.sh p01_sum_numbers p01_sum_numbers/sum_numbers
```


Для того чтобы начать разработку решения новой задачи - скопируйте папку p01_sum_numbers или создайте новую с аналогичной структурой:

```bash
mkdir p02_my_problem
cd p02_my_problem
vim my_problem.cpp
# ... write some code

git add . 
git add my_problem.cpp
git commit -a -m 'added my_problem.cpp'

cat ../p01_sum_numbers/Makefile | cat p01_sum_numbers/Makefile | perl -lpe 's!sum_numbers!my_problem!g' > Makefile

make

mkdir tests
# ... write some tests

../check.sh . ./my_problem
```
