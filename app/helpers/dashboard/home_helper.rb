module Dashboard::HomeHelper
	def counting_comment(article_id)
		Dashboard::Comment.where("article_id = ?", article_id).count
	end
end
