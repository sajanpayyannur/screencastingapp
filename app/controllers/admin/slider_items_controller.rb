class Admin::SliderItemsController < Admin::BaseController
  before_filter :authenticate_user!
  before_filter :check_user_admin
  
    # GET /admin/slider_items
    # GET /admin/slider_items.json
    def index
      @admin_slider_items = SliderItem.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @admin_slider_items }
      end
    end

    # GET /admin/slider_items/1
    # GET /admin/slider_items/1.json
    def show
      @admin_slider_item = SliderItem.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @admin_slider_item }
      end
    end

    # GET /admin/slider_items/new
    # GET /admin/slider_items/new.json
    def new
      @admin_slider_item = SliderItem.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @admin_slider_item }
      end
    end

    # GET /admin/slider_items/1/edit
    def edit
      @admin_slider_item = SliderItem.find(params[:id])
    end

    # POST /admin/slider_items
    # POST /admin/slider_items.json
    def create
      @admin_slider_item = SliderItem.new(params[:slider_item])

      respond_to do |format|
        if @admin_slider_item.save
          format.html { redirect_to admin_slider_item_path(@admin_slider_item), notice: 'Slider item was successfully created.' }
          format.json { render json: @admin_slider_item, status: :created, location: admin_slider_item_path(@admin_slider_item) }
        else
          format.html { render action: "new" }
          format.json { render json: @admin_slider_item.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /admin/slider_items/1
    # PUT /admin/slider_items/1.json
    def update
      @admin_slider_item = SliderItem.find(params[:id])

      respond_to do |format|
        if @admin_slider_item.update_attributes(params[:slider_item])
          format.html { redirect_to admin_slider_item_path(@admin_slider_item), notice: 'Slider item was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @admin_slider_item.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/slider_items/1
    # DELETE /admin/slider_items/1.json
    def destroy
      @admin_slider_item = SliderItem.find(params[:id])
      @admin_slider_item.destroy

      respond_to do |format|
        format.html { redirect_to admin_slider_items_url }
        format.json { head :no_content }
      end
    end
    
    private
    def check_user_admin
      redirect_to root_url unless current_user.has_role? 'admin'
    end
end