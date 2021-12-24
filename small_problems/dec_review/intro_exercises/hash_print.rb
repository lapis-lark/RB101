family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

family.each { |k, _| p k }
family.each { |_, v| p v }
family.each do |k, v| 
  p k
  p v
end 