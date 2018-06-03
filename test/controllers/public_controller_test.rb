require 'test_helper'

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get organization" do
    get public_organization_url
    assert_response :success
  end

end
