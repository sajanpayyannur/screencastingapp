class Admin::UsersController < Admin::BaseController
  respond_to :html
  def index
    @users = User.order(:email)
    unless params[:search].try :blank?
      term = "%#{params[:search]}%".upcase
      @users = @users.where("upper(email) like ? or upper(name) like ? or upper(nickname) like ?", term, term, term).order(:email)
    end
  end

  def show
    @user = User.find params[:id]
    respond_with @user
  end

  def show_highest_bidder
    @user = Bid.bid_amounts_for_users.joins(:user).order('sum desc').first.user rescue nil
    redirect_to :action => :index if @user.nil?
    render :action => :show unless @user.nil?
  end

  def edit
    @user = User.find params[:id]
    @user
  end

  def update
    @user = User.find params[:id]
    flash[:notice] = "User was successfully updated" if @user.update_attributes! params[:user]
    redirect_to :action => :index
  end

  def users_list_csv
    csv = CSV.generate do |csv|
      csv << [:email, :name, :nickname, :bids, :winner_bids, :address, :city, :zip, :state, :phone_number, :created_at]
      User.all.each do |user|
          line = Array.new

          line << user.email
          line << (user.name) || " - "
          line << (user.nickname) || " -  "
          line << (user.bids.count) || " -  "
          line << (user.winner_bids.count) || " -  "
          line << (user.address) || " -  "
          line << (user.city) || " -  "
          line << (user.zip) || " -  "
          line << (user.state.try(:name)) || " -  "
          line << (user.phone_number) || " -  "
          line << I18n.l(user.created_at, format: :short) || " -  "

          csv << line
      end
    end
    respond_to do |format|
      format.csv {send_data(csv, :file_name => 'users_list.csv', :type => 'text/csv')}
    end
  end


end
