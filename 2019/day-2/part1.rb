data = File.read("./input.txt").strip

data[1] = 12
data[2] = 2

0.step(data.length, 4) do |x|
  opcode = data[x]
  operator_location = data[x + 1]
  operand_location = data[x + 2]
  storage_location = data[x + 3]

  operator, operand = data[operator_location], data[operand_location]

  result = 0
  if opcode == 1
    result = operator + operand
  elsif opcode == 2
    result = operator * operand
  elsif opcode == 99
    puts data[0]
    exit
  else
    puts "ERROR"
    exit
  end

  data[storage_location] = result

  puts "opcode: #{opcode} - operator locations: #{operator_location}:#{operand_location} - operator: #{operator}:#{operand} - storage: #{storage_location} - result: #{result}"
end