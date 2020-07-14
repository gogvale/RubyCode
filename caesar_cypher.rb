$a, $z, $A, $Z = "azAZ".bytes #[97, 122, 65, 90]
$alphabet = ($a..$z).to_a + ($A..$Z).to_a

def replace_char(char, shift)
  char_ascii = char.ord

  if (shift == 0 or !$alphabet.include?(char_ascii))
    return char
  end

  if shift > 0
    if char_ascii == $z
      char_ascii = $a
    elsif char_ascii == $Z
      char_ascii = $A
    else
      char_ascii += 1
    end
    shift -= 1
  elsif shift < 0
    if char_ascii == $a
      char_ascii = $z
    elsif char_ascii == $A
      char_ascii = $Z
    else
      char_ascii -= 1
    end
    shift += 1
  end

  new_char = char_ascii.chr

  return replace_char(new_char, shift)
end

def caesar_cipher(string, shift)
  shift %= 26
  return string.split("").map { |char| replace_char(char, shift) }.join
end
