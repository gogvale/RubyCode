class Hangman
  def initialize
    @chosen_letters = []
    @chances = 5
    @game_over = false
    @secret_word = array_from_file.select { |word| word.length >= 5 && word.length <= 12 }.sample.downcase.split('')
    @user_word = @secret_word.clone.map { '_' }
    start_game
    endgame
  end

  def array_from_file
    File.open '5desk.txt' do |file|
      file.readlines.map(&:chomp)
    end
  end

  def print_status
    # Prints Game status
    system 'clear'
    puts "Chances: #{@chances}"
    puts "Used letters: #{@chosen_letters.join(', ')}"
    puts @user_word.join(' ')
  end

  def eval_ans(new_letter)
    # Checks if corresponding letter is part of answer
    # And if there's none left, game over
    @chances -= 1 unless @secret_word.include? new_letter
    @secret_word.each_with_index do |letter, index|
      @user_word[index] = new_letter if letter == new_letter
    end
    @game_over = true unless @user_word.include? '_'
  end

  def get_letter
    print 'Give me a letter:'
    letter = gets.chomp[0].downcase
    if ('a'..'z').include?(letter) && !@chosen_letters.include?(letter)
      letter
    else
      puts 'Not a valid letter, try again.'
      get_letter
    end
  end

  def start_game
    until @game_over || @chances.zero?
      print_status
      new_letter = get_letter
      @chosen_letters << new_letter
      eval_ans(new_letter)
    end
  end

  def endgame
    puts 'Game Over!'
    puts "Correct word: #{@secret_word.join}"
  end
end

Hangman.new.start_game
