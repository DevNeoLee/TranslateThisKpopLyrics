class Song < ApplicationRecord
  belongs_to :album
  has_many :songs
end
