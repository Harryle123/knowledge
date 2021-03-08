#cho phep ta tách logic từ contrpller và model để sử dụng lại.

class User < ActiveRecord::Base
	has_many :articles 
	has_many :comments

	def top_articles
		articles.where('views >= ?', 100)
	end

	def top_comments
		comments.when('views >= ?', 100)
	end
end

##### good code

class QueryTop
	def call(relation)
		relations.where('views >= ?', 100)
	end
end

class User < ActiveRecord::Base
	has_many :articles 
	has_many :comments

	def top_articles
		QueryTop.new.call(articles)
	end

	def top_comments
		QueryTop.new.call(comments)
		# comments.when('views >= ?', 100)
	end
end

