# This is a clever way to use `#chunk`. 
# Thanks StackOverflow https://stackoverflow.com/a/8163891/124399
def chunk_it(n)
  split = n.to_s.scan(/./)
  split.chunk { |y| y }.map do |y, ys| 
    { y.to_i => ys.length } 
  end
end

def is_six_digits(n)
  n.to_s.length == 6
end

def is_ordered?(n)
  split = n.to_s.scan(/./)
  split.each_cons(2).all? { |x, y| x <= y }
end

def has_two_adjacent_digits?(n)
  chunks = chunk_it(n)
  chunks.any? { |chunk| chunk.values.any? { |v| v == 2 } }
end

min, max = "138307-654504".split("-").map(&:to_i)

count = 0
min.upto(max) do |number|
  if is_six_digits(number) && is_ordered?(number) && has_two_adjacent_digits?(number)
    count += 1
  end
end

puts count