require "test_helper"

class TodoTest < ActiveSupport::TestCase
  test 'should not save todo without body' do
    todo = Todo.new(body: '', priority: 3)
    assert_not todo.valid?
  end

  test 'priority rating should be 0-5' do
    todo_1 = Todo.new(body: 'file taxes', priority: 6)
    todo_2 = Todo.new(body: 'file taxes', priority: -1)
    todo_3 = Todo.new(body: 'file taxes', priority: 2)
    assert_not todo_1.valid?
    assert_not todo_2.valid?
    assert todo_3.valid?
  end
end