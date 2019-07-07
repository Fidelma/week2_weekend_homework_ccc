require('minitest/autorun')
require('minitest/rg')

require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')



class TestGuest < MiniTest::Test

  def setup()

    @guest = Guest.new("Frank", 21, 100, "Purple Rain")
    @guest2 = Guest.new("Alice", 22, 50, "Don't stop me")


    @song1 = Song.new("Purple Rain","Prince")
    @song2 = Song.new("something","someone")
    @song3 = Song.new("something else","someone else")

    @collection = [@song1, @song2, @song3]

    @room = Room.new("Edgy Room", 7, @collection)

  end

  def test_name
    assert_equal("Frank", @guest.name)
  end

  def test_age
    assert_equal(21, @guest.age)
  end

  def test_wallet
    assert_equal(100, @guest.wallet)
  end

  def test_favourite_song
    assert_equal("Purple Rain", @guest.favourite_song)
  end

  def test_favourite_song_on_playlist__true
    # @room.add_song(@song1)
    assert_equal("woohoo", @guest.favourite_song_on_playlist(@room))
  end

  def test_favourite_song_on_playlist__false
    # @room.add_song(@song1)
    assert_equal("boo", @guest2.favourite_song_on_playlist(@room))
  end

  def test_pay_entry_fee
    @guest.pay_entry_fee(@room)
    assert_equal(93, @guest.wallet)
  end


end
