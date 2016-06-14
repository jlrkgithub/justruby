#!/usr/bin/ruby

class MethodCall

	def initialize(method_name,*args,&block)
		@method_name = method_name
		@args = args
		@block = block
	end
	
	def to_s
		return "Method Name : #{method_name}, Arguments: #{args}, Block : #{block}"
	end	

end

class SpyAgent

	attr_accessor :method_calls

	def initialize
		@method_calls = []
	end

	def recordInvalidMethodCall(method_name,*args,&block)
		@method_calls << MethodCall.new(method_name,args,block)
	end

end


class MethodMissingDemo

	attr_accessor :spyAgentObject

	def initialize(spyAgentObject)
		@spyAgentObject = spyAgentObject
	end

	def someMethod
		puts "Some method.."
	end

	def method_missing(method_name,*args,&block)
		puts "Method missing invoked.."
		spyAgentObject.recordInvalidMethodCall(method_name,args,block)
	end

end

methodMissingDemo = MethodMissingDemo.new(SpyAgent.new)

methodMissingDemo.someMethod

methodMissingDemo.someJunkCall(12,23,45)

puts "Methods : #{methodMissingDemo.spyAgentObject.method_calls}"