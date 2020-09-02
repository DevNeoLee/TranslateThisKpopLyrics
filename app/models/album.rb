class Album < ApplicationRecord
  belongs_to :group
  has_many :songs, dependent: :destroy
  accepts_nested_attributes_for :songs
end
