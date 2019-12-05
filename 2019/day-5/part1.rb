data = File.read("./input.txt").strip.split(",").map { |x| x.to_i }

class ParameterMode
  attr_reader :opcode, :modes

  def initialize(opcode)
    input = opcode.to_s.scan(/./)
    @opcode = ((input[-2] || '0') + (input[-1] || '0')).to_i # Yikes that's ugly! :(
    @modes = []

    @modes[0] = input[-3].to_i || 0
    @modes[1] = input[-4].to_i || 0
    @modes[2] = input[-5].to_i || 0
  end
end

pointer = 0
length = data.length
input_store = 1

while pointer < length do
  modes = ParameterMode.new(data[pointer])

  pp "pointer: #{pointer} - opcode: #{modes.opcode} - data: #{data[pointer]}"
  case modes.opcode
  when 1
    storage_location = data[pointer + 3]
    operator = modes.modes[0] == 1 ? data[pointer + 1] : data[data[pointer + 1]]
    operand = modes.modes[1] == 1 ? data[pointer + 2] : data[data[pointer + 2]]
    puts "#{data[pointer..pointer+3]} #{modes.modes}"
    puts "ADD: #{operator} + #{operand} - store at #{storage_location}"
    data[storage_location] = operator + operand
    move_pointer = 4
  when 2
    storage_location = data[pointer + 3]
    operator = modes.modes[0] == 1 ? data[pointer + 1] : data[data[pointer + 1]]
    operand = modes.modes[1] == 1 ? data[pointer + 2] : data[data[pointer + 2]]
    puts "MULTIPLY: #{operator} + ##{operand} - store at #{storage_location}"
    data[storage_location] = operator * operand
    move_pointer = 4
  when 3
    # input_store = data[pointer + 1]
    data[data[pointer + 1]] = input_store
    puts "GET ADDRESS: value at #{data[pointer + 1]} is #{data[data[pointer + 1]]}"
    move_pointer = 2
  when 4
    puts "OUTPUT ADDRESS"
    # data[pointer + 1] = input_store
    puts data[data[pointer + 1]]
    move_pointer = 2
  when 99
    puts "EXIT"
    exit
  else
    puts "Unknown Operation. Halting."
    exit
  end

  pointer += move_pointer
end