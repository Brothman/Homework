class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @name1 = name1 
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each.with_index do |el, index|
      next if index == 6 || index == 13
      cups[index].concat([:stone, :stone, :stone, :stone])
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 13
    raise "Starting cup is empty" if cups[start_pos].length == 0
    true
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    #empty the cup
    cups[start_pos] = []
    if current_player_name == name1
      valid_pos = [1, 2, 3, 4, 5, 6]
    else
      valid_pos = [7, 8, 9, 10, 11, 12, 13]
    end

    while stones.length > 0
      #move the stones to the next position, mod 14 in case you're off the board
      start_pos = (start_pos + 1) % 14

      if (start_pos == 6)
        cups[start_pos] << stones.shift if current_player_name == name1
        next
      elsif (start_pos == 13)
        cups[start_pos] << stones.shift if current_player_name == name2
      else
        cups[start_pos] << stones.shift
      end
    end
    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    end

    if cups[ending_cup_idx].size == 1
      return :switch
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
    cups[0..6].all? { |cup| cup.empty? } || cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    player1_total = cups[6].size
    player2_total = cups[13].size

    if player1_total == player2_total
      return :draw
    elsif player1_total > player2_total
      return name1
    else
      return name2
    end
  end
end
