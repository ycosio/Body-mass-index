class BodyMassController < ApplicationController

before_action :authenticate_user!
before_action :get_body_mass

  def index
    @body_mass = BodyMass.find_by(user_id: current_user.id)
    if !@body_mass
      @body_mass = BodyMass.new(new_params)
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
     body_params = params.require(:body_mass).permit(:user_id, :mass, :height)
     body_params.merge!(@body_mass.body_imc(@body_mass.mass,@body_mass.height))
    end

    def new_params
      new = {user_id: current_user.id,
             mass: 0,
             height: 0,
             category: "Unknow",
             imc: 0}
    end

    def get_body_mass
      @body_mass = BodyMass.find_by(user_id: current_user.id)
    end

end
