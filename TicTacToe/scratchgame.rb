
x = ["X1", "X2", "O3"]


# p x.all? {|item| item == item}

# p x.each_with_index {|item, counter| p item, counter}








def spot
  b = Array.new(4, "")
  # b[0] = "X"
  # b[1] = "X"
  # b[2] = "O"
  b[rand(b.length - 1)] = "X"
  #p b
end

WIN_COMBO = [
  [0, 4, 8], 
  [2, 4, 6], 
  [0, 1, 2], 
  [3, 4, 5],
  [6, 7, 8], 
  [0, 3, 6], 
  [1, 4, 7], 
  [2, 5, 8]
           ]

a = Array.new(9)
a[1] = "X"
a[4] = "X"
a[7] = "X"


def who_won
  a = Array.new(9)
  a[1] = "X"
  a[4] = "X"
  a[7] = "X"

  arr = WIN_COMBO.detect do |winner|  
  unless a[winner[0]].nil?
    a[winner[0]] == a[winner[1]] && a[winner[1]] == a[winner[2]]
  end
  end
    if arr
      p arr
      return true
    else
      exit
    end
end

# jj = WIN_COMBO.any? do |winner|
#   a[winner[0]] == a[winner[1]] && 
#   a[winner[1]] == a[winner[2]]
# end


p who_won
