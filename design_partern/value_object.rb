class Event
	def method_name
		
	end
end

class DateRange
	attr_reader :start_date, :end_date
	def initialize(start_date, end_date)
		@start_date, @end_date = start_date, end_date
	end

	def include_date?(date)
    	date >= start_date && date <= end_date
 	end
end

class Event < ActiveRecord::Base
  def date_range
    DateRange.new(start_date, end_date)
  end

  def date_range=(date_range)
    self.start_date = date_range.start_date
    self.end_date = date_range.end_date
  end
end