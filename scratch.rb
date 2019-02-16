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
          accumulator
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







