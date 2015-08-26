class Admin::CalendarsController < Admin::BaseController
	before_action :set_admin_calendar, only: [:edit, :update]
	before_filter :setup_page
	before_filter :setup_select

	def new
		@date = params[:date] ? Date.parse(params[:date]) : Date.today
		@calendar = Admin::Schedule.new
		@page_breadcump = " > New"
	end

	def create
		@calendar = Admin::Schedule.new(admin_category_params)
		respond_to do |format|
			if @calendar.save
				unless  params[:admin_schedule][:admin_schedule_members_attributes].blank?
				       params[:admin_schedule][:admin_schedule_members_attributes].each do |sub_schedule|
				            admin_sub_schedule = Admin::ScheduleMember.create({schedule_id: @calendar.id, admin_id: sub_schedule[1][:admin_id]})
				            admin_sub_schedule.save
				       end
			       end
			       format.html { redirect_to new_admin_calendar_path(date: params[:admin_schedule][:dates]), notice: 'Schedule was successfully created.' }
			else
				format.html { render action: 'new' }
			end
		end
	end

	def update
		@calendar.update_attributes(admin_category_params)
		respond_to do |format|
			format.html { redirect_to new_admin_calendar_path(date: @calendar.dates), notice: 'Schedule was successfully created.' }
		end
	end

	def add_row_watchers
	      @index = Admin::Journal.generated_number(current_admin.id)
	      respond_to do |format|
	          format.js
	      end
	  end

	def setup_page
	      @calendars_page = "selected active"
	      @page = "Schedule"
	end

	def setup_select
		@assign = Admin::Profile.all.map{|x| ["#{x.name} #{x.last_name}", x.admin_id]}.unshift(['All Member','all'])
	end

	private
	def admin_category_params
	      params.require(:admin_schedule).permit(:title, :place, :description, :dates, :privacy, :admin_schedule_members_attributes)
	end

	def set_admin_calendar
		@calendar = Admin::Schedule.find(params[:id])
	end
end
