require "test_helper"

class EmployeesProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get employees_profiles_show_url
    assert_response :success
  end
end
