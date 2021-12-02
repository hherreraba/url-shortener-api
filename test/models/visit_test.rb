require 'test_helper'
require 'date'

class VisitTest < ActiveSupport::TestCase
  test 'valid visit' do
    visit = Visit.new({
      ip_address: '202.60.23.2',
      user_agent: 'google-chome',
      date_of_visit: Date.today,
      link_id: 1
    })

    assert visit.valid?
  end

  test 'invalid visit if link does not exist' do
    visit = Visit.new({
      ip_address: '202.60.23.2',
      user_agent: 'google-chome',
      date_of_visit: Date.today,
      link_id: 2
    })

    assert visit.invalid?
  end
end
