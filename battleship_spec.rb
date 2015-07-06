require_relative 'battleship.rb'

describe ShipPiece do
  before do
    @sp1 = ShipPiece.new()
  end
  describe '#has_position' do
    it 'should return a position object' do
      expect(@sp1.position).to be_a_kind_of(Point)
    end
  end
  describe '#tracks_hits' do
    it 'should remember whether it was hit' do
      expect(@sp1.is_hit?).to be false
      @sp1.hit()
      expect(@sp1.is_hit?).to be true
    end
  end
end

describe Ship do
  describe '#can_be_sunk' do
    it 'should not be sunk until hit in all places' do
      @sp1 = instance_double("ShipPiece", :is_hit? => false)
      @sp2 = instance_double("ShipPiece", :is_hit? => true)
      @sp3 = instance_double("ShipPiece", :is_hit? => true)
      @sh1 = Ship.new([@sp1, @sp2])
      expect(@sh1.is_sunk?).to be false
      @sh2 = Ship.new([@sp2, @sp3])
      expect(@sh2.is_sunk?).to be true
    end
  end
end

describe Board do
  describe '#hit_board_cell' do
    it 'should determine ships sunk from hitting specific squares' do
      @sp1 = ShipPiece.new({x: 0, y: 1})
      @sp2 = ShipPiece.new({x: 0, y: 2})
      @sh1 = Ship.new([@sp1, @sp2])
      @bd1 = Board.new()
      @bd1.add_ship(@sh1)
      @bd1.take_hit_at(0, 1)
      expect(@sh1.is_sunk?).to be false
      @bd1.take_hit_at(0, 2)
      expect(@sh1.is_sunk?).to be true
    end
  end
end
