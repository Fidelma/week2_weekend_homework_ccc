class Room

  attr_reader :name

  def initialize(name)
    @name = name
    @songs = []
    @guests = []
  end

  def songs_available
    songs = @songs.map {|song| song.name}
    return songs
  end

  def number_of_guests
    @guests.length
  end

  def add_guest(guest)
    @guests.push(guest.name)
    return @guests.length
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




end
