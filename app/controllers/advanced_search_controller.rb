class AdvancedSearchController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!, :except => :show

  def index
    @advanced_searches = current_user.advanced_searches
  end

  def new
    @advanced_search = AdvancedSearch.new
  end

  def show
    @advanced_search = AdvancedSearch.find params[:id]
    self.search(@advanced_search)
    respond_with @advanced_search
  end

  def create
    @advanced_search = AdvancedSearch.new params[:advanced_search]
    @advanced_search.user = current_user
    flash[:notice] = "Search created" if @advanced_search.save
    respond_with(@advanced_search)
  end

  def destroy
    @advanced_search = AdvancedSearch.find params[:id]
    flash[:notice] = "Search destroyed" if @advanced_search.delete
    redirect_to :action => :index
  end

  def fix_on_side_menu
    @advanced_search = AdvancedSearch.find params[:id]
    @advanced_search.update_attribute(:fixed, true)
    render :action => :show
  end

  def search(asearch)
    @auctions = Auction.are_enabled_and_not_expired.page(params[:page])
    @auctions = @auctions.where :lot_number => asearch.lot_number unless asearch.lot_number.blank?
    @auctions = @auctions.where :state => asearch.state.try(:name) unless asearch.state.nil?
    @auctions = @auctions.where :mark => asearch.make unless asearch.make.blank?
    @auctions = @auctions.where :model => asearch.model unless asearch.model.blank?
    @auctions = @auctions.where("year >= ? and year <= ?", asearch.year_from, asearch.year_to)
    @auctions = @auctions.where("sale_title_type in (?)", asearch.sale_title_types.map(&:code)) if asearch.sale_title_types.any?
    @auctions = @auctions.where :transmission => asearch.transmission unless asearch.transmission.blank?
    @auctions = @auctions.where :color => asearch.body_color unless asearch.body_color.blank?
    @auctions = @auctions.where :body_style => asearch.body_style unless asearch.body_style.blank?
    @auctions = @auctions.where :drive_train => asearch.drive_train unless asearch.drive_train.blank?
    @auctions = @auctions.where :vehicle_condition => asearch.vehicle_condition unless asearch.vehicle_condition.blank?
    @auctions = @auctions.where('end_date >= ? and end_date <= ?', DateTime.tomorrow.beginning_of_day, DateTime.tomorrow.end_of_day) if asearch.closes_tomorrow
    @auctions = @auctions.where('end_date >= ? and end_date <= ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day) if asearch.closes_today
    @auctions = @auctions.where('mileage >= ? and mileage <= ?', Mileage.first_value_of_range(asearch.mileage), Mileage.last_value_of_range(asearch.mileage)) unless asearch.mileage.blank?

    @auctions
  end
end
