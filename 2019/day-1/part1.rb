fuels = []

File.foreach('./input.txt') do |line|
  mass = line.to_f
  rounded = (mass / 3).floor
  fuel_needed = rounded - 2

  # puts "#{mass} - #{divided_by_3} - #{rounded} - #{subtracted}"
  fuels << fuel_needed
end

sum = fuels.inject(0, :+)
puts sum