class Admin::LinksController < Admin::BaseController
  # GET /admin/links
  # GET /admin/links.json
  def index
    @admin_links = Admin::Link.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_links }
    end
  end

  # GET /admin/links/1
  # GET /admin/links/1.json
  def show
    @admin_link = Admin::Link.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_link }
    end
  end

  # GET /admin/links/new
  # GET /admin/links/new.json
  def new
    @admin_link = Admin::Link.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_link }
    end
  end

  # GET /admin/links/1/edit
  def edit
    @admin_link = Admin::Link.find(params[:id])
  end

  # POST /admin/links
  # POST /admin/links.json
  def create
    @admin_link = Admin::Link.new(params[:admin_link])

    respond_to do |format|
      if @admin_link.save
        format.html { redirect_to @admin_link, notice: 'Link was successfully created.' }
        format.json { render json: @admin_link, status: :created, location: @admin_link }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/links/1
  # PUT /admin/links/1.json
  def update
    @admin_link = Admin::Link.find(params[:id])

    respond_to do |format|
      if @admin_link.update_attributes(params[:admin_link])
        format.html { redirect_to @admin_link, notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/links/1
  # DELETE /admin/links/1.json
  def destroy
    @admin_link = Admin::Link.find(params[:id])
    @admin_link.destroy

    respond_to do |format|
      format.html { redirect_to admin_links_url }
      format.json { head :no_content }
    end
  end
end
