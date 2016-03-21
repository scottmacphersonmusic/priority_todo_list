books = List.create(name: 'Books to Read')
countries = List.create(name: 'Countries to Visit')
shopping = List.create(name: 'Shopping')
jobs = List.create(name: 'Places To Apply')
terms = List.create(name: 'Terms To Study')
names = List.create(name: 'Baby Names')

def create_todo(list, body)
  list.todos.create!(
    body: body,
    priority: Faker::Number.between(0, 5))
end

15.times do
  create_todo books,     Faker::Book.title
  create_todo countries, Faker::Address.country
  create_todo shopping,  Faker::Commerce.product_name
  create_todo jobs,      Faker::Company.name
  create_todo terms,     Faker::Hacker.ingverb
  create_todo names,     Faker::Name.first_name
end
