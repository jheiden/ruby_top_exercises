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
          p accumulator
    end



# end of module
end

my_inject_array = [4,4,2]
injected = my_inject_array.my_inject{|acc, cv| acc * cv}



x = [4, 2, 1, 6, 2]

a = x[0] + x[1]
b = a + x[2]
a = b + x[3]
b = a + x[4]
p b

a = x[0] + x[1] # accumulator = yield(self[i] + self[i + 1])
a = a + x[3]  # accumulator = yield(accumulator, self[i + 1])
a = a + x[4]
p a
