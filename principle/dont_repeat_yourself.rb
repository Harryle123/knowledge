class UserController < ApplicationController
	def create
		user = User.new(email: params[:email], name: params[:name])
		if user.save
			#redirect......
		end
	end
end