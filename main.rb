# Create #my_each, a method that is identical to #each but (obviously) does not use #each. You’ll need to use a yield statement. Make sure it returns the same thing as #each as well.
# Create #my_each_with_index in the same way.
# Create #my_select in the same way, though you may use #my_each in your definition (but not #each).
# Create #my_all? (continue as above)
# Create #my_any?
# Create #my_none?
# Create #my_count
# Create #my_map
# Create #my_inject
# Test your #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40
# Modify your #my_map method to take a proc instead.
# Modify your #my_map method to take either a proc or a block. It won’t be necessary to apply both a proc and a block in the same #my_map call since you could get the same effect by chaining together one #my_map call with the block and one with the proc. This approach is also clearer, since the user doesn’t have to remember whether the proc or block will be run first. So if both a proc and a block are given, only execute the proc.



module Enumerable
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    new_arr = []
    
    self.my_each do |item|
      new_arr << item if yield(item)
    end

    return new_arr
  end
end

array = [1,2,3,4,5]

array.each do |item|
  puts "Each #{item}"
end

array.my_each do |item|
  puts "MyEach #{item}"
end

array.each_with_index do |item, index|
  puts "Each #{item} with Index #{index}"
end

array.my_each_with_index do |item, index|
  puts "MyEach #{item} with MyIndex #{index}"
end

puts "Select #{array.select { |n| n.even? }}"

puts "MySelect #{array.my_select { |n| n.even? }}"