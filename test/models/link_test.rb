require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test 'valid link' do
    link = Link.new({
      original_url: 'www.my-app/this-is-a-url',
      code: 'JnK2n4',
      visitor_counter: 0,
      user_id: 1
    })

    assert link.valid?
  end

  test 'invalid link if user does not exist' do
    link = Link.new({
      original_url: 'www.my-app/this-is-a-url',
      code: 'JnK2n4',
      visitor_counter: 0,
      user_id: 2
    })

    assert link.invalid?
  end
end
