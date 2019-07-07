class Room

  attr_reader :name, :entrance_fee, :till

  def initialize(name, entrance_fee)
    @name = name
    @entrance_fee = entrance_fee
    @songs = []
    @guests = []
    @till = 0
  end

  def songs_available
    songs = @songs.map {|song| song.name}
    return songs
  end

  def number_of_guests
    @guests.length
  end
#Ask about passing room in as an argument here. 
  def add_guest(guest,room)
    if room.number_of_guests < 4
    @guests.push(guest.name)
    room.add_to_till
    guest.pay_entry_fee(room)
    end
  end

  def remove_guest(guest)
    @guests.each do |person|
      if person == guest.name
        @guests.delete(person)
      end
    end
  end

  def number_of_songs
    @songs.length
  end

  def add_song(song)
    @songs << song
  end

  def add_songs(songs)
    @songs.concat(songs)
  end

  def add_to_till
    @till += @entrance_fee
  end


end
