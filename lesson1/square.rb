puts "Enter the base of triangle:"
base = gets.chomp.to_i

if base < 0 
	while (base < 0)
		puts "U've entered a negative value of base. Pls enter valid value:"
		base = gets.chomp.to_i
	end
end

puts "Enter the height of triangle:"
height = gets.chomp.to_i


if height < 0 
	while (height < 0)
		puts "U've entered a negative value of height. Pls enter valid value:"
		height = gets.chomp.to_i
	end
end

puts "The square of triangle is : #{base*height*0.5}"