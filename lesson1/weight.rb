puts "What is ur name?"
name = gets.chomp

puts "How tall r u?"
tall = gets.chomp.to_i

ideal_wight = tall - 110
if (ideal_wight < 0)
	puts "#{name}, u r already excellent!"
else
	puts "#{name}, ur ideal weight is #{ideal_wight}"
end