puts "Enter the a value:"
a = gets.chomp.to_i

puts "Enter the b value:"
b = gets.chomp.to_i

puts "Enter the c value:"
c = gets.chomp.to_i

D = b**2 - 4 * a * c

sqrtD = Math.sqrt(D);

if (D > 0)
	puts "discriminant: #{D}"
	puts "x1: #{(-b + sqrtD)/(2 * a)}"
	puts "x2: #{(-b - sqrtD)/(2 * a)}"
else if (D == 0)
		puts "discriminant: #{D}"
		puts "x1=x2: #{-b/(2 * a)}"
	else
		puts " there are no values"
	end
end