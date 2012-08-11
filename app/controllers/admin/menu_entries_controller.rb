class Admin::MenuEntriesController < Admin::BaseController
  before_filter :authenticate_user!
  before_filter :check_user_admin

  # GET /admin/menu_entries
  # GET /admin/menu_entries.json
  def index
    @admin_menu_entries = Admin::MenuEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_menu_entries }
    end
  end

  # GET /admin/menu_entries/1
  # GET /admin/menu_entries/1.json
  def show
    @admin_menu_entry = Admin::MenuEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_menu_entry }
    end
  end

  # GET /admin/menu_entries/new
  # GET /admin/menu_entries/new.json
  def new
    @admin_menu_entry = Admin::MenuEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_menu_entry }
    end
  end

  # GET /admin/menu_entries/1/edit
  def edit
    @admin_menu_entry = Admin::MenuEntry.find(params[:id])
  end

  # POST /admin/menu_entries
  # POST /admin/menu_entries.json
  def create
    @admin_menu_entry = Admin::MenuEntry.new(params[:admin_menu_entry])

    respond_to do |format|
      if @admin_menu_entry.save
        format.html { redirect_to @admin_menu_entry, notice: 'Menu entry was successfully created.' }
        format.json { render json: @admin_menu_entry, status: :created, location: @admin_menu_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_menu_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/menu_entries/1
  # PUT /admin/menu_entries/1.json
  def update
    @admin_menu_entry = Admin::MenuEntry.find(params[:id])

    respond_to do |format|
      if @admin_menu_entry.update_attributes(params[:admin_menu_entry])
        format.html { redirect_to @admin_menu_entry, notice: 'Menu entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_menu_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/menu_entries/1
  # DELETE /admin/menu_entries/1.json
  def destroy
    @admin_menu_entry = Admin::MenuEntry.find(params[:id])
    @admin_menu_entry.destroy

    respond_to do |format|
      format.html { redirect_to admin_menu_entries_url }
      format.json { head :no_content }
    end
  end
  private
    def check_user_admin
      redirect_to root_url unless current_user.has_role? 'admin'
    end
end
