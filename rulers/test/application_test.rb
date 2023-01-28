require_relative 'test_helper'

class TestApp < Rulers::Application
end

class RulersAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get '/'

    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
  end

  def test_content_type
    get '/'

    assert last_response.ok?
    assert_equal "text/html", last_response.headers["Content-Type"]
  end
end
