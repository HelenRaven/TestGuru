# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Answer.delete_all
#Question.delete_all


Category.delete_all
User.delete_all
Result.delete_all


5.times do |i|
  User.create(name: "User ##{i + 1}", password: "123456#{ i + 1 }", email: "User#{i + 1}@email.com")
end

u = User.first
u_id = u.id

# -------------------------------------------------------------------------------

category = Category.create(title: 'Ruby')
test = Test.create(title: 'Ruby: 1', level: 1, category_id: category.id, author: u)

q = Question.create(body: 'Выберите все варианты использования puts, которые не приведут к ошибке:', check: true, test_id: test.id)
Answer.create([{body: "puts 'Hello'", right: true, question_id: q.id},
              {body: 'puts Hello', question_id: q.id},
              {body: "puts('Hello')", right: true, question_id: q.id},
              {body: 'puts(Hello)', question_id: q.id}])

q = Question.create(body: 'Какие из перечисленных классов нельзя использовать без подключения require?', test_id: test.id)
Answer.create([{body: 'Set', right: true, question_id: q.id},
              {body: 'String', question_id: q.id},
              {body: 'Range', question_id: q.id},
              {body: 'Hash', question_id: q.id}])

q = Question.create(body: 'Укажите допустимый способ создания аргумента по умолчанию:', check: true, test_id: test.id)
Answer.create([{body: 'def meth(a = 1); end', right: true, question_id: q.id},
              {body: 'def meth{a: 1}; end', question_id: q.id},
              {body: 'def meth(a: 1); end', right: true, question_id: q.id},
              {body: 'def meth({a: 1}); end', right: true, question_id: q.id}])

Result.create(test_id: test.id, user_id: u_id)

Test.create([{title: 'Ruby: 0', level: 0, category_id: category.id, author: u},
            {title: 'Ruby: 2', level: 2, category_id: category.id, author: u},
            {title: 'Ruby: 3', level: 3, category_id: category.id, author: u}])

# -----------------------------------------------------------------------------------

category = Category.create(title: 'HTML')
test = Test.create(title: 'HTML: start', level: 0, category_id: category.id, author: u)

q = Question.create(body: 'Какой тег используется для отображения маркированного списка?', test_id: test.id)
Answer.create([{body: '<list>', question_id: q.id},
              {body: '<ol>', question_id: q.id},
              {body: '<ul>', right: true, question_id: q.id}])

q = Question.create(body: 'Верно ли утверждение, что независимо от количества пробелов в HTML-документе на веб-странице будет отображаться только один пробел?', test_id: test.id)
Answer.create([{body: 'Нет', question_id: q.id},
              {body: 'Да', question_id: q.id},
              {body: 'Да, если это не неразрывные пробелы', right: true, question_id: q.id}])


q = Question.create(body: 'Какой будет по умолчанию ширина блока div?', test_id: test.id)
Answer.create([{body: 'Во всю ширину страницы', right: true, question_id: q.id},
              {body: '0px', question_id: q.id},
              {body: 'Для блока всегда нужно задавать ширину', question_id: q.id}])

Result.create(test_id: test.id, user_id: u_id)

Test.create([{title: 'HTML: 1', level: 1, category_id: category.id, author: u},
            {title: 'HTML: 2', level: 2, category_id: category.id, author: u}])

# ----------------------------------------------------------------

category = Category.create(title: 'Math')

test = Test.create(title: 'Math: quadric equation', level: 1, category_id: category.id, user_id: u_id)

Result.create(test_id: test.id, user_id: u_id)

test = Test.create(title: 'Math: probability theory', level: 10, category_id: category.id, author: u)

Result.create(test_id: test.id, user_id: u_id)

Test.create([{title: 'Math: 0', level: 0, category_id: category.id, author: u},
            {title: 'Math: 2', level: 2, category_id: category.id, author: u},
            {title: 'Math: 3', level: 3, category_id: category.id, author: u}])

#--------------------------------------------------------------------------------------------

