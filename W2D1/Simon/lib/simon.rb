class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system("clear")
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    user_sequence = require_sequence

    round_success_message(user_sequence)
    @sequence_length += 1
    if @seq != user_sequence
      @game_over = true
    end
  end

  def show_sequence
    add_random_color
    puts @seq.join(" ")
    sleep(1.5)
    system("clear")
  end

  def require_sequence
    puts "Enter the sequence EXACTLY as you saw it..."
    user_sequence = gets.chomp.split
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message(user_sequence)
    if @seq == user_sequence
      puts "Nice! You correctly repeated the sequence."
    else
      puts "Oh no! Incorrect..."
    end
  end

  def game_over_message
    puts "You lost! Too bad."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
