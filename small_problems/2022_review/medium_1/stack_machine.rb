def operations(arr)
  stack = []
  register = 0

  arr.each do |command|
    case command
    when 'PRINT' then p register
    when 'PUSH' then stack << register
    when 'ADD' then register += stack.pop
    when 'SUB' then register -= stack.pop
    when 'MULT' then register *= stack.pop
    when 'DIV' then register /= stack.pop
    when 'MOD' then register = register % stack.pop
    when 'POP' then register = stack.pop
    else register = command
    end
  end
end

def minilang(instructions)
  commands = instructions.split(' ').map do |command|
    command.to_i.to_s == command ? command.to_i : command
  end

  operations(commands)
end

minilang('4 PUSH 5 MULT PUSH 3 ADD PUSH 7 SUB PUSH 5 PUSH 3 MOD DIV PRINT')

minilang('4 PUSH 5 MULT PUSH 3 ADD PUSH 7 SUB PRINT')