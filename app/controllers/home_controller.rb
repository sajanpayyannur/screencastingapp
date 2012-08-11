class HomeController < ApplicationController
  before_filter :find_user, only: :user
  before_filter :find_home_page_content, only: :index

  def index
    @slider_items = SliderItem.all
    # Auctions that will end up sooner(end_date is higher than Time.now but lower than future end dates)
    @search = Search.new
    if params[:search].try(:any?)
      @search = Search.new params[:search]
      @auctions = search
      render 'home/search'
    else
      @auctions = Auction.are_enabled_and_not_expired.includes(:user).order('Auctions.end_date ASC').limit(6)
    end
  end

  def simple_search
    @search_term = params[:search]
    unless params[:search].blank?
      sql_search_term = "%#{@search_term}%"
      @auctions = Auction.where("UPPER(mark) like upper(?) or UPPER(model) like upper(?) or UPPER(state) like upper(?) or UPPER(lot_number) like upper(?)", sql_search_term,sql_search_term, sql_search_term, sql_search_term)
    else
      @auctions = Auction.are_enabled_and_not_expired.includes(:user).order('Auctions.end_date ASC')
    end
    @auctions = @auctions.paginate(:page => params[:page], :per_page => 12)
    render :search
  end

  def advanced_search
    @search = Search.new
  end


  def user
    @arts = @user.auctions
  end

  private
    def find_user
      @user = User.includes(:auctions).find_by_nickname(request.subdomain)
      redirect_to root_url, notice: 'User not found' if @user.blank?
    end

    def search
      @auctions = Auction.are_enabled_and_not_expired.page(params[:page])
      @auctions = Auction.where :kind => @search.kind unless @search.kind.blank?
      @auctions = @auctions.where :mark => @search.mark unless @search.mark.blank?
      @auctions = @auctions.where :model => @search.model unless @search.model.blank?
      @auctions = @auctions.where("year >= ? and year <= ?", @search.year_from, @search.year_to)
      @auctions.paginate(:page => params[:page], :per_page => 12)
    end

    def find_home_page_content
      @home_page_block = Admin::Page.where(slug: 'home-page-block', publish: true).first
    end
end
