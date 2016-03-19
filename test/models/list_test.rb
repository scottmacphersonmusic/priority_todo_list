require "test_helper"

class ListTest < ActiveSupport::TestCase
  test 'validates name presence' do
    list = List.new
    assert_not list.valid?
  end
end
