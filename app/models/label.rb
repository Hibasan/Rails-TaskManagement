class Label < ApplicationRecord
  has_many :tasklabels, dependent: :destroy
end
