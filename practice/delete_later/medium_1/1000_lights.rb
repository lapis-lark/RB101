def count_lights(n)
  lights = []
  (1..n).each do |round|
    (1..n).each do |l|
      next unless l % round == 0
      lights.include?(l) ? lights.delete(l) : lights << l
    end
  end
  lights
end

p count_lights(5)
p count_lights(10)
p count_lights(1000)