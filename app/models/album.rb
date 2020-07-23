class Album < ApplicationRecord
  belongs_to :group
  has_many :songs
end
