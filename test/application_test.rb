require_relative 'test_helper'

class TestController < Roads::Controller
  def index
    'Hello!'
  end
end

class TestApp < Roads::Application
  def get_controller_and_action(env)
    [TestController, 'index']
  end
end

class RoadsAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get '/'

    assert last_response.ok?
    body = last_response.body
    assert body['Hello!']
  end
end