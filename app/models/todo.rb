class Todo < ActiveRecord::Base
  validates :body, presence: true
  validates :priority, inclusion: { in: 0..5 }
end
