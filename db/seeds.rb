# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Result.delete_all
Gist.delete_all
Answer.delete_all
Question.delete_all
Test.delete_all
Category.delete_all


user = Admin.first

if user
  # -------------------------------------------------------------------------------

  category = Category.create(title: 'Ruby')
  test = Test.create(title: 'Ruby', level: 1, category: category, author: user)

  q = Question.create(body: 'Выберите все варианты использования puts, которые не приведут к ошибке:', check: true, test: test)
  Answer.create([{body: "puts 'Hello'", correct: true, question: q},
                {body: 'puts Hello', question: q},
                {body: "puts('Hello')", correct: true, question: q},
                {body: 'puts(Hello)', question: q}])

  q = Question.create(body: 'Какие из перечисленных классов нельзя использовать без подключения require?', test: test)
  Answer.create([{body: 'Set', correct: true, question: q},
                {body: 'String', question: q},
                {body: 'Range', question: q},
                {body: 'Hash', question: q}])

  q = Question.create(body: 'Укажите допустимый способ создания аргумента по умолчанию:', check: true, test: test)
  Answer.create([{body: 'def meth(a = 1); end', correct: true, question: q},
                {body: 'def meth{a: 1}; end', question: q},
                {body: 'def meth(a: 1); end', correct: true, question: q},
                {body: 'def meth({a: 1}); end', correct: true, question: q}])

  Test.create([{title: 'Ruby: 0', level: 0, category: category, author: user},
              {title: 'Ruby: 2', level: 2, category: category, author: user},
              {title: 'Ruby: 3', level: 3, category: category, author: user}])

  # -----------------------------------------------------------------------------------

  category = Category.create(title: 'HTML')
  test = Test.create(title: 'HTML: start', level: 0, category: category, author: user)

  q = Question.create(body: 'Какой тег используется для отображения маркированного списка?', test: test)
  Answer.create([{body: '<list>', question: q},
                {body: '<ol>', question: q},
                {body: '<ul>', correct: true, question: q}])

  q = Question.create(body: 'Верно ли утверждение, что независимо от количества пробелов в HTML-документе на веб-странице будет отображаться только один пробел?', test: test)
  Answer.create([{body: 'Нет', question: q},
                {body: 'Да', question: q},
                {body: 'Да, если это не неразрывные пробелы', correct: true, question: q}])


  q = Question.create(body: 'Какой будет по умолчанию ширина блока div?', test: test)
  Answer.create([{body: 'Во всю ширину страницы', correct: true, question: q},
                {body: '0px', question: q},
                {body: 'Для блока всегда нужно задавать ширину', question: q}])


  Test.create([{title: 'HTML: 1', level: 1, category: category, author: user},
              {title: 'HTML: 2', level: 2, category: category, author: user}])

  # ----------------------------------------------------------------

  category = Category.create(title: 'Math')

  test = Test.create(title: 'Math', level: 1, category: category, author: user)
  q = Question.create(body: 'Если все элементы одной строки прямоугольной матрицы А размерности n x m умножить на два то ранг матрицы А …', test: test)
  Answer.create([{body: 'увеличится на 2', question: q},
                {body: 'не изменится', correct: true, question: q},
                {body: 'увеличится в два раза',  question: q}])

  q = Question.create(body: 'Взаимное расположение прямых 4x — 2y — 6 = 0 и 8x — 4y — 2 = 0 на плоскости – прямые …', test: test)
  Answer.create([{body: 'параллельны', correct: true, question: q},
                {body: 'пересекаются', question: q},
                {body: 'перпендикулярны',  question: q},
                {body: 'совпадают',  question: q}])

  q = Question.create(body: 'Пусть прямая задана нормальным уравнением x sinα + y sinα – p = 0. Верные утверждения:', check: true, test: test)
  Answer.create([{body: 'Если ОА – перпендикуляр, восстановлены из начала координат к прямой, то α — угол образованный перпендикуляром ОА с осью Ох', correct: true, question_id: q.id},
                {body: 'Если ОА – перпендикуляр, восстановлены из начала координат к прямой, то α — длинна этого перпендикуляра', question: q},
                {body: 'р — величина отрезка, отсекаемого прямой на оси Ох',  question: q},
                {body: 'α — угол наклона прямой к положительному направлению оси Ох',  question: q}])

  q = Question.create(body: 'Уравнение прямой проходящей через точку M(1;2) и образующей с осью Ох угол в 45º имеет вид …', test: test)
  Answer.create([{body: '2x — y = 0', question: q},
                {body: '3x — 2y + 1 = 0', question: q},
                {body: 'x — 2y + 3 = 0', question: q},
                {body: 'x — y + 1 = 0', correct: true, question: q}])


  Test.create(title: 'Math: quadric equation', level: 1, category: category, author: user)
  Test.create(title: 'Math: probability theory', level: 10, category: category, author: user)

  #--------------------------------------------------------------------------------------------
end
