class Todo < ActiveRecord::Base
  belongs_to :list
  validates :body, presence: true
  validates :priority, inclusion: { in: 0..5 }
end
