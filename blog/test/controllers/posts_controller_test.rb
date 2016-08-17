require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get root index' do
    get '/'
    assert_response :success
  end

  test 'should get new' do
    get '/posts/new'
    assert_response :success
  end
  # test "the truth" do
  #   assert true
  # end
end
