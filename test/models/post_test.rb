require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "lead is the same if lead is less than 100 characters" do
    p = Post.new(content: "Hello")
    assert_equal "Hello", p.lead
  end

  test "lead is truncated if content is more than 100 characters" do
    p = Post.new(content: "A" * 130)
    assert_equal ("A" * 100) + "...", p.lead
  end
end
