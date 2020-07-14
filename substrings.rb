dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

def substrings(string, dictionary)
  string.split.reduce(Hash.new(0)) do |hash, word|
    word.gsub(/\W/,'').downcase!
    dictionary.each do |n|
      if word.include? n
        hash[n] += 1
      end
    end
    hash
  end
end

puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
