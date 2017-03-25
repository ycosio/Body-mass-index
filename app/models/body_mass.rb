class BodyMass < ApplicationRecord
  validates :mass , presence: true, numericality: true
  validates :height, presence: true, numericality: true

  belongs_to :user

  def body_imc(mass,height)
    @imc = mass / height**2
    @imc = {imc: @imc.round(2)}
  end

  def body_category
    @category = 'Some'
  end

end
