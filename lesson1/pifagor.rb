puts "Enter the first side:"
firstS = gets.chomp.to_f

puts "Enter the second side:"
secondS = gets.chomp.to_f

puts "Enter the third side:"
thirdS = gets.chomp.to_f

if (firstS > secondS && firstS > thirdS)
  gipo = firstS
  catet1 = secondS
  catet2 = thirdS
end

if (secondS > firstS && secondS > thirdS)
  gipo = secondS
  catet1 =firstS  
  catet2 = thirdS
end

if (thirdS > secondS && thirdS > firstS)
  gipo = thirdS
  catet1 = secondS
  catet2 = firstS
end

if (gipo**2 == catet1**2 + catet2**2)
 puts "Triangle is rectangular"
end


if (firstS == secondS || firstS == thirdS || secondS == thirdS)
  puts "Triangle is isosceles"
end

if (firstS == secondS && firstS == thirdS && secondS == thirdS)
  puts "Triangle is equilateral, but not rectangular"
end
