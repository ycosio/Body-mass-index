require "rails_helper"

RSpec.describe BodyMassController, :type => :controller do

let(:user) {create(:user)}

before(:each) do
  get :index
  login(user)
end

  describe "GET #index" do
    it "responds successfully with an HTTP 303 status code" do
      expect(response).to have_http_status(302)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end

    #it "loads all of the posts into @posts" do
      #post1, post2 = BodyMass.create!, BodyMass.create!
      #get :index

      #expect(assigns(:posts)).to match_array([post1, post2])
    #end

  end

end
