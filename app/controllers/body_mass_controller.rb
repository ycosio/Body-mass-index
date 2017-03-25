class BodyMassController < ApplicationController

before_action :authenticate_user!

  def index
    @body_mass = BodyMass.find_by(user_id: current_user.id)
    if !@body_mass
      @body_mass = BodyMass.new(user_id: current_user.id, mass: 0, height: 0, category: "Unknow")
      @body_mass.save
    end
  end

  def show
    redirect_to 'index'
  end

  def update
    @body_mass = BodyMass.find(params[:id])
    @body_mass.update(body_mass_params)
    render 'index'
  end

  private

    def body_mass_params
     params.require(:body_mass).permit(:user_id, :mass, :height)
    end

end
