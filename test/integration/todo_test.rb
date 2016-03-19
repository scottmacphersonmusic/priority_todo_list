require 'test_helper'

class TodoIntegrationTest < Capybara::Rails::TestCase
  test 'can create todo' do
    list = List.create!(name: 'Pack For Trip')

    visit list_path(list)
    click_on 'New ToDo'
    fill_in 'ToDo', with: 'Passport'
    click_on 'Create ToDo'

    assert page.has_content?('Passport')
    assert page.has_content?('ToDo Successfully Created')
  end

  test 'can update todo' do
    list = List.create!(name: 'Languages to Learn')
    list.todos.create!(body: 'Closure', priority: 2)

    visit list_path(list)
    click_on 'Closure'
    fill_in 'ToDo', with: 'Clojure'
    click_on 'Update ToDo'

    assert page.has_content?('Clojure')
    assert page.has_content?('ToDo Successfully Updated')
  end

  test 'can delete todo' do
    list = List.create!(name: 'Shopping')
    todo = list.todos.create!(body: 'Paper Towels', priority: 5)

    visit edit_list_todo_path(list, todo)
    click_on 'Delete ToDo'

    assert page.has_content?('ToDo Successfully Deleted')
    refute page.has_content?('Paper Towels')
  end
end
