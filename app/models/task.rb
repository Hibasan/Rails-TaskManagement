class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  scope :search_title, ->title {where("title LIKE ?","%#{title}%")}
  scope :search_status, ->status {where(status: status)}
  enum priority:{低: 0,中: 1,高: 2}
  belongs_to :user, optional: true
end
