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

# -------------------------------------------------------------------------------

category = Category.create(title: 'Ruby')
test = Test.create(title: 'Ruby: 1', level: 1, category_id: category.id)

q = Question.create(body: 'Выберите все варианты использования puts, которые не приведут к ошибке:', check: true, test_id: test.id)
Answer.create(body: "puts 'Hello'", mark: '1', question_id: q.id)
Answer.create(body: 'puts Hello', mark: '0', question_id: q.id)
Answer.create(body: "puts('Hello')", mark: '1', question_id: q.id)
Answer.create(body: 'puts(Hello)', mark: '0', question_id: q.id)

q = Question.create(body: 'Какие из перечисленных классов нельзя использовать без подключения require?', test_id: test.id)
Answer.create(body: 'Set', mark: '1', question_id: q.id)
Answer.create(body: 'String', mark: '0', question_id: q.id)
Answer.create(body: 'Range', mark: '0', question_id: q.id)
Answer.create(body: 'Hash', mark: '0', question_id: q.id)

q = Question.create(body: 'Укажите допустимый способ создания аргумента по умолчанию:', check: true, test_id: test.id)
Answer.create(body: 'def meth(a = 1); end', mark: '1', question_id: q.id)
Answer.create(body: 'def meth{a: 1}; end', mark: '0', question_id: q.id)
Answer.create(body: 'def meth(a: 1); end', mark: '1', question_id: q.id)
Answer.create(body: 'def meth({a: 1}); end', mark: '1', question_id: q.id)

Result.create(test_id: test.id, user_id: 1)

Test.create(title: 'Ruby: 0', level: 0, category_id: category.id)
Test.create(title: 'Ruby: 2', level: 2, category_id: category.id)
Test.create(title: 'Ruby: 3', level: 3, category_id: category.id)

# -----------------------------------------------------------------------------------

category = Category.create(title: 'HTML')
test = Test.create(title: 'HTML: start', level: 0, category_id: category.id)

q = Question.create(body: 'Какой тег используется для отображения маркированного списка?', test_id: test.id)
Answer.create(body: '<list>', mark: '0', question_id: q.id)
Answer.create(body: '<ol>', mark: '0', question_id: q.id)
Answer.create(body: '<ul>', mark: '1', question_id: q.id)

q = Question.create(body: 'Верно ли утверждение, что независимо от количества пробелов в HTML-документе на веб-странице будет отображаться только один пробел?', test_id: test.id)
Answer.create(body: 'Нет', mark: '0', question_id: q.id)
Answer.create(body: 'Да', mark: '0', question_id: q.id)
Answer.create(body: 'Да, если это не неразрывные пробелы', mark: '1', question_id: q.id)


q = Question.create(body: 'Какой будет по умолчанию ширина блока div?', test_id: test.id)
Answer.create(body: 'Во всю ширину страницы', mark: '1', question_id: q.id)
Answer.create(body: '0px', mark: '0', question_id: q.id)
Answer.create(body: 'Для блока всегда нужно задавать ширину', mark: '0', question_id: q.id)

Result.create(test_id: test.id, user_id: 1)

Test.create(title: 'HTML: 1', level: 1, category_id: category.id)
Test.create(title: 'HTML: 2', level: 2, category_id: category.id)

# ----------------------------------------------------------------

category = Category.create(title: 'Just for fun')
test = Test.create(title: 'Game of Trones', level: 3, abc: true, category_id: category.id)

q = Question.create(body: 'Грядет великая битва, где вы будете в момент боя?', test_id: test.id)
Answer.create(body: 'Буду искать своего главного врага, чтобы наконец отомстить!', mark: 'd', question_id: q.id)
Answer.create(body: 'Буду руководить войском, вся надежда только на меня.', mark: 'b', question_id: q.id)
Answer.create(body: 'Буду летать на драконе и сжигать все на своем пути.', mark: 'a', question_id: q.id)
Answer.create(body: 'Буду стоять и смотреть на битву с бокалом вина.', mark: 'c', question_id: q.id)

q = Question.create(body: 'Как вы расправитесь с врагом, который сильно обидел вас?', test_id: test.id)
Answer.create(body: 'В гневе схвачусь за арбалет.', mark: 'c', question_id: q.id)
Answer.create(body: 'Обучусь искусству убивать и вычеркну всех из своего списка.', mark: 'd', question_id: q.id)
Answer.create(body: 'Даже враг должен ответить по закону.', mark: 'b', question_id: q.id)
Answer.create(body: 'Дракарис!', mark: 'a', question_id: q.id)

q = Question.create(body: 'Что для вас важнее?', test_id: test.id)
Answer.create(body: 'Долг', mark: 'b', question_id: q.id)
Answer.create(body: 'Справедливость', mark: 'a', question_id: q.id)
Answer.create(body: 'Идея', mark: 'c', question_id: q.id)
Answer.create(body: 'Приключения', mark: 'd', question_id: q.id)

q = Question.create(body: 'На что вы готовы ради достижения цели?', test_id: test.id)
Answer.create(body: 'Сжечь весь город.', mark: 'a', question_id: q.id)
Answer.create(body: 'Пройти тысячи километров и терпеть боль.', mark: 'd', question_id: q.id)
Answer.create(body: 'Пожертвовать самым дорогим.', mark: 'b', question_id: q.id)
Answer.create(body: 'Пойти на обман.', mark: 'c', question_id: q.id)

q = Question.create(body: 'Ваш друг попал в беду, что вы будете делать?', test_id: test.id)
Answer.create(body: 'Дам кому-нибудь много золота, пусть спасут его.', mark: 'c', question_id: q.id)
Answer.create(body: 'Буду махать мечом, пока не пойму, что к чему.', mark: 'b', question_id: q.id)
Answer.create(body: 'За друга сожгу любого.', mark: 'a', question_id: q.id)
Answer.create(body: 'Надо посмотреть, что еще за друг.', mark: 'c', question_id: q.id)

Interpretation.create(body: 'Дейнерис Таргариен', mark: 'a', test_id: test.id)
Interpretation.create(body: 'Джон Сноу', mark: 'b', test_id: test.id)
Interpretation.create(body: 'Тирион Ланнистер', mark: 'c', test_id: test.id)
Interpretation.create(body: 'Арья Старк', mark: 'd', test_id: test.id)

Result.create(test_id: test.id, user_id: 1)

test = Test.create(title: 'Material welth.', level: 0, abc: true, category_id: category.id)
q = Question.create(body: 'Я плачу.', test_id: test.id)
Answer.create(body: 'Я плачУ', mark: 'a', question_id: q.id)
Answer.create(body: 'Я плАчу', mark: 'b', question_id: q.id)

Interpretation.create(body: 'Good material wealth.', mark: 'a', test_id: test.id)
Interpretation.create(body: 'We are sorry.', mark: 'b', test_id: test.id)

Result.create(test_id: test.id, user_id: 1)

Test.create(title: 'Just for fun: 1', level: 1, abc: true, category_id: category.id)
Test.create(title: 'Just for fun: 2', level: 2, abc: true, category_id: category.id)

#--------------------------------------------------------------------------------------------

