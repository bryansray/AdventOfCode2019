def is_six_digits(n)
  n.length === 6
end

def is_ordered?(n)
  split = n.to_s.scan(/./)
  split.each_cons(2).all? { |x, y| x <= y }
end

def has_two_adjacent_digits?(n)
  split = n.to_s.scan(/./)
  split.each_cons(2).any? { |x, y| x == y }
end

min, max = "138307-654504".split("-").map { |x| x.to_i }

count = 0
min.upto(max) do |number|
  count += 1 if is_ordered?(number) && has_two_adjacent_digits?(number)
end

puts count