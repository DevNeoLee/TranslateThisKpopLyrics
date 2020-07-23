class Translation < ApplicationRecord
  belongs_to :song
  belongs_to :user
  has_many :comments, dependent: :destroy
end
