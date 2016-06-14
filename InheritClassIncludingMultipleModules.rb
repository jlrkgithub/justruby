#!/usr/bin/ruby

require './IncludeMultipleModules'

class ChildClass < ClassIncludeMultipleModules

	def myMethod1
		puts "In ChildClass -> myMethod"
	end
		
end

childClass = ChildClass.new
childClass.myMethod1
