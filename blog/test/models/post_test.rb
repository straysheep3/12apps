require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'should not save post without title & body' do
    post = Post.new
    assert_not post.save
  end
  # test "the truth" do
  #   assert true
  # end
end
