require "test_helper"

class ListIntegrationTest < Capybara::Rails::TestCase
  test 'can create list' do
    visit root_path
    click_on 'New List'
    fill_in 'Name', with: 'Hiking Destinations'
    click_on 'Create List'

    assert page.has_content?('Hiking Destinations')
    assert page.has_content?('List Successfully Created')
  end

  test 'can update lists' do
    list = List.create!(name: 'Hiking Destinations')

    visit list_path(list)
    click_on 'Edit'
    fill_in 'Name', with: 'Places to Hike'
    click_on 'Update List'

    assert page.has_content?('Places to Hike')
    assert page.has_content?('List Successfully Updated')
  end

  test 'can delete lists' do
    list = List.create!(name: 'Hiking Destinations')
    lists_count = List.count

    visit list_path(list)
    click_on 'Delete'

    refute page.has_content?('Hiking Destinations')
    assert page.has_content?('List Successfully Deleted')
    assert_equal List.count, lists_count - 1
  end

  test 'wont create a list without a name' do
    visit new_list_path
    click_on 'Create List'

    assert page.has_content?('There was a problem creating your list')
    assert page.has_content?("Name can't be blank")
  end

  test 'wont update a list without a name' do
    list = List.create!(name: 'Chores')

    visit edit_list_path(list)
    fill_in 'Name', with: ''
    click_on 'Update List'

    assert page.has_content?('There was a problem updating your list')
    assert page.has_content?("Name can't be blank")
  end
end
