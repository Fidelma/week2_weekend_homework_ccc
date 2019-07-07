require('minitest/autorun')
require('minitest/rg')

require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../guest.rb')

class TestRoom < MiniTest::Test

  def setup()

    @song1 = Song.new("Purple Rain","Prince")
    @song2 = Song.new("something","someone")
    @song3 = Song.new("something else","someone else")

    @collection = [@song1, @song2, @song3]

    @guest = Guest.new("Frank", 21, 100, "Purple Rain")
    @guest2 = Guest.new("Alice", 22, 50, "Don't stop me")

    @room = Room.new("Cool room", 5)
    # "Purple Rain","something","something else"

  end

  def test_name
    assert_equal("Cool room", @room.name)
  end

  def test_songs_available
    assert_equal([], @room.songs_available)
  end

  def test_number_of_guests
    assert_equal(0, @room.number_of_guests)
  end

  def test_can_add_guest
    @room.add_guest(@guest,@room)
    assert_equal(1, @room.number_of_guests)
  end


  def test_can_remove_guest
    @room.add_guest(@guest,@room)
    @room.add_guest(@guest2,@room)
    @room.remove_guest(@guest)
    assert_equal(1, @room.number_of_guests)
  end

  def test_number_of_songs
    assert_equal(0, @room.number_of_songs)
  end

  def test_can_add_single_song_to_room
    @room.add_song(@song1)
    assert_equal(["Purple Rain"], @room.songs_available)
  end

  def test_can_add_songs_to_room
    @room.add_songs(@collection)
    assert_equal(["Purple Rain","something","something else"], @room.songs_available)
  end

  def test_entrance_fee
    assert_equal(5, @room.entrance_fee)
  end

  def test_add_guest_4_maximum
    @room.add_guest(@guest, @room)
    @room.add_guest(@guest, @room)
    @room.add_guest(@guest, @room)
    @room.add_guest(@guest, @room)
    @room.add_guest(@guest, @room)
    assert_equal(4, @room.number_of_guests)
    assert_equal("sorry this room is already fully booked", @room.add_guest(@guest, @room))
  end

  def test_add_guest_take_money
    @room.add_guest(@guest, @room)
    assert_equal(95, @guest.wallet)
    assert_equal(5, @room.till)
  end






end
