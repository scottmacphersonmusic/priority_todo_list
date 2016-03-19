books = List.create(name: 'Books to Read')
countries = List.create(name: 'Countries to Visit')

def create_todo(list, body, priority)
  list.todos.create!(body: body, priority: priority)
end

10.times do
  create_todo(
    books,
    Faker::Book.title,
    Faker::Number.between(0, 5))
  create_todo(
    countries,
    Faker::Address.country,
    Faker::Number.between(0, 5))
end
