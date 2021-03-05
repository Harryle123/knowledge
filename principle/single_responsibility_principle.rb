#mỗi class chỉ nên chịu một trách nhiệm duy nhất, hay nói các khác chỉ có một lý do để thay đổi 

### bad code
class CarStructure 
	def engine
		
	end

	def brake
		
	end

	def state
		
	end
end

### good code

class CarStructure 
	def engine
		
	end

	def brake
		
	end
end

class CarState
	def status
		
	end
end
