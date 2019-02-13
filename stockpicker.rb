
# https://www.theodinproject.com/courses/ruby-programming/lessons/building-blocks

def stock_picker arr
  x = 0
  max_profit = 0
  stocks_hash = {}
  for i in 0..(arr.length - 1)
    for j in i..(arr.length - 1)
      max_profit = arr[j] - arr[i] 
        stocks_hash[("Buy at day : #{i} and Sell at day : #{j} for a profit of:")] = max_profit
    end
  end  
    return stocks_hash.max{|(k1, v1), (k2, v2)| v1 <=> v2}
end


x = stock_picker([17,3,6,9,15,8,6,1,10])
p x


# Improved solution

def stock_picker arr
  
  store_items = {}
  arr.each do |buy| 
    arr.each do |sell|
      unless arr.index(sell) > arr.index(buy)
        store_items[[arr.index(buy), arr.index(sell)]] = buy - sell
      else
        next
      end
    end
  end
    p store_items.max{|(k1, v1), (k2, v2)| v1 <=> v2}
end

stock_picker([17,3,6,9,15,8,6,1,10])
