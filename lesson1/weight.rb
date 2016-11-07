puts "What is ur name?"
name = gets.chomp

puts "How tall r u?"
tall = gets.chomp.to_i

if (tall - 110 < 0) 
	puts "#{name}, u r already excellent!"
else
	puts "#{name}, ur ideal weight is #{tall - 110}"
end