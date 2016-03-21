require 'test_helper'

class TodoIntegrationTest < Capybara::Rails::TestCase
  before do
    @list = List.create!(name: 'Shopping')
  end

  test 'can create todo' do
    visit list_path(@list)
    click_on 'New ToDo'
    fill_in 'ToDo', with: 'Passport'
    click_on 'Create ToDo'

    assert page.has_content?('Passport')
    assert page.has_content?('ToDo Successfully Created')
  end

  test 'can update todo' do
    todo

    visit list_path(@list)
    click_on 'Paper Towels'
    fill_in 'ToDo', with: 'Napkins'
    click_on 'Update ToDo'

    assert page.has_content?('Napkins')
    assert page.has_content?('ToDo Successfully Updated')
  end

  test 'can delete todo' do
    visit edit_list_todo_path(@list, todo)
    click_on 'Delete ToDo'

    assert page.has_content?('ToDo Successfully Deleted')
    refute page.has_content?('Paper Towels')
  end

  test 'wont create todo without body text' do
    visit new_list_todo_path(@list)
    click_on 'Create ToDo'

    assert page.has_content?('There was a problem creating your ToDo')
    assert page.has_content?("Body can't be blank")
  end

  test 'wont update todo without body text' do
    visit edit_list_todo_path(@list, todo)
    fill_in 'ToDo', with: ''
    click_on 'Update ToDo'

    assert page.has_content?('There was a problem updating your ToDo')
    assert page.has_content?("Body can't be blank")
  end

  private

  def todo
    @todo = @list.todos.create!(body: 'Paper Towels', priority: 5)
  end
end
