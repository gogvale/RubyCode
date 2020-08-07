require './caesar_cypher'

describe '#replace_char' do
  it 'simple replacement within range' do
    expect(replace_char('a', 2)).to eql('c')
  end
  it 'from z goes to a' do
    expect(replace_char('z', 2)).to eql('b')
  end

  it 'works with uppercase' do
    expect(replace_char('Z', 2)).to eql('B')
  end

  it 'works with HUGE numbers' do
    expect(replace_char('a', 26_000_000)).to eql('a')
  end
  it 'works with negative numbers' do
    expect(replace_char('a', -1)).to eql('z')
  end
  it 'works with 0' do
    expect(replace_char('F', 0)).to eql('F')
  end
end
