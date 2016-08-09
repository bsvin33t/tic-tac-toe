require 'spec_helper'

describe Board do
  it 'contains unmarked locations' do
    board = Board.new
    expect(board.empty_locations).to match([[0,0], [0,1], [0,2],  [1,0], [1,1], [1,2], [2,0], [2,1], [2,2]])
  end

  describe 'location' do
    context 'marking' do
      it 'can be marked with an x' do
        board = Board.new
        empty_location = board.empty_locations.first
        board.mark(empty_location, 'x')
        expect(board.empty_locations).not_to include(empty_location)
      end

      it 'indicates if marking is successful' do
        board = Board.new
        empty_location = board.empty_locations.first
        expect(board.mark(empty_location, 'x')).to eq(true)
      end

      it 'indicates if the marking failed' do
        board = Board.new
        empty_location = board.empty_locations.first
        board.mark(empty_location, 'x')
        expect(board.mark(empty_location, 'x')).to eq(false)
      end

      it 'tells me the locations where x has been marked' do
        board = Board.new
        location = board.empty_locations.first
        board.mark(location, 'x')
        expect(board.marked_by('x')).to eq([location])
      end

      it 'does not allow marking of the same location twice' do
        board = Board.new
        location = board.empty_locations.first
        board.mark(location, 'x')
        expect(board.mark(location, 'o')).to eq(false)
      end

      it 'keeps track of all the different locations which are marked' do
        board = Board.new
        location_1 = board.empty_locations.first
        board.mark(location_1, 'x')
        location_2 = board.empty_locations.first
        board.mark(location_2, 'x')

        expect(board.marked_by('x')).to match([location_1, location_2])
      end
    end
  end

  describe 'indicates if there is a victory' do
    let(:board) { Board.new }
    it 'for winning locations' do
      Board::WINNING_LOCATIONS.each do |winning_locations|
        winning_locations.each { |location| board.mark(location, 'x')}
        expect(board.winner?('x')).to be_truthy
      end
    end
  end
end
