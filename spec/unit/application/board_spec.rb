require 'spec_helper'

describe Board do
  it 'contains unmarked locations' do
    board = Board.new
    expect(board.empty_location).to match([[0,0], [0,1], [0,2],  [1,0], [1,1], [1,2], [2,0], [2,1], [2,2]])
  end
end
