class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = []
    @name1, @name2 = name1, name2
    place_stones
  end

  def place_stones
    14.times do |idx|
      if idx == 6 || idx == 13
        @cups << []
      else
        @cups << [:stone] * 4
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name) # 9-- 4 stones
    stone_count = @cups[start_pos].length
    @cups[start_pos] = []

    next_pos = start_pos + 1
    until stone_count == 0
      next_pos = 0 if next_pos > 13
      if next_pos == 6 && current_player_name != @name1
        next_pos += 1
        next
      elsif next_pos == 13 && current_player_name != @name2
        next_pos += 1
        next
      else
        @cups[next_pos] << :stone
        stone_count -= 1
        next_pos += 1
      end
    end

    render
    next_turn(next_pos-1)
  end


  # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  def next_turn(ending_cup_idx)
    # debugger
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side_empty?(0..5) || side_empty?(7..12)
  end

  def side_empty?(rows_range)
    @cups[rows_range].all? {|cup| cup.empty?}
  end

  def winner
    player1_points, player2_points = @cups[6].count, @cups[13].count

    case player1_points <=> player2_points
    when 1
      @name1
    when 0
      :draw
    when -1
      @name2
    end
  end
end
