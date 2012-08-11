class PaymentsController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :completed_registration

  def new
    @payment = Payment.new
  end

  def create
    @payment = current_user.payments.new(params[:payment])

    if @payment.save
      if @payment.status
        redirect_to account_index_url, notice: "Your fund's upload was successfully completed"
      else
        redirect_to new_payment_url, notice: 'Sorry but the transaction failed'
      end
    else
      render :new
    end
  end

  def new_setup_fee_payment
    @payment = Payment.new
  end

  def create_setup_fee_payment
    @payment = current_user.build_setup_fee_payment(params[:payment])

    if @payment.save
      if @payment.status
        redirect_to root_url, notice: 'Your registration was successfully completed'
      else
        redirect_to new_setup_fee_payment_payments_url, notice: 'Sorry but the transaction failed'
      end
    else
      render :new
    end
  end
end
