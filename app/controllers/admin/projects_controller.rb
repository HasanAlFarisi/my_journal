class Admin::ProjectsController < Admin::BaseController
	before_filter :setup_page
	
	def index
		@admin_journals = Admin::Journal.order("admin_journals.created_at DESC").paginate(:page => params[:page], :per_page => 20).is_allowed(session[:session_admin],nil)
		@page_breadcump = " > Index"
		admin_journals = Admin::Journal.order("admin_journals.created_at DESC").is_allowed(session[:session_admin],nil)
	    	ids = []
	    	@admin_journals.each do |journal|
	        	ids << journal.id
	    	end
	    	ids_blank = convert_to_arr_for_query(ids)
	    	@admin_journals_status = Admin::Journal.where("id IN #{ids_blank == ")" ? "(0)" : ids_blank}").limit(20)
	    	#@admin_journals_status = Admin::JournalIssue.find_index_count(ids_blank == ")" ? "(0)" : ids_blank ,current_admin.id,'main')
	    	 ids_all = []
    		admin_journals.each do |journal|
	        	ids_all << journal.id
    		end
    		ids_all_blank = convert_to_arr_for_query(ids_all)
    		@admin_journals_status_all = Admin::Journal.where("id IN #{ids_all_blank == ")" ? "(0)" : ids_all_blank}")
    		#@admin_journals_status_all = Admin::JournalIssue.find_index_count(ids_all_blank == ")" ? "(0)" : ids_all_blank ,current_admin.id,'main')
		session[:urlBack] = request.original_url
	end

	def setup_page
	    	@projects = "selected"
	    	@page = "Projects"
	    	@assign = (4..10).map{|x|["#{x} People",x]}.unshift(['Select People',nil])
	end

	def filter
		ids = []
		@admin_journals = Admin::Journal.search_by_params(current_admin.id,params)
		@admin_journals.each do |journal|
	        	ids << journal.id
	    	end
	    	ids_blank = convert_to_arr_for_query(ids)
	    	@admin_journals_status, @admin_journals_status_all = Admin::Journal.where("id IN #{ids_blank == ")" ? "(0)" : ids_blank}")
	    	@notpagging = "yes"
	end
end
