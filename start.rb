require_relative 'near_earth_objects'
require_relative 'view'
require 'date'

puts "________________________________________________________________________________________________________________________________"
puts "Welcome to NEO. Here you will find information about how many meteors, astroids, comets pass by the earth every day. \nEnter a date below to get a list of the objects that have passed by the earth on that day."
puts "Please enter a date in the following format YYYY-MM-DD."
print ">>"

date = gets.chomp

astroid_details = NearEarthObjects.find_neos_by_date(date)
view = View.new(astroid_details)

formated_date = DateTime.parse(date).strftime("%A %b %d, %Y")
puts "______________________________________________________________________________"
puts "On #{formated_date}, there were #{view.total_number_of_astroids} objects that almost collided with the earth."
puts "The largest of these was #{view.largest_astroid} ft. in diameter."
puts "\nHere is a list of objects with details:"
puts view.divider
puts view.header
view.create_rows
puts view.divider
