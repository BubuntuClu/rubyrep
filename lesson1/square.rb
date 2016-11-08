puts "Enter the base of triangle:"
base = gets.chomp.to_f

while (base <= 0)
  puts "U've entered a negative value of base. Pls enter valid value:"
  base = gets.chomp.to_f
end

puts "Enter the height of triangle:"
height = gets.chomp.to_f

while (height <= 0)
  puts "U've entered a negative value of height. Pls enter valid value:"
  height = gets.chomp.to_f
end


puts "The square of triangle is : #{base*height*0.5}"