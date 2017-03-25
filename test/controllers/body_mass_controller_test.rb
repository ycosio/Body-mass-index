require 'test_helper'

class BodyMassControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get body_mass_index_url
    assert_response :success
  end

end
