class Board
  attr_accessor :cups, :current_player_name

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    @cups.each_index do |idx|
      next if idx == 6 || idx == 13
      4.times { @cups[idx] << :stone }
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 13
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise 'Staring cup is empty'
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13

      if cup_idx == 6 && current_player_name == @player2
        cup_idx += 1
      elsif cup_idx == 13 && current_player_name == @player1
        cup_idx = 0
      end

      @cups[cup_idx] << stones.pop
    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1 && [0,1,2,3,4,5].include?(ending_cup_idx)
      opposite_cup_idx = 12 - ending_cup_idx
      opposite_cup_stones = @cups[opposite_cup_idx]
      captured_stones = opposite_cup_stones.pop(opposite_cup_stones.count)
      @cups[6] << captured_stones.pop
      @cups[ending_cup_idx] << captured_stones.pop if current_player_name == @player1
      @cups[13] << captured_stones.pop if current_player_name == @player2
      :switch
    else
      :switch
    end
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    player1_side_empty = @cups[0..5].all?(&:empty?)
    player2_side_empty = @cups[7..12].all?(&:empty?)
    player1_side_empty || player2_side_empty
  end

  def winner
    player1_score = @cups[6].count
    player2_score = @cups[13].count

    if player1_score == player2_score
      :draw
    elsif player1_score > player2_score
      @player1
    else
      @player2
    end
  end
end