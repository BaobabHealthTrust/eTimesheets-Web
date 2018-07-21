require 'test_helper'

class TimesheetControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get timesheet_new_url
    assert_response :success
  end

end
