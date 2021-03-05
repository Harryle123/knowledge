

class UserController < ApplicationController
	def mass_create
		params.each do |user_params|
			User.create(user_params)
		end 
	end
end

class User < ActiveRecord::Base
	after_create :send_email_noti

	def send_email_noti
		Mailer.email_noti(self).deliver
	end
end


#### good code

class UserController < ApplicationController
	def mass_create
		user = ActiveRecord::Base.transaction do
				params.map { |user_params| User.create(user_params) }
			end
		user.each(&:send_email_noti)
	end
end

class User < ActiveRecord::Base

	def send_email_noti
		Mailer.email_noti(self).deliver
	end
end
