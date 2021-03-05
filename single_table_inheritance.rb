#STI là một design pattern dựa trên ý tưởng dùng 1 bảng duy nhất để lưu trữ data của nhiều model bằng cách thừa kế từ một base model duy nhất. STI là một thành phần của ActiveRecord::Base

# - trong phat triển dự án sẽ gặp nhưng model có các function và attribute giống hệt nhau. chúng ta sẽ dúng STI để lưu trữ dự liệu của các model đó vào một bảng duy nhất, mặt khác thì chúng ta cũng sẽ viết những chức năng riêng cho từng model để sử dụng.
# 				- nên sử dụng STI khi các model có các trường và các function giống nhau
# 					(ví dụ:  employee thì có thể STI thành manager và developer)
# 					( ví dụ: vehicle thì ko thể STI với các bảng như là Car, bycle… vì chúng ko có đặc điểm giống nhau. )
# 				- biểu hiện: bạn cần thay đổi từ lớp con này sang lớp con khác. 
# 				- hành vi được chia sẻ ở một số lớp, chứ ko phải tất cả.
# 				- một lớp con là sự hợp nhất của nhiều lớp khác

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