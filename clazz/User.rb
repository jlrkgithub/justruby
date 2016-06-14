#!/usr/bin/ruby

class User

	#Constant
	APPLICATION_NAME = "VIBE"

	#Static variable / Class variable
	@@NO_USER_OBJECTS = 0

	#attr_accessor - This will provide getter and setter methods for listed variables i.e username 
	attr_accessor :username, :password, :loginStatus, :sessionId

	#attr_reader - This will provide only getter method for below listed variables
	attr_reader :adminAccessModules, :customerAccessModules

	#attr_reader - This will provide only setter method for below listed variables
	attr_writer :loginTime, :logoutTime


	#The below method is like default constructor (public)
	def initialize

		#Values for variable defined under "attr_reader" can be set as below
		@adminAccessModules  = "ADMINTOOL1,ADMINTOOL2,ADMINTOOL3"
		@customerAccessModules = "CUSTTOOL1,CUSTTOOL2,CUSTTOOL3"
		
		#Static / Class variables can be accessed like below
		@@NO_USER_OBJECTS = @@NO_USER_OBJECTS + 1

		puts "\nUser object created.. (NO_USER_OBJECTS = #{@@NO_USER_OBJECTS}})"

	end

	#The below method is parametarized constructor (public - overloaded)
	#Commenting below method as method overloading is not supported by ruby.

	#def initialize(_username,_password)

		#Values for variable defined under "attr_reader" can be set as below
	#	@adminAccessModules  = "ADMINTOOL1,ADMINTOOL2,ADMINTOOL3"
	#	@customerAccessModules = "CUSTTOOL1,CUSTTOOL2,CUSTTOOL3"
		
		#Static / Class variables can be accessed like below
	#	@@NO_USER_OBJECTS = @@NO_USER_OBJECTS + 1

	#	puts "\nUser object created.. (NO_USER_OBJECTS = #{@@NO_USER_OBJECTS}})"

	#	login(_username,_password)

	#end

	#All the methods below are public methods
	def login(_username,_password)

		#Assigning values to multiple variables
		@username, @password = _username, _password

		#self is like "this" operator in java 
		self.loginTime = Time.now
		self.sessionId = Random.new_seed 

		if _username=="RK" && _password == "password"
			puts "Login Success.."
			self.loginStatus = "SUCCESS"

			#The below is not possible as below statement will try to invoke setter method on 
			#"adminAccessModules" which it does'nt have as it is defined under 'attr_reader'
			#which supplies ontl getter method.

			#self.adminAccessModules = "SOMEVALUE"

			#This is how we can set values for variables defined under 'attr_reader'
			@adminAccessModules = adminAccessModules + ",ADMINTOOL4"

			@APPLICATION_NAME = "NEW-VIBE"

			return true
		else
			puts "Login Failed.."
			self.loginStatus = "FAILED"
			return false
		end

	end

	#this how we can pass default value, if parameter is not sent while calling this method
	def logout(flag=true)
		@@NO_USER_OBJECTS = @@NO_USER_OBJECTS -1
		puts "User has LOGOUT (flag = #{flag})"
	end

	#The below is public static method
	def self.getNoObjectedCreated
		@@NO_USER_OBJECTS
	end

	class << self
		def getStaticClassNoObjectedCreated
			@@NO_USER_OBJECTS
		end
	end

	#This method is like Object -> toString method in Java
	def to_s

		#String concatenation can be done using "<<" operator

		return "APPLICATION_NAME: #{APPLICATION_NAME}" << 
			   ", username: #{username}" <<  
			   ", sessionId: #{sessionId}" << 

			   #See my comments below to understand why I have used "@" symbol before variable name

			   ", loginTime: #{@loginTime}" << 
			   ", logoutTime: #{@logoutTime}" <<
			   ", myClassVariable (static) : #{@@NO_USER_OBJECTS}"

   			 # We cannot access loginTime & logoutTime like below i.e liek #{variabeName}
			 # as this pattern i.e #{..} will invoke getter method of loginTime / logoutTime
			 # which they doesn't have as they are defined under "attr_writer"
			 # ", loginTime: #{loginTime}, " << 
			 # ", logoutTime: #{logoutTime}"
			 # instead we have to prefix "@" symbol to read loginTime / logoutTime

	end

	#All the methods below are protected methods
	protected

		def myProtectedMethod1
			puts "I am Protected method-1 from User class"
		end

		def myProtectedMethod2
			puts "I am Protected method-2 from User class"
		end


	#All the methods below are private methods
	private

		def myPrivateMethod1
			puts "I am Private method - 1 from User class"
		end

		def myPrivateMethod2
			puts "I am Private method - 2 from User class"
		end		

end

#This is how we can do block comments, works only out side class - don't know why!!

=begin

#Creation of instance variable
user1 = User.new

user1.login("RK","password")
puts "1. Login by (UserName: RK, Password: password) : #{user1}"

# user1.myPrivateMethod

# We cannot access private methods, if we try to do that we will get error like below:
#`<main>': private method `myPrivateMethod' called for #<User:0x000000025c7180> (NoMethodError)

user2 = User.new
user2.login("RK","wrongpassword")
puts "2. Login by (UserName: RK, Password: password) : #{user2}"

#This is how we access public static methods 
#We can access public static mthods only by using class name
#We cannot invoke using object as like in Java
puts "\nStatic method output (User.getNoObjectedCreated): #{User.getNoObjectedCreated}"

puts "\nStatic method output (class type notation) (User.getStaticClassNoObjectedCreated): #{User.getStaticClassNoObjectedCreated}"

#The below statement will simply print a New Line character
puts

=end
