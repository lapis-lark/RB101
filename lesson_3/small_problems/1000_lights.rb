def lights_on(num)
  lights = []
  x = 1
  until (x > num)
    0.step(by: x, to: num) do |i|
      lights.include?(i) ? lights.delete(i) : lights.push(i)
    end
    x += 1
  end
  lights.delete(0)
  lights.sort
end

p lights_on(5)
p lights_on(10)
p lights_on(1000)