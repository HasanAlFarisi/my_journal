module ArticlesHelper
	def find_article_comment(id)
		Dashboard::Comment.find_all_by_article_id(id)
	end

	def find_category(id)
		unless id.blank? || id == 0
			category = Admin::Category.find_by_id(id)
			unless category == nil
				category.name
			else
				category = 'ect'
			end
		else
			category = 'ect'
		end
	end

	def find_sub_category(id)
		unless id.blank? || id == 0
			sub_category = Admin::SubCategory.find_by_id(id)
			unless sub_category == nil
				sub_category.name
			else
				sub_category = 'ect'
			end
		else
			sub_category = 'ect'
		end		
	end
end
