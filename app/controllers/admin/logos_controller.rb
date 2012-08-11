class Admin::LogosController < Admin::BaseController
  # GET /admin/logos
  # GET /admin/logos.json
  def index
    @admin_logos = Admin::Logo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_logos }
    end
  end

  # GET /admin/logos/new
  # GET /admin/logos/new.json
  def new
    @admin_logo = Admin::Logo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_logo }
    end
  end

  # POST /admin/logos
  # POST /admin/logos.json
  def create
    @admin_logo = Admin::Logo.new(params[:admin_logo])

    respond_to do |format|
      if @admin_logo.save
        format.html { redirect_to admin_logos_url, notice: 'Logo was successfully created.' }
        format.json { render json: @admin_logo, status: :created, location: @admin_logo }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_logo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/logos/1
  # DELETE /admin/logos/1.json
  def destroy
    @admin_logo = Admin::Logo.find(params[:id])
    @admin_logo.destroy

    respond_to do |format|
      format.html { redirect_to admin_logos_url }
      format.json { head :no_content }
    end
  end
end
