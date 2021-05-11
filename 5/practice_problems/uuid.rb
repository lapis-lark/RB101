def uuid
unique = ''
hexa = '0123456789abcdef'.chars
32.times { unique << hexa.sample }
[8, 13, 18, 23].each { |n| unique.insert(n, '-')}
unique
end

def uuid
  unique = ''
  hexa = '0123456789abcdef'.chars
  32.times { unique << hexa.sample }
  index = 8
  4.times do 
    unique.insert(index, '-')
    index += 5
  end
  unique
end

def uuid
  unique = ''
  hexa = '0123456789abcdef'.chars
 
  sections = [8,4,4,4,12]
  sections.each_with_index do |section, index|
    section.times { unique << hexa.sample }
    unique << '-' unless index == sections.size - 1
  end
  unique
end

p uuid
p uuid