module Enumerable

  # accepts a block and does something to each item according to the instructions in the block

  def my_each 
    if block_given?
      for item in self do
      yield item
      end
    else raise LocalJumpError
    end
      self
  end


  # def my_each_with_index
  #   if block_given?
  #   i = 0
  #   while i < self.length - 1 do
  #     yield self[i], i
  #     i += 1
  #   end
  #   else return "missing block"
  # end
  #   self
  # end


  def my_each_with_index
    if block_given?
    i = 0
    while i < self.length - 1 do
      yield self[i], i
      i += 1
    end
    else return "missing block"
  end
    self
  end
  
  def my_select
    if block_given?
      modified_array = []
      for i in 0..self.length - 1
      if yield(self[i]) 
        modified_array << self[i] 
      end
      end
    end
      modified_array
  end

# test if length of new array with true items == length of self
# or use my_select ? 


  def my_all?
    if block_given?
      true_array = []
        for i in 0..self.length - 1
          if yield(self[i])
          true_array << self[i]
          end
        end
    end
    return true_array.length === self.length
  end 

  def my_any
    if block_given?
      self.my_each do | item |
        if yield(item)
          return true
        end
      end
   end
    return false
  end



end

my_new_any_array = [1, "8", "2"]
n = my_new_any_array.my_any {|item| item.is_a?(Integer)}
p n

# my_all_array = [1, 8, 2]
# n = my_all_array.my_all? {|item| item.is_a?(Integer)}
# p n


# my_all_array = [1, 8, 2]
# n = my_all_array.my_all? {|item| item < 10}
# p n


# all_array = [1, 9, 4]
# k = all_array.all? {|item| item < 10}
# puts k


# test_arr = [2, 4, "aa", false]
# j = test_arr.my_select {|item| item.is_a?(Integer)}
# p j 

# test_arr = [2, 4, "aa", false]
# j = test_arr.select {|item| item.is_a?(Integer)}
# puts j






# my_second_arr = [20, 30, 40]
# my_second_arr.my_each_with_index do |item, ind| 
#   p "Item = #{item} , Index = #{ind}"

# end

# my_new_arr = []
# my_arr = [1, 2, 5]
# x  = my_arr.my_each do |item|  # x => original array as that is what .each returns.
#    k = item + 5 # on each iteration store modif. value in <k>
#    my_new_arr << k # on each iteration append <k> to new array.
# end


