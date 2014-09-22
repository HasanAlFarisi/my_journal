module ArticlesHelper
	def find_article_comment(id)
		Dashboard::Comment.find_all_by_article_id(id)
	end
end
