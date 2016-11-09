noleap_months = {1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30,
10 => 31, 11 => 30, 12 => 31}

leap_months = {1 => 31, 2 => 29, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30,
10 => 31, 11 => 30, 12 => 31}

puts "Enter year:"
year = gets.chomp.to_i

is_leap_year = (year % 4 == 0 && year % 400 == 0 )? true : false

if (is_leap_year)
  months = leap_months
else
  months = noleap_months
end

puts "Enter month:"
month = gets.chomp.to_i

while (!months.include?(month)) do
  puts "There is no such month. Enter month:"
  month = gets.chomp.to_i
end

puts "Enter day:"
day = gets.chomp.to_i

while (months[month] < day ) do
  puts "There is no such day in that month. Enter day:"
  day = gets.chomp.to_i
end

date_number = 0

for i in 1..(month-1) do
  date_number += months[i]
end

date_number += day

puts date_number