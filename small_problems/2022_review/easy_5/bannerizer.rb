# base problem; single line
def print_in_box(str)
  top_bottom = "+-#{'-' * str.size}-+"
  middle = "| #{' ' * str.size} |"
  text = "| #{str} |"
  puts "#{top_bottom}\n#{middle}\n#{text}\n#{middle}\n#{top_bottom}"
end

# further; multi-line, but words cut in middle at line ends
def print_in_box(str)
  line_length = (str.size / 76 > 0 ? 76 : str.size)
  text_lines = []
  until str.size <= 76
    text_lines << str.slice!(0..75)
  end
  text_lines << str

  text_lines.map! { |line| "| #{line.ljust(line_length)} |" }
  text = text_lines.join("\n")

  top_bottom = "+-#{'-' * line_length}-+"
  middle = "| #{' ' * line_length} |"
  puts "#{top_bottom}\n#{middle}\n#{text}\n#{middle}\n#{top_bottom}"
end

# words no longer cut off
def print_in_box(str)
  line_length = (str.size / 76 > 0 ? 76 : str.size)

  text_lines = clean_lines(str)
  text_lines.map! { |line| "| #{line.ljust(line_length)} |" }
  text = text_lines.join("\n")

  top_bottom = "+-#{'-' * line_length}-+"
  middle = "| #{' ' * line_length} |"
  puts "#{top_bottom}\n#{middle}\n#{text}\n#{middle}\n#{top_bottom}"
end

def clean_lines(str)
  return [str] if str.size < 77
  words = str.split(' ')
  lines = []

  until words.empty?
    row = ''
    until words.empty?
      break if row.size + words[0].size > 75
      row << ("#{words.shift} ")
    end
    lines << row
  end

  lines
end

print_in_box('jus ruby jammin ;)')

print_in_box 'If pattern is a String, then its contents are used as the delimiter when splitting str. If pattern is a single space, str is split on whitespace, with leading and trailing whitespace and runs of contiguous whitespace characters ignored.'
