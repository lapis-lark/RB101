ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p (ages.sort_by { |_, v| v }.first)
p ages.values.sort[0]