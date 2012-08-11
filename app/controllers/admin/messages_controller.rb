class Admin::MessagesController < Admin::BaseController
  respond_to :html
  def index
    @user = User.find params[:user_id]
    @message = Message.new
  end

  def create
    @user = User.find params[:user_id]
    @message = Message.new params[:message]
    @message.messageable = @user
    @message.from = "noreply@auctions.com"
    @message.to = @user.email
    if @message.save! params[:message]
      flash[:notice] = "Message was successfully created"
      AdminContactMailer.contact(@message).deliver
    end
    respond_with(@message, :location => admin_user_messages_path(@user))
  end
end
