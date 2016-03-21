require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test 'select the top three todos' do
    list = List.create!(name: 'Songs To Learn')
    list.todos.create!(
      [{ body: 'Oleo',    priority: 1 },
       { body: 'Solar', priority: 5 },
       { body: 'Equinox', priority: 2 },
       { body: 'Alabama', priority: 4 }
      ])
    top_three = list.top_three_todos

    assert_equal 'Solar', top_three.first.body
    assert_equal 'Alabama', top_three.second.body
    assert_equal 'Equinox', top_three.third.body
    assert_nil top_three.fourth
  end
end
