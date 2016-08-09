class Board

  WINNING_LOCATIONS = [[[0, 0], [0, 1], [0, 2]],
                   [[1, 0], [1, 1], [1, 2]],
                   [[2, 0], [2, 1], [2, 2]],
                   [[0, 0], [1, 0], [2, 0]],
                   [[1, 0], [1, 1], [1, 2]],
                   [[2, 0], [2, 1], [2, 2]],
                   [[0, 0], [1, 1], [2, 2]],
                   [[0, 2], [1, 1], [2, 0]]]


  attr_reader :empty_locations

  def initialize
    @empty_locations = [[0,0], [0,1], [0,2],  [1,0], [1,1], [1,2], [2,0], [2,1], [2,2]]
    @filled_locations = {}
  end

  def mark(location, marker)
    location = remove_from_empty_location(location)
    if location
      @filled_locations[location] = marker
    end
    !!location
  end

  def marked_by(marker)
    @filled_locations.select{|_,value| value == marker}.keys
  end

  def winner?(marker)
    marked = marked_by(marker)
    WINNING_LOCATIONS.each do |winning_locations|
      return true if locations_present?(marked, winning_locations)
    end
    false
  end

  private

  def remove_from_empty_location(location)
    @empty_locations.delete(location)
  end

  def locations_present?(superset, subset)
    subset - superset == []
  end
end
