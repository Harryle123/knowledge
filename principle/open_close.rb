# open_close.rbOpen/close

# Open/closed: 
# 	một class nên được open để mở rộng khi có yêu cầu, nhưng phải close để sửa đổi. 
# 	một class thực thi scope của yêu cầu hiện tại, việc triển khai sẽ không cần phải thay đổi để đáp ứng các yêu cầu trong tưởng lai. 
# 	nguyên tắc này có thể làm code bị khó hiểu hơn, 

######## bad
class SendConfirmation
	def send
		email = user.email
		Mailer.new(email, message)
	end 
end


######## good

class SendConfirmation
	def initialize( sender: user, formatter: EmailConfirmation.new)
		@sender = sender
		@formatter = formatter
	end
	def send
		@formatter.send_confirmation(@sender, message)
	end 
end

class EmailConfirmation
	def send_confirmation(sender, message)
		tel = sender.tel
		### messahe
	end
end

class SmsConfirmation
	def send_confirmation( sender, message)
		### messahe
	end
end
