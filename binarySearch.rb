#!/usr/bin/ruby

puts "Enter Array Size : "
noValues = gets.chomp.to_i

myArray = Array.new
count = 0

begin
	puts "Enter #{count+1} value : "
	myArray[count] = gets.chomp
	count += 1
end while count<noValues

myArray = myArray.sort

puts "Thats enough :) .. You entered array in SORT order : #{myArray}"

puts "Now enter search string : "

searchText = gets.chomp

first = 0 
last = myArray.length - 1
middle = (first + last) / 2

while first<=last do 

	if myArray[middle] == searchText
		puts "#{searchText} found at #{middle+1} location"
		break
	elsif myArray[middle] < searchText 
		first = middle + 1
	else
		last = middle - 1
	end

	middle = (first + last) / 2

end

if first > last 
	puts "Search string not found.."
end
