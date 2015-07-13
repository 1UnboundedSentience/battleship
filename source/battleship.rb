class ShipPiece
  attr_reader :position

  def initialize(point_hash={})
    x = point_hash[:x] || 0
    y = point_hash[:y] || 0
    @position = Point.new(x, y)
    @is_hit = false
  end

  # def position
  #   @position
  # end

  def hit
    @is_hit = true
  end

  def is_hit?
    @is_hit
  end


  #returning to this later
  def take_hit_at(x_coord, y_coord)
    #if @position.is_equal_to(x_coord, y_coord)
    if @position == Point.new(x_coord, y_coord)
      @is_hit = true
    end
  end

end




class Point
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  #def is_equal_to(x, y)
  def ==(point)
    #return @x == x && @y == y
    return @x == point.x && @y == point.y
  end
end

class Ship
  def initialize (ship_sections)
    @ship_sections = ship_sections
  end

  def take_hit_at(x_coord, y_coord)
    @ship_sections.each do |ship_piece|
      ship_piece.take_hit_at(x_coord, y_coord)
    end
  end

  def is_sunk?
    @ship_sections.each do |sec|
      if not sec.is_hit?
        return false
      end
    end
    true
  end
end

#behaviors: changing state of cells
#attributes: location of ships
class Board
  attr_reader :p1board, :p2board
  def initialize
    @ships = []
    @p1board = Array.new(10) {Array.new(10)}
    @p2board = Array.new(10) {Array.new(10)}
  end
  def display_boards

  end
  def add_ship(ship)
    @ships << ship
  end

  def take_hit_at(x_coord, y_coord)
    @ships.each do |ship|
      ship.take_hit_at(x_coord, y_coord)
    end
  end
end

new_game = Board.new()
p new_game.p1board
#new_game.add_ship(Ship.new())

#attributes: state of each cell as guessed or unguessed, hit water or
#hit ship
class TrackingBoard
end

class Player
  def initialize
  end
end
# class PlaceShip
#   attr_accessor :boardp1, :boardp2
#   def initialize
#     @boardp1 = Array.new(10) {Array.new(10)}
#     @boardp2 = Array.new(10) {Array.new(10)}
#   end

#   def choose_the_ship
#     puts "please enter the coordinates you would like to place the ship and followed by left or down for ship alignment"
#     input = gets.chomp.split
#     if @boardp1[0][1]
#   end

# end

# class GuessingGame
#   def initialize
#   end

=begin

initialize 10*10 board in every instance of Board

=end



# end
