class Array

  
  def random_each(&b) # assign any code block passed to variable b
    shuffle.each do |item|
      b.call(item)
    end
  end

end 

[1,2,3,4,5].random_each do |item|
  #p item
end


new_proc = Proc.new do |z|
  p "This was passed to me : #{z}"
end

new_proc.call(2)
new_proc.(30)