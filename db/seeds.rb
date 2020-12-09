# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
  User.create(name: "User ##{i + 1}")
end

u_id = User.first.id

# -------------------------------------------------------------------------------

category = Category.create(title: 'Ruby')
test = Test.create(title: 'Ruby: 1', level: 1, category_id: category.id)

q = Question.create(body: 'Выберите все варианты использования puts, которые не приведут к ошибке:', check: true, test_id: test.id)
Answer.create(body: "puts 'Hello'", mark: 1, question_id: q.id)
Answer.create(body: 'puts Hello', mark: 0, question_id: q.id)
Answer.create(body: "puts('Hello')", mark: 1, question_id: q.id)
Answer.create(body: 'puts(Hello)', mark: 0, question_id: q.id)

q = Question.create(body: 'Какие из перечисленных классов нельзя использовать без подключения require?', test_id: test.id)
Answer.create(body: 'Set', mark: 1, question_id: q.id)
Answer.create(body: 'String', mark: 0, question_id: q.id)
Answer.create(body: 'Range', mark: 0, question_id: q.id)
Answer.create(body: 'Hash', mark: 0, question_id: q.id)

q = Question.create(body: 'Укажите допустимый способ создания аргумента по умолчанию:', check: true, test_id: test.id)
Answer.create(body: 'def meth(a = 1); end', mark: 1, question_id: q.id)
Answer.create(body: 'def meth{a: 1}; end', mark: 0, question_id: q.id)
Answer.create(body: 'def meth(a: 1); end', mark: 1, question_id: q.id)
Answer.create(body: 'def meth({a: 1}); end', mark: 1, question_id: q.id)

Result.create(test_id: test.id, user_id: u_id)

Test.create(title: 'Ruby: 0', level: 0, category_id: category.id)
Test.create(title: 'Ruby: 2', level: 2, category_id: category.id)
Test.create(title: 'Ruby: 3', level: 3, category_id: category.id)

# -----------------------------------------------------------------------------------

category = Category.create(title: 'HTML')
test = Test.create(title: 'HTML: start', level: 0, category_id: category.id)

q = Question.create(body: 'Какой тег используется для отображения маркированного списка?', test_id: test.id)
Answer.create(body: '<list>', mark: 0, question_id: q.id)
Answer.create(body: '<ol>', mark: 0, question_id: q.id)
Answer.create(body: '<ul>', mark: 1, question_id: q.id)

q = Question.create(body: 'Верно ли утверждение, что независимо от количества пробелов в HTML-документе на веб-странице будет отображаться только один пробел?', test_id: test.id)
Answer.create(body: 'Нет', mark: 0, question_id: q.id)
Answer.create(body: 'Да', mark: 0, question_id: q.id)
Answer.create(body: 'Да, если это не неразрывные пробелы', mark: 1, question_id: q.id)


q = Question.create(body: 'Какой будет по умолчанию ширина блока div?', test_id: test.id)
Answer.create(body: 'Во всю ширину страницы', mark: 1, question_id: q.id)
Answer.create(body: '0px', mark: 0, question_id: q.id)
Answer.create(body: 'Для блока всегда нужно задавать ширину', mark: 0, question_id: q.id)

Result.create(test_id: test.id, user_id: u_id)

Test.create(title: 'HTML: 1', level: 1, category_id: category.id)
Test.create(title: 'HTML: 2', level: 2, category_id: category.id)

# ----------------------------------------------------------------

category = Category.create(title: 'Just for fun')
test = Test.create(title: 'Game of Trones', level: 3, abc: true, category_id: category.id)

q = Question.create(body: 'Грядет великая битва, где вы будете в момент боя?', test_id: test.id)
Answer.create(body: 'Буду искать своего главного врага, чтобы наконец отомстить!', mark: 4, question_id: q.id)
Answer.create(body: 'Буду руководить войском, вся надежда только на меня.', mark: 2, question_id: q.id)
Answer.create(body: 'Буду летать на драконе и сжигать все на своем пути.', mark: 1, question_id: q.id)
Answer.create(body: 'Буду стоять и смотреть на битву с бокалом вина.', mark: 3, question_id: q.id)

q = Question.create(body: 'Как вы расправитесь с врагом, который сильно обидел вас?', test_id: test.id)
Answer.create(body: 'В гневе схвачусь за арбалет.', mark: 3, question_id: q.id)
Answer.create(body: 'Обучусь искусству убивать и вычеркну всех из своего списка.', mark: 4, question_id: q.id)
Answer.create(body: 'Даже враг должен ответить по закону.', mark: 2, question_id: q.id)
Answer.create(body: 'Дракарис!', mark: 1, question_id: q.id)

q = Question.create(body: 'Что для вас важнее?', test_id: test.id)
Answer.create(body: 'Долг', mark: 2, question_id: q.id)
Answer.create(body: 'Справедливость', mark: 1, question_id: q.id)
Answer.create(body: 'Идея', mark: 3, question_id: q.id)
Answer.create(body: 'Приключения', mark: 4, question_id: q.id)

q = Question.create(body: 'На что вы готовы ради достижения цели?', test_id: test.id)
Answer.create(body: 'Сжечь весь город.', mark: 1, question_id: q.id)
Answer.create(body: 'Пройти тысячи километров и терпеть боль.', mark: 4, question_id: q.id)
Answer.create(body: 'Пожертвовать самым дорогим.', mark: 2, question_id: q.id)
Answer.create(body: 'Пойти на обман.', mark: 3, question_id: q.id)

q = Question.create(body: 'Ваш друг попал в беду, что вы будете делать?', test_id: test.id)
Answer.create(body: 'Дам кому-нибудь много золота, пусть спасут его.', mark: 3, question_id: q.id)
Answer.create(body: 'Буду махать мечом, пока не пойму, что к чему.', mark: 2, question_id: q.id)
Answer.create(body: 'За друга сожгу любого.', mark: 1, question_id: q.id)
Answer.create(body: 'Надо посмотреть, что еще за друг.', mark: 4, question_id: q.id)

Interpretation.create(body: 'Дейнерис Таргариен', mark: 1, test_id: test.id)
Interpretation.create(body: 'Джон Сноу', mark: 2, test_id: test.id)
Interpretation.create(body: 'Тирион Ланнистер', mark: 3, test_id: test.id)
Interpretation.create(body: 'Арья Старк', mark: 4, test_id: test.id)

Result.create(test_id: test.id, user_id: u_id)

test = Test.create(title: 'Material welth.', level: 0, abc: true, category_id: category.id)
q = Question.create(body: 'Я плачу.', test_id: test.id)
Answer.create(body: 'Я плачУ', mark: 1, question_id: q.id)
Answer.create(body: 'Я плАчу', mark: 2, question_id: q.id)

Interpretation.create(body: 'Good material wealth.', mark: 1, test_id: test.id)
Interpretation.create(body: 'We are sorry.', mark: 2, test_id: test.id)

Result.create(test_id: test.id, user_id: u_id)

Test.create(title: 'Just for fun: 1', level: 1, abc: true, category_id: category.id)
Test.create(title: 'Just for fun: 2', level: 2, abc: true, category_id: category.id)

#--------------------------------------------------------------------------------------------

