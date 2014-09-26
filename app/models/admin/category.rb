class Admin::Category < ActiveRecord::Base
	has_many :articles
	has_many :sub_categories, :dependent => :destroy

	validates :name,
		      :presence =>true, 
		      :uniqueness=>true,
		      :allow_nil=>false,
          		:allow_blank=>false 

       accepts_nested_attributes_for :sub_categories
end
