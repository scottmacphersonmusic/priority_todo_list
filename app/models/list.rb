class List < ActiveRecord::Base
  has_many :todos
  validates :name, presence: true

  def top_three_todos
    todos.order(priority: :desc)[0..2]
  end
end
