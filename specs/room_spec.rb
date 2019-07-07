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

    @guest = Guest.new("Frank")
    @guest2 = Guest.new("Bob")

    @room = Room.new("Cool room")
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
    assert_equal(1, @room.add_guest(@guest))
  end

  def test_can_remove_guest
    @room.add_guest(@guest)
    @room.add_guest(@guest2)
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




end
