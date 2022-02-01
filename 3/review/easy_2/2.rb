munsters_description = "The Munsters are creepy in a good way."

p munsters_description.chars.map { |c| c.upcase == c ? c.downcase : c.upcase }.join

p munsters_description = munsters_description[0].upcase + munsters_description[1..-1].downcase

