class Prototype < ApplicationRecord


  belongs_to :user
  has_many :commets
  has_one_attached :image


  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :usr_id, presence: true, foreign_key: true

end
