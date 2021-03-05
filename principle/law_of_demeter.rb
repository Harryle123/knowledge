# .Một phương thức của một đối tượng chỉ nên gọi các phương thức của các loại đối tượng sau:
# 1. chính nó
# 2. các thông số của nó
# 3. bất kỳ đối tượng nào nó tạo / khởi tạo 
# 4. các đối tượng thành phần trực tiếp của nó

class Employee < ActiveRecord::Base
	belongs_to :company
end

