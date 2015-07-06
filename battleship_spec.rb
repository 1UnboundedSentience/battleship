require_relative 'battleship.rb'

describe ShipPiece do
  before do
    @sp1 = ShipPiece.new()
  end
  describe '#has_position' do
    it 'should return a position object' do
      expect(@sp1).to be_a_kind_of(Point)
    end
  end
end


=begin

Expect two classes, we'll use two objects to test
both

One for choosing ships part, the other for
gameplay

Our place ships class should loop until players
successfully place their ships, and then transfers
over to the PlayGame class

Expect
=end