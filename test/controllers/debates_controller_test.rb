require 'test_helper'

class DebatesControllerTest < ActionController::TestCase
  
  def setup
  @showdebate = debates(:one)
  @participation = participations(:left)
  @user = users(:one)
  
  end
  
  test "should get show" do
    log_in(@user)
    get :show, params: {id: @showdebate.id}
    assert_response :success
  end
  
  test "should post new" do
    assert_difference 'Debate.count' do
      post :create, params: {debate: {body: "test"}}
    end
  end



  test "should get index" do
    get :index
    assert_response :success
  end

end
