#HOWTO

[*Ruby on Rails Tutorial: Learn Web Development with Rails*](http://railstutorial.org/)

##git

###Create a new repository on the command line

    $ touch README.md
    $ git init
    $ git add README.md
    $ git commit -m "first commit"
    $ git remote add origin https://github.com/wouldyougo/next_app.git
    $ git push -u origin master


###Push an existing repository from the command line
    $ git remote add origin https://github.com/wouldyougo/next_app.git
    $ git push -u origin master

### Настройка репозиория GIT
    $ git config --global user.email "user_email@gmail.com"
    $ git config --global user.name "wouldyougo"
    $ git config --global --list


## Ruby on Rails

###Документация:
* Please feel free to use a different markup language if you do not plan to run
  <tt>rake doc:app</tt>.
* Для создания документации в HTML-формате можно воспользоваться следую-
  щей командой rake:
  <tt>rake doc:app</tt>.
* ...

###Генерация случайных последовательностей:
 <tt>
 ('a'..'z').to_a.shuffle[0..7].join
 </tt>.

###Локализация
В файлах application.rb по умолчанию есть инструкция,
как добавлять локали из другой директории,
и как настраивать другую локаль по умолчанию.

###Перечень всех маршрутов
по адресу
[*http://localhost:3000/rails/info/routes*](http://localhost:3000/rails/info/routes)
будет виден перечень всех ваших маршрутов



