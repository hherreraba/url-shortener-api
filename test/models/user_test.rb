require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new({
      email: 'test1@example.com',
      password: '12345678'
    })

    assert user.valid?
  end

  test 'invalid user if email already exists' do
    user1 = User.new({
      email: 'test@example.com',
      password: '12345678'
    })

    assert user1.invalid?
  end
end
