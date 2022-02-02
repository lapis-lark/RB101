def cleanup(str)
  str.gsub!(/[^a-zA-Z]/, ' ')
  str.gsub!(/\s+/, ' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '