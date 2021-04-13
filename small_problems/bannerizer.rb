WIDTH = 77

def string_to_lines(string)
  lines = []
  loop do
    lines << string[0...WIDTH]
    break lines if string[WIDTH].nil?
    string = string[WIDTH..-1]
  end
  lines
end

def print_in_box(string)
  lines = string_to_lines(string)
  top_bottom = "+#{'-' * (lines[0].size + 2)}+"
  empty_line = "| #{' ' * lines[0].size} |"

  puts top_bottom
  puts empty_line
  lines.each { |line| puts "| #{line}".ljust(lines[0].size + 2) + ' |' }
  puts empty_line
  puts top_bottom
end

print_in_box("The Horn is very close, barely 30 miles off, out of sight under the mantle of big cumulus hiding the mountains of Tierra del Fuego. At times I seem to vaguely make something out a hand’s breadth to the left of the bow. And Diego Ramirez, my whole life when I saw it appear a few hours ago, is now a memory of the southern route. The sun has set. The sky readies itself for night. The first planets appear. The moon will be up within the hour; she will actually rise, because the horizon in that direction is clear as well. Clear ahead, clear astern, clear to the right and clear above. The stars out, still almost invisible; later they will be bright. The clearness of the sky is exceptional; it has lasted all day long. And the barometer is as clear as the sky, with hardly a tremor.")
