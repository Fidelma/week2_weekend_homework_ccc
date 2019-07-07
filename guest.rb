class Guest

  attr_reader :name, :age, :wallet, :favourite_song

  def initialize(name, age, wallet, favourite_song)
    @name = name
    @age = age
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def favourite_song_on_playlist(room)
    songs_in_room = room.songs_available
    songs_in_room.each do |song|
      if song == @favourite_song
        return "woohoo"
      else
        return "boo"
      end
    end
  end

  def pay_entry_fee(room)
    @wallet -= room.entrance_fee
  end 


end
