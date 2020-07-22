require 'colorize'
require 'pry'

class Mastermind
  def initialize
    @peg_colors = { r: :light_red, b: :light_blue, y: :yellow, g: :green, w: :white, p: :magenta }
  end

  def reset
    @answer = []
    @turns = 0
    @pc_correct = {}
    @pc_right = []
    @pc_wrong = []
  end

  def start_game
    reset
    if user_guessing?
      @secret = random_input
      prompt_user until guessed_correctly?
      puts "You have guessed the secret in #{@turns} turns!"
    else
      set_secret
      computer_guess until guessed_correctly?
      puts "The PC took #{@turns} turns to guess your code (it's still learning)"
    end
    print 'Answer: '
    print_secret
  end

  private

  def add_correct(idx, ans)
    @pc_correct[idx] = ans
    @pc_right -= @pc_correct.values
  end

  def add_right(ans)
    unless @pc_right.include? ans
      @pc_right << ans unless @pc_correct.values.include? ans
    end
  end

  def computer_guess
    @answer = random_input
    set_answer if @pc_correct.length == @secret.length
    # TODO: implement algorithm to guess user answer
  end

  def guessed_correctly?
    return false if @answer.empty?

    @turns += 1
    return true if @answer == @secret

    validation_array = []
    @answer.each_with_index do |ans, idx|
      validation_array << if ans == @secret[idx]
                            add_correct(idx, ans) if @pc_correct[idx].nil?
                            ans.to_s.colorize(:green)
                          elsif @secret.include? ans
                            add_right(ans)
                            ans.to_s.colorize(:yellow)
                          else
                            @pc_wrong << ans unless @pc_wrong.include? ans
                            ans.to_s.colorize(:light_red)
                          end
    end
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
  end

  def random_input
    input = []
    while input.length < 4
      sample = @peg_colors.keys.sample
      input << sample unless input.include? sample
    end
    input
  end

  def set_answer
    @pc_correct.each_pair { |index, color| @answer[index] = color }
  end

  def set_secret
    input = []
    until valid_input? input
      print_options
      print "Please, set the answer (eg. 'rbgy'):"
      input = gets.chomp.split('').map(&:to_sym)
    end
    @answer = input
  end

  def user_guessing?
    puts 'Select option:'
    puts '1) Crack the code'
    puts '2) Set the code'
    print '>>>'
    ans = gets.chomp.to_i
    if ans == 1
      true
    elsif ans == 2
      false
    else
      user_guessing?
    end
  end

  def valid_input?(arr)
    arr.uniq.length == 4 && arr.all? { |i| @peg_colors.keys.include? i }
  end
end
