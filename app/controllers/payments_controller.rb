class PaymentsController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  def index
    @user_payments = current_user.payments
    @unsorted_payments = @user_payments.includes(:categories).where(categories: { id: params[:category_id] })
    @payments = @unsorted_payments.order(created_at: :desc)
    @total_amount = @payments.sum(:amount)
  end

  def new
    @payment = Payment.new
    @categories = current_user.categories
  end

  def create
    @payment = current_user.payments.create(params_payment)
    if @payment.id.nil?
      render :new
    else
      @category = Category.find(params[:payment][:category_id].to_i)
      CategoryPayment.create(category: @category, payment: @payment)
      redirect_to category_payments_path(@category), notice: 'Payment was successfully created.'
    end
  end

  private

  def params_payment
    params.require(:payment).permit(:name, :amount)
  end
end
