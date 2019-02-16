module Enumerable

  def my_each 
    if block_given?
      for item in self do
      yield item
      end
    else raise LocalJumpError
    end
      self
  end 

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

  def my_each_with_index_using_each
    if block_given?
      i = 0
      while i < self.length - 1 do
        self.my_each do |item| 
          i += 1
          yield(item, i)
        end
      end
    else return "missing block"
      
    end
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

  def my_none?
    if block_given?
      self.my_each do | item |
        unless yield(item)
          return true
        end
      end
    end
      return false
  end

  
    def my_count
     unless block_given?
        return self.length
     else
        counter = 0
        self.my_each do |item|
          yield(item) ? counter += 1 : item
        end
     end
        return counter 
    end
    
    def my_map
      unless block_given?
        return "missing block"
      else
        modified_array = []
        for item in self do
          modified_array << yield(item)
        end
        end
        return modified_array
      end 
        
    # inject => alias of reduce. Need to yield(acc, currval)
    # if currval > accumulator, then accumulator = currval

    def my_inject(*args)
      unless block_given?
        return "missing block"
      else
        case args.length
          when 0
            accumulator = 0
          when 1
            accumulator = args[0]
            self.unshift(accumulator) # self now equals array the method was called on with CV as [0] within that array.
          else
            return "Too many arguments, this method takes just one"
          end
        
          i = 0
          while i < self.length - 1 do 
            case i
              when 0
                accumulator = yield(self[i], self[i + 1])
              else
                accumulator = yield(accumulator, self[i + 1])
              end
            i += 1
          end 
        end
          return accumulator
  end

  def my_map_takes_proc (&prc)
    if block_given?
    modified_array = []
      for item in self do
       modified_array << prc.call(item)
      end
    else
      self.to_enum
    end
      return modified_array
  end

# end of module
end







my_inject_array = [4,25,16]
injected = my_inject_array.my_inject(0){|acc, cv| acc + cv}
p injected

my_map_array = [4, 8, 12]
mapped = my_map_array.my_map{|item| item + 4}

my_count_array = [2, 4, 9, 12, 20]
cnt = my_count_array.my_count{|item| item > 5}

my_none_array = [1, 2, 3]
none = my_none_array.my_none?{|item| item.is_a?(String)}

my_any_array = [1, "8", "2"]
a = my_any_array.my_any {|item| item.is_a?(Integer)}

my_all_array = [1, 8, 2]
n = my_all_array.my_all? {|item| item.is_a?(Integer)}

my_select_arr = [2, 4, "aa", false]
j = my_select_arr.my_select {|item| item.is_a?(Integer)}

# my_each_with_index_using_each_arr = [20, 30, 40]
# my_each_with_index_using_each_arr.my_each_with_index_using_each do |item, ind| 
#   p "Item = #{item} , Index = #{ind}"
# end

# my_each_with_index_arr = [20, 30, 40]
# my_each_with_index_arr.my_each_with_index do |item, ind| 
#   p "Item = #{item} , Index = #{ind}"
# end

my_new_each_arr = []
my_each_arr = [1, 2, 5]
x  = my_each_arr.my_each do |item|  # x => original array as that is what .each returns.
   k = item + 5 # on each iteration store modif. value in <k>
   my_new_each_arr << k # on each iteration append <k> to new array.
end


