def calculate_fuel(value)
  (value.to_f / 3).floor - 2
end

distances = File.readlines("./input.txt")

fuel_required = distances.map do |x| 
  totals = []
  result = calculate_fuel(x)
  totals << result

  while result > 0
    result = calculate_fuel(result)
    totals << result unless result <= 0
  end

  # pp totals

  totals.inject(0, :+)
end
total_fuel = fuel_required.inject(0, :+)

puts total_fuel