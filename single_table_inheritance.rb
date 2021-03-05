#STI là một design pattern dựa trên ý tưởng dùng 1 bảng duy nhất để lưu trữ data của nhiều model bằng cách thừa kế từ một base model duy nhất. STI là một thành phần của ActiveRecord::Base

#create a migration file
class CreateUser < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :name
			t.string :email
			t.string :password
			t.string :type
		end
	end
end

#create User model
class User < ActiveRecord::Base
	validates_presence_of :password
end

#create admin class
class Admin < User
	validates :custom_password_validation
end
#create guest
class Guest < User 
	validates_presence_of :name
end