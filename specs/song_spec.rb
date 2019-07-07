require('minitest/autorun')
require('minitest/rg')

require_relative('../song.rb')

class TestSong < MiniTest::Test

  def setup()
    @song = Song.new("All to myself", "Amber Coffman")
  end

  def test_name
    assert_equal("All to myself", @song.name)
  end

  def test_artist
    assert_equal("Amber Coffman", @song.artist)
  end

end
