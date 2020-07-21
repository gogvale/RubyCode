class Board
  def initialize
    @squares = { a: [nil, nil, nil], b: [nil, nil, nil], c: [nil, nil, nil] }
    @turn = 'X'
    @winner = nil
    @game_over = false
    prompt_user until @game_over
  end

  def prompt_user
    print_board
    print 'Give me the coordinates (eg. A0):'
    coords = gets.chomp.split('')
    mark_board(coords[0], coords[1].to_i)
  end

  def print_row(array)
    array.join('\t')
  end

  def mark_board(x, y)
    x = x.downcase.to_sym
    if @squares[x][y].nil?
      @squares[x][y] = @turn
      toggle_turn
    else
      puts 'Sorry, this position is already taken. Try again'
    end
    if theres_a_winner?
      print_board
      @game_over = true
      puts 'Game Over!'
      puts "#{@winner} wins!"
    end
  end

  def check_array(row)
    @winner = row[0] if row.uniq.length == 1 && !row[0].nil?
  end

  def theres_a_winner?
    # checks for rows first
    @squares.values.each { |row| check_array(row) }

    # checking columns
    cols = []
    (0..2).each do |idx|
      cols << [
        @squares[:a][idx],
        @squares[:b][idx],
        @squares[:c][idx]
      ]
    end
    cols.each { |col| check_array(col) }

    # checks cross
    cross = [
      [@squares[:a][0],
       @squares[:b][1],
       @squares[:c][2]],
      [@squares[:a][2],
       @squares[:b][1],
       @squares[:c][0]]
    ]
    cross.each { |n| check_array(n) }

    return true unless @winner.nil?

    false
  end

  def toggle_turn
    @turn = if @turn == 'X'
              'O'
            else
              'X'
            end
  end

  def print_board
    clear_screen
    puts "\t0\t1\t2"
    puts "A:\t#{@squares[:a]}"
    puts "B:\t#{@squares[:b]}"
    puts "C:\t#{@squares[:c]}"
  end

  def clear_screen
    system 'clear'
  end
end

game = Board.new
