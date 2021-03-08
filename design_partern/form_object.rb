#form object là một design cho phép tách validation logic ra, dể skin model và tái sử dụng validation đó

### bad code

class User < ActiveRecord::Base
	validates :full_name, presence: true
  	validates :email, presence: true, email: true
end 

class UserForm
	include ActiveModel::Model 

end 