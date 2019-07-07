require('minitest/autorun')
require('minitest/rg')

require_relative('../song.rb')

class TestSong < MiniTest::Test

  def setup()
    @song1 = Song.new("Purple Rain","Prince")
    @song2 = Song.new("something","someone")
    @song3 = Song.new("something else","someone else")
  end

  def test_name
    assert_equal("Purple Rain", @song1.name)
  end

  def test_artist
    assert_equal("someone", @song2.artist)
  end

end
