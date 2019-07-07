require('minitest/autorun')
require('minitest/rg')

require_relative('../guest.rb')

class TestGuest < MiniTest::Test

  def setup()

    @guest = Guest.new("Frank")

  end

  def test_name
    assert_equal("Frank", @guest.name)
  end

end
