require './ttt.rb'

describe Board do
  describe '#theres_a_winner?' do
    it 'complete row' do
      board = Board.new
      squares = board.squares.clone
      squares[:a] = %w[X X X]
      board.squares = squares
      expect(board.theres_a_winner?).to eql(true)
    end
    it 'complete col' do
      board = Board.new
      squares = board.squares.clone
      squares.map { |row| row[1][0] = 'X' }
      board.squares = squares
      expect(board.theres_a_winner?).to eql(true)
    end
    it 'complete cross' do
      board = Board.new
      squares = board.squares.clone
      squares.each_with_index.map { |row, idx| row[1][idx] = 'X' }
      board.squares = squares
      expect(board.theres_a_winner?).to eql(true)
    end
  end
end
