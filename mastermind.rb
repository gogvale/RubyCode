require 'colorize'

class Mastermind
  def initialize
    @peg_colors = { r: :light_red, b: :light_blue, y: :yellow, g: :green, w: :white, p: :magenta }
    reset
    # set_game_mode
  end

  def self.test
    puts 'I am now red'.red
  end

  def reset
    @secret = random_input
    @answer = []
    @turns_left = 12
  end

  def start
    prompt_user until guessed_correctly? || @turns_left.negative?
    if @turns_left.positive?
      puts "You have guessed the secret with #{@turns_left} turns left, HOORAY!!"
    else
      puts 'Game Over. Better luck next time…'
    end
    print 'Answer: '
    print_secret
  end

  # private

  def computer_guess; end

  def user_guessing?
    true
  end

  def generate_secret
    @secret.clear
    4.times do
      @secret << @peg_colors.keys.sample
    end
  end

  def guessed_correctly?
    return true if @answer == @secret
    return false if @answer.empty?

    validation_array = []
    @answer.each_with_index do |ans, idx|
      validation_array << if ans == @secret[idx]
                            ans.to_s.colorize(:green)
                          elsif @secret.include? ans
                            ans.to_s.colorize(:yellow)
                          else
                            ans.to_s.colorize(:light_red)
                          end
    end
    puts validation_array.join
    false
  end

  def print_options
    print 'Options: '
    @peg_colors.keys.each { |color| print color.to_s.colorize(@peg_colors[color]) }
    puts ''
  end

  def print_secret
    @secret.map { |i| print i.to_s.colorize(@peg_colors[i]) }
    puts ''
  end

  def prompt_user
    print_options
    answer = []
    until valid_input? answer
      print '>>>'
      answer = gets.chomp.split('').map(&:to_sym)
    end
    @answer = answer
    @turns_left -= 1
  end

  def set_secret
    input = []
    until valid_input? input
      p @peg_colors
      print "Please, set the answer (eg. 'rbgy'):"
      input = gets.chomp.split('').map(&:to_sym)
    end
    @answer = input
  end

  def set_game_mode
    if user_guessing?
      start
    else
      @turns_left = 5
      set_secret
      computer_guess until guessed_correctly? || @turns_left.zero?
    end
  end

  def random_input
    input = []
    while input.length < 4
      sample = @peg_colors.keys.sample
      input << sample unless input.include? sample
    end
    input
  end

  def valid_input?(arr)
    arr.uniq.length == 4 && arr.all? { |i| @peg_colors.keys.include? i }
  end
end
