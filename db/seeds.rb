# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Answer.delete_all
#Question.delete_all
#Test.delete_all
#Category.delete_all

#Result.delete_all
#Gist.delete_all

user = Admin.first

if user
  # -------------------------------------------------------------------------------

  category = Category.create(title: 'Ruby')
  test = Test.create(title: 'Ruby', level: 1, category_id: category.id, author: user)

  q = Question.create(body: 'Выберите все варианты использования puts, которые не приведут к ошибке:', check: true, test_id: test.id)
  Answer.create([{body: "puts 'Hello'", correct: true, question_id: q.id},
                {body: 'puts Hello', question_id: q.id},
                {body: "puts('Hello')", correct: true, question_id: q.id},
                {body: 'puts(Hello)', question_id: q.id}])

  q = Question.create(body: 'Какие из перечисленных классов нельзя использовать без подключения require?', test_id: test.id)
  Answer.create([{body: 'Set', correct: true, question_id: q.id},
                {body: 'String', question_id: q.id},
                {body: 'Range', question_id: q.id},
                {body: 'Hash', question_id: q.id}])

  q = Question.create(body: 'Укажите допустимый способ создания аргумента по умолчанию:', check: true, test_id: test.id)
  Answer.create([{body: 'def meth(a = 1); end', correct: true, question_id: q.id},
                {body: 'def meth{a: 1}; end', question_id: q.id},
                {body: 'def meth(a: 1); end', correct: true, question_id: q.id},
                {body: 'def meth({a: 1}); end', correct: true, question_id: q.id}])

  Test.create([{title: 'Ruby: 0', level: 0, category_id: category.id, author: user},
              {title: 'Ruby: 2', level: 2, category_id: category.id, author: user},
              {title: 'Ruby: 3', level: 3, category_id: category.id, author: user}])

  # -----------------------------------------------------------------------------------

  category = Category.create(title: 'HTML')
  test = Test.create(title: 'HTML: start', level: 0, category_id: category.id, author: user)

  q = Question.create(body: 'Какой тег используется для отображения маркированного списка?', test_id: test.id)
  Answer.create([{body: '<list>', question_id: q.id},
                {body: '<ol>', question_id: q.id},
                {body: '<ul>', correct: true, question_id: q.id}])

  q = Question.create(body: 'Верно ли утверждение, что независимо от количества пробелов в HTML-документе на веб-странице будет отображаться только один пробел?', test_id: test.id)
  Answer.create([{body: 'Нет', question_id: q.id},
                {body: 'Да', question_id: q.id},
                {body: 'Да, если это не неразрывные пробелы', correct: true, question_id: q.id}])


  q = Question.create(body: 'Какой будет по умолчанию ширина блока div?', test_id: test.id)
  Answer.create([{body: 'Во всю ширину страницы', correct: true, question_id: q.id},
                {body: '0px', question_id: q.id},
                {body: 'Для блока всегда нужно задавать ширину', question_id: q.id}])


  Test.create([{title: 'HTML: 1', level: 1, category_id: category.id, author: user},
              {title: 'HTML: 2', level: 2, category_id: category.id, author: user}])

  # ----------------------------------------------------------------

  category = Category.create(title: 'Math')

  test = Test.create(title: 'Math', level: 1, category_id: category.id, author: user)
  q = Question.create(body: 'Если все элементы одной строки прямоугольной матрицы А размерности n x m умножить на два то ранг матрицы А …', test_id: test.id)
  Answer.create([{body: 'увеличится на 2', question_id: q.id},
                {body: 'не изменится', correct: true, question_id: q.id},
                {body: 'увеличится в два раза',  question_id: q.id}])

  q = Question.create(body: 'Взаимное расположение прямых 4x — 2y — 6 = 0 и 8x — 4y — 2 = 0 на плоскости – прямые …', test_id: test.id)
  Answer.create([{body: 'параллельны', correct: true, question_id: q.id},
                {body: 'пересекаются', question_id: q.id},
                {body: 'перпендикулярны',  question_id: q.id},
                {body: 'совпадают',  question_id: q.id}])

  q = Question.create(body: 'Пусть прямая задана нормальным уравнением x sinα + y sinα – p = 0. Верные утверждения:', check: true, test_id: test.id)
  Answer.create([{body: 'Если ОА – перпендикуляр, восстановлены из начала координат к прямой, то α — угол образованный перпендикуляром ОА с осью Ох', correct: true, question_id: q.id},
                {body: 'Если ОА – перпендикуляр, восстановлены из начала координат к прямой, то α — длинна этого перпендикуляра', question_id: q.id},
                {body: 'р — величина отрезка, отсекаемого прямой на оси Ох',  question_id: q.id},
                {body: 'α — угол наклона прямой к положительному направлению оси Ох',  question_id: q.id}])

  q = Question.create(body: 'Уравнение прямой проходящей через точку M(1;2) и образующей с осью Ох угол в 45º имеет вид …', test_id: test.id)
  Answer.create([{body: '2x — y = 0', question_id: q.id},
                {body: '3x — 2y + 1 = 0', question_id: q.id},
                {body: 'x — 2y + 3 = 0', question_id: q.id},
                {body: 'x — y + 1 = 0', correct: true, question_id: q.id}])


  Test.create(title: 'Math: quadric equation', level: 1, category_id: category.id, author: user)
  Test.create(title: 'Math: probability theory', level: 10, category_id: category.id, author: user)

  #--------------------------------------------------------------------------------------------
end
