require "test_helper"

class LinksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should get links' do
    sign_in users(:one)

    get '/links/'

    assert_response :success
  end

  test 'should create visit to link' do
    sign_in users(:one)

    get '/aDlh2K'

    assert_response :success
  end

  test 'should create link' do
    sign_in users(:one)

    post '/links/', params: { link: { original_url: 'www.my-app/this-is-a-url' } }

    assert_response :success
  end

  test 'should update link' do
    sign_in users(:one)

    patch '/links/aDlh2K', params: { link: { original_url: 'www.my-app/new-url' } }

    assert_response :success
  end

  test 'should delete link' do
    sign_in users(:one)

    delete '/links/aDlh2K'

    assert_response :success
  end
end
