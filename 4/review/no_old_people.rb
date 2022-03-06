ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p (ages.reject { |_, v| v >= 100 })

p (ages.partition { |_, v| v < 100 }[0].to_h)