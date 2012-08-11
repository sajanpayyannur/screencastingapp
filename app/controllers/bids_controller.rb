# coding: utf-8
class BidsController < ApplicationController

  def new
    @auction = Auction.find(params[:id])
    @bind = current_user.binds.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bind }
    end
  end

  def create
    @bid = current_user.bids.new(params[:bid].merge(user: current_user))
    @auction = @bid.auction

    respond_to do |format|
      if @bid.save
        format.html { redirect_to root_path, notice: "Congrats, you bidded it." }
      else
        format.html { redirect_to @auction, :notice => @bid.errors.full_messages.join(', ') }
      end
    end
  end

end
