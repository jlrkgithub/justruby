#!/usr/bin/ruby

module AuthenticationModule

	def initialize(username)
		@loginUserName = username
	end

	def isUserLogin(username)

		if(username == @loginUserName)
			return true
		else
			return false
		end
	end

	class ClassInModule 
		def initialize(value)
			@value = value
		end
	end

end

class MyClassThatIncludes 
	include AuthenticationModule

def isUserLogin(username)
	puts "I am isUserLogin of MyClassThatIncludes"
	return true
end

end


class MyClassThatExtends 
	extend AuthenticationModule
	
end


myClassThatIncludes = MyClassThatIncludes.new('RK')
puts myClassThatIncludes.isUserLogin('RK')
puts myClassThatIncludes.isUserLogin('RamaKrishna')

myClassThatExtends = MyClassThatExtends.new('RamaKrishna')
puts myClassThatExtends.isUserLogin('RK') #This will work
puts myClassThatExtends.myMethod('RamaKrishna') #This will not work
