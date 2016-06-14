#!/usr/bin/ruby

puts "\nExecuting : #{File.basename(__FILE__)} (#{File.expand_path(__FILE__)})"
puts

#Below is the simple way of importing a ruby file.
require './clazz/User'

=begin
#This how we can import all .rb files in all sub directories in current folder.
#Not a recommented solution when we have open code in any one of the .rb files.
Dir[File.join(".", "../**/*.rb")].each do |f| 
	if File.expand_path(f) != File.expand_path(__FILE__)
		puts "require #{f}"
		require f
	end
end
=end

puts

#This how we can extend base class (User in this case)
class AdminUser < User

	def login(_username,_password)
		
		puts "Administrator is trying to LOGIN."
		
		#if we just say "super" then ruby will automatically invoke the super class method 
		#with similar name of current method from where "super" has been invoked.
		
		#Below, the super class method "login" will be invoked.
		super 
		
		#Invoking method without arguments (super class method)
		puts "Invoking logout method without parameters."
		logout

	end

	def adminSpecificMethod
		puts "In adminSpecificMethod.."
	end

end

#Creating instance method for AdminUser class
admin = AdminUser.new
admin.login("RK","password")
admin.adminSpecificMethod
puts "Invoking logout method with parameters."
admin.logout(false)
