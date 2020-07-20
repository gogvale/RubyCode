dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def substrings(string, dictionary)
  string.split.each_with_object(Hash.new(0)) do |word, hash|
    word.gsub(/\W/, '').downcase!
    dictionary.each do |n|
      hash[n] += 1 if word.include? n
    end
  end
end

puts substrings('below', dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
