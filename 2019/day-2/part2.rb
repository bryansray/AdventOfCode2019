data = File.read("./input.txt").gsub(/\n/, "").split(",").map { |x| x.to_i }

0.upto(99) do |noun|
  0.upto(99) do |verb|
    data[1] = noun
    data[2] = verb

    0.step(data.length, 4) do |x|
      opcode = data[x]
      operator_location = data[x + 1]
      operand_location = data[x + 2]
      storage_location = data[x + 3]

      # puts "#{operator_location}:#{operand_location} x:#{x}"

      operator, operand = data[operator_location], data[operand_location]

      result = 0
      if opcode == 1
        result = operator + operand
      elsif opcode == 2
        result = operator * operand
      elsif opcode == 99
        if (data[0] == 19690720)
          puts "WINNER: #{100 * noun + verb}"
          exit
        else
          data = File.read("./input.txt").gsub(/\n/, "").split(",").map { |x| x.to_i }
          break
        end
      else
        puts "ERROR"
        exit
      end

      data[storage_location] = result

      # puts "opcode: #{opcode} - operator locations: #{operator_location}:#{operand_location} - operator: #{operator}:#{operand} - storage: #{storage_location} - result: #{result}"
    end
  end
end