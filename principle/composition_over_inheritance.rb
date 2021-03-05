# Với nguyên lý Composition over Inheritance ta gom các phương thức chung vào một đối tượng riêng sau đó thực hiện tham chiếu các đối tượng này vào đối tượng mới được khởi tạo.

class Vehicle
	def initialize (engine, body) 
		@engine = engine
		@body = body
	end

	def run
		@engine.refill
		@body.load
	end
end 

class ElectricEngine
  def refill
    # refill with electricity
  end
end

class PetrolEngine
  def refill
    # refill with petrol
  end
end

class TruckBody
  def load
    # load cargo
  end
end

class CarBody
  def load
    # load passengers
  end
end

petrol_car = Vehicle.new(engine: PetrolEngine.new, body: CarBody.new)
electric_car = Vehicle.new(engine: ElectricEngine.new, body: CarBody.new)
petrol_truck = Vehicle.new(engine: PetrolEngine.new, body: TruckBody.new)
electric_truck = Vehicle.new(engine: ElectricEngine.new, body: TruckBody.new)
