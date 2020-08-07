require './caesar_cypher'

describe '#caesar_cipher' do
  it 'simple replacement within range' do
    expect(caesar_cipher('abcde', 2)).to eql('cdefg')
  end
  it 'from z goes to a' do
    expect(caesar_cipher('wxyz', 2)).to eql('yzab')
  end

  it 'works with uppercase' do
    expect(caesar_cipher('WXyZ', 2)).to eql('YZaB')
  end

  it 'works with HUGE numbers' do
    expect(caesar_cipher('Hello, World', 26_000_000)).to eql('Hello, World')
  end
  it 'works with negative numbers' do
    expect(caesar_cipher('Uryyb, Jbeyq!', -13)).to eql('Hello, World!')
  end
  it 'works with 0' do
    expect(caesar_cipher('Goodbye, World', 0)).to eql('Goodbye, World')
  end
end
