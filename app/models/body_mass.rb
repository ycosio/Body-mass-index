class BodyMass < ApplicationRecord
  validates :mass , presence: true, numericality: true
  validates :height, presence: true, numericality: true

  belongs_to :user
end
