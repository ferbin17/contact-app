require "test_helper"

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "test with all atrtributes" do
    message = messages(:zero)
    assert message.valid?, "Message valid with all atrtributes"
  end
  
  test "test without any atrtributes" do
    message = messages(:one)
    assert_not message.valid?, "Message valid without any atrtributes"
  end
  
  test "test without first name" do
    message = messages(:two)
    assert_not message.valid?, "Message valid without a first name"
  end
  
  test "test without last name" do
    message = messages(:three)
    assert_not message.valid?, "Message valid without a last name"
  end
  
  test "test without email" do
    message = messages(:four)
    assert_not message.valid?, "Message valid without a email"
  end
  
  test "test without message" do
    message = messages(:five)
    assert_not message.valid?, "Message valid without a message"
  end
  
  test "test without phone" do
    message = messages(:six)
    assert message.valid?, "Message valid without phone"
  end
  
  test "test with email and invalid email pattern" do
    message = messages(:seven)
    assert_not message.valid?, "Message valid with invalid email pattern"
  end

end
