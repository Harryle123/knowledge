# 1. Module cấp cao không nên phụ thuộc vào các module cấp thấp. Cả 2 nên phụ thuộc vào abstractions.
# 2. Interface (abstraction) không nên phụ thuộc vào chi tiết mà ngược lại. Các class giao tiếp với nhau thông qua các interface mà không phải thông qua implementation.

#bad code

class Company
	def initialize(data)
		@data = data
	end 

	def call
		create_department
		list_all_department
	end 

	def create_department
		DepartmentCreator.new.create(data)
	end 

	def list_all_department
	end 
end

class DepartmentCreator
	def create(data)
		###action create department
	end
end


#### good code
class Company
	def initialize(data, creator = DepartmentCreator.new)
		@data = data
	end 

	def call
		create_department
		list_all_department
	end 

	def create_department
		creator.create(data)
	end 

	def list_all_department
	end 
end

