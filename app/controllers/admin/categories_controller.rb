class Admin::CategoriesController < Admin::BaseController
  before_action :set_admin_sub_category, :set_admin_category, only: [:show, :edit, :update, :destroy]
  
  # GET /admin/categories
  # GET /admin/categories.json
  def index
    @admin_categories = Admin::Category.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
  end

  # GET /admin/categories/1
  # GET /admin/categories/1.json
  def show
  end

  # GET /admin/categories/new
  def new
    @admin_category = Admin::Category.new
  end

  # GET /admin/categories/1/edit
  def edit
  end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
     @admin_category = Admin::Category.new(admin_category_params)

    respond_to do |format|
      if @admin_category.save
        params[:admin_category][:sub_categories_attributes].each do |sub_category|
          admin_sub_category = Admin::SubCategory.create({category_id: @admin_category.id, name: sub_category[1][:name]})
          admin_sub_category.save
        end

        format.html { redirect_to @admin_category, notice: 'Category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/categories/1
  # PATCH/PUT /admin/categories/1.json
  def update
    respond_to do |format|
      if @admin_category.update(admin_category_params)

        params[:admin_category][:sub_categories_attributes].each do |sub_category|
          Admin::SubCategory.find(sub_category[1][:id]).update_attributes({name: sub_category[1][:name]})
        end

        format.html { redirect_to @admin_category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/categories/1
  # DELETE /admin/categories/1.json
  def destroy
    @admin_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_url }
      format.json { head :no_content }
    end
  end

  def destroy_all
    unless params[:selected].blank?
      id_params = params[:selected]
      id = convert_to_arr_for_query(id_params)
      Admin::Category.delete_all "id in #{id}"
      Admin::SubCategory.delete_all "category_id in #{id}"
      
      respond_to do |format|
        format.html { redirect_to admin_categories_url }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_category
      @admin_category = Admin::Category.find(params[:id])
    end

    def set_admin_sub_category
      #@admin_sub_category = Admin::SubCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_category_params
      params.require(:admin_category).permit(:name)
    end

    def admin_sub_category_params
      params.require(:admin_sub_categories).permit(:admin_sub_categories_attributes, :name, :category_id)
    end
end
