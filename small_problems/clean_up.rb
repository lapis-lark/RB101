VALID_CHARS = ('a'..'z').to_a

def cleanup(string)
  new_string = ''

  string.chars.each do |char|
    if VALID_CHARS.include?(char)
      new_string << char
    else
      new_string << ' ' unless new_string[-1] == ' '
    end
  end

  new_string
end

p cleanup("---what's my +*& line?") == ' what s my line '
