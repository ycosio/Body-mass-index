class BodyMassController < ApplicationController

before_action :authenticate_user!

  def index
    @body_mass = BodyMass.find_by(user_id: current_user.id)
  end
end
