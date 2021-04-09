def select_letter line, letter
  counter = 0
  size = line.size + 1
  selected = ""

  until counter == size
    if line[counter] == letter
      selected << letter
    end

    counter += 1
  end
  selected
end




question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a') # => "aaaaaaaa"
p select_letter(question, 't') # => "ttttt"
p select_letter(question, 'z') # => ""