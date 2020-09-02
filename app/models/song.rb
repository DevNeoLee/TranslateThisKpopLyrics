class Song < ApplicationRecord
  belongs_to :album
  has_many :translations, dependent: :destroy
end
