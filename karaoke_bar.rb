class KaraokeBar

  attr_reader :name

  def initialize(name, rooms)
    @name = name
    @rooms = rooms
  end

  def number_of_rooms
    @rooms.length
  end

  def names
    rooms = @rooms.map { |room| room.name}
  end

  #is there a better way to do this? 

  def total_income
    income = 0
    @rooms.each do |room|
      income += room.till
    end
    return income
  end

  # def total_income
  #   income = 0
  #   for room in @rooms
  #     income += room.till
  #   end
  # return income
  # end

end
