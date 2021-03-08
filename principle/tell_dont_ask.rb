class Report
	def list_report
		if user.manager?
			Report.all
		elsif user.staff_member?
			user.reports
		else
			[]
		end 	
	end 
end
