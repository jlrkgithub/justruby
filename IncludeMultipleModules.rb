#!/usr/bin/ruby

require './module/ModuleA'
require './module/ModuleB'

class ClassIncludeMultipleModules
	include ModuleA
	include ModuleB

	def myMethod
		
		puts "In ClassIncludeMultipleModules_Method1"
		
		moduleAClass1 = ModuleA::ModuleA_Class1.new
		moduleAClass1.moduleA_Class1_Method1
		moduleAClass1.moduleA_Class1_Method2

		moduleAClass2 = ModuleA::ModuleA_Class2.new
		moduleAClass2.moduleA_Class2_Method1
		moduleAClass2.moduleA_Class2_Method2

	end

end

=begin

classIncludingModule = ClassIncludeMultipleModules.new

classIncludingModule.moduleA_Method1
classIncludingModule.moduleA_Method2
classIncludingModule.myMethod

moduleBClass1 = ClassIncludeMultipleModules::ModuleB::ModuleB_Class1.new
moduleBClass1.moduleB_Class1_Method1
moduleBClass1.moduleB_Class1_Method2

moduleBClass2 = ClassIncludeMultipleModules::ModuleB::ModuleB_Class2.new
moduleBClass2.moduleB_Class2_Method1
moduleBClass2.moduleB_Class2_Method2

=end
