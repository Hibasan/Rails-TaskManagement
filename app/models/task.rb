class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  enum priority:{低: 0,中: 1,高: 2}
end
