class Todo < ActiveRecord::Base
  validates :body, presence: true
  validates :priority, length: { in: 0..5 }
end
