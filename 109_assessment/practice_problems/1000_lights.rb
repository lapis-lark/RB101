def hey_lights(n)
  lights = Hash.new(false)
  (1..n).each do |interval|
    (1..n).each do |light|
      next unless light % interval == 0
      lights[light] = !lights[light]
    end
  end

  lights.select { |k, v| v == true }.keys
end





p hey_lights(5)
p hey_lights(10)
p hey_lights(1000)



# generate array of lights
# n times