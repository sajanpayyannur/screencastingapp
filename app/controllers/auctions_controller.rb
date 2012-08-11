# coding: utf-8

class AuctionsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  layout 'home', :only => :index
  layout 'one_column', :only => :show

  def index
    # @auctions = current_user.auctions.where('Auctions.end_date > ?', Time.zone.now).order('Auctions.created_at DESC')
    # Auctions that will end up sooner(end_date is higher than Time.now but lower than future end dates)
    @auctions = Auction.where('Auctions.end_date > ?', Time.zone.now).includes(:user).order('Auctions.end_date ASC').limit(9)

    # Auctions that has ended(end_date is lower than Time.now but higher than older end dates)
    #@ended_auctions = Auction.where('Auctions.end_date < ?', Time.zone.now).includes(:user).order('Auctions.end_date DESC').limit(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @auctions }
    end
  end

  def show
    @auction = Auction.find(params[:id])
    @bid = Bid.new(auction_id: @auction.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @auction }
    end
  end

  def new
    @auction = current_user.auctions.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @auction }
    end
  end

  def edit
    @auction = current_user.auctions.find(params[:id])
  end

  def create
    @auction = current_user.auctions.new(params[:auction])

    respond_to do |format|
      if @auction.save
        format.html { redirect_to auction_path(@auction), notice: "Auction was successfully created." }
        format.json { render json: @auction, status: :created, location: @auction }
      else
        format.html { render action: "new" }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @auction = current_user.auctions.find(params[:id])

    respond_to do |format|
      if @auction.update_attributes(params[:auction])
        format.html { redirect_to auction_path(@auction), notice: 'Auction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @auction = current_user.auctions.find(params[:id])
    @auction.destroy

    respond_to do |format|
      format.html { redirect_to.auctions_url }
      format.json { head :no_content }
    end
  end

end
