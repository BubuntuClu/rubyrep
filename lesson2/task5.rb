puts "Enter year:"
year = gets.chomp.to_i

is_leap_year = (year % 4 == 0 && year % 400 == 0 )? true : false

february = 28
february = 29 if year % 4 == 0 && year % 100 != 0 || year % 400 == 0

months = [31, february, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Enter month:"
month = gets.chomp.to_i

while month > 12 || month < 1 do
  puts "There is no such month. Enter month:"
  month = gets.chomp.to_i
end

puts "Enter day:"
day = gets.chomp.to_i

while months[month-1] < day  do
  puts "There is no such day in that month. Enter day:"
  day = gets.chomp.to_i
end

date_number = 0

for i in 1..(month-1) do
  date_number += months[i - 1]
end

date_number += day

puts date_number