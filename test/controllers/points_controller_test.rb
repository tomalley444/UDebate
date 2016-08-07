require 'test_helper'

class PointsControllerTest < ActionController::TestCase


  def setup
    
   @debate = debates(:one)
   @user = users(:one)
   @participation = participations(:left)
   @point = points(:one)
   
  end


  test "should create orphan point logged in" do
    assert_difference '@debate.points.count' do
  
      log_in(users(:one))
  
     post :create, params: {point:{body: 1}, debate_id: @debate.id, side: "left"}
     
    end

  end
  
  
    test "should create non-orphan point logged in" do
    assert_difference 'Point.count' do
  
      log_in(users(:one))
  
     post :create, params: {body: 1, parent_id: @point.id, side: "left"}
     
    end

  end
  
  
  test "should NOT create orphan point logged in" do
    assert_no_difference '@debate.points.count' do
  
     
  
     post :create, params: {point:{body: 1}, debate_id: @debate.id, side: "left"}
     
    end

  end
  
  
    test "should NOT create non-orphan point logged in" do
    assert_no_difference 'Point.count' do
  
     
     post :create, params: {body: 1, parent_id: @point.id, side: "left"}
     
    end

  end
  
end
