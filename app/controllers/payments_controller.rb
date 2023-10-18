class PaymentsController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  def index
    @payments = current_user.payments.includes(:categories).where(categories: { id:  params[:category_id] }).order(created_at: :desc)
    @total_amount = @payments.sum(:amount)
  end
end
