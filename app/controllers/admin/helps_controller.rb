class Admin::HelpsController < Admin::BaseController
  before_action :set_admin_help, only: [:show, :edit, :update, :destroy]
  before_filter :setup_page
  # GET /admin/helps
  # GET /admin/helps.json
  def index
    @admin_helps = Admin::Help.all
  end

  # GET /admin/helps/1
  # GET /admin/helps/1.json
  def show
  end

  # GET /admin/helps/new
  def new
    @admin_help = Admin::Help.new
  end

  # GET /admin/helps/1/edit
  def edit
  end

  # POST /admin/helps
  # POST /admin/helps.json
  def create
    @admin_help = Admin::Help.new(admin_help_params)
    respond_to do |format|
      if @admin_help.save
        Admin::Help.save_attributes(@admin_help.id,params)
        format.html { redirect_to new_admin_help_path, notice: 'Help was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_help }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_help.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/helps/1
  # PATCH/PUT /admin/helps/1.json
  def update
    respond_to do |format|
      if @admin_help.update(admin_help_params)
        format.html { redirect_to @admin_help, notice: 'Help was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_help.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/helps/1
  # DELETE /admin/helps/1.json
  def destroy
    @admin_help.destroy
    respond_to do |format|
      format.html { redirect_to admin_helps_url }
      format.json { head :no_content }
    end
  end

  def setup_page
    @page = "Help Super Admin!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_help
      @admin_help = Admin::Help.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_help_params
      params.require(:admin_help).permit(:full_name, :e_mail, :help)
    end
end
