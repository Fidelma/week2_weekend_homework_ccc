require('minitest/autorun')
require('minitest/rg')

require_relative('../karaoke_bar.rb')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../guest.rb')

class TestKaraokeBar < MiniTest::Test

  def setup()
    @song1 = Song.new("Purple Rain","Prince")
    @song2 = Song.new("something","someone")
    @song3 = Song.new("something else","someone else")

    @collection = [@song1, @song2, @song3]

    @guest = Guest.new("Frank", 21, 100, "Purple Rain")
    @guest2 = Guest.new("Alice", 22, 50, "Don't stop me")

    @room = Room.new("Cool room", 5)
    @room2 = Room.new("Edgy room", 7)
    @rooms = [@room, @room2]

    @karaoke_bar = KaraokeBar.new("CodeClan Caraoke", @rooms)

  end

  def test_name
    assert_equal("CodeClan Caraoke", @karaoke_bar.name)
  end

  def test_number_of_rooms
    assert_equal(2, @karaoke_bar.number_of_rooms)
  end

  def test_names_of_rooms
    assert_equal(["Cool room", "Edgy room"], @karaoke_bar.names)
  end

  def test_add_up_all_income
    @room.add_guest(@guest, @room)
    @room2.add_guest(@guest2, @room2)
    assert_equal(12, @karaoke_bar.total_income)
    assert_equal(5, @room.till)
    assert_equal(7, @room2.till)
    assert_equal(95, @guest.wallet)
    assert_equal(43, @guest2.wallet)
  end

end
