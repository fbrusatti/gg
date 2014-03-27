class ReceiptsController < ApplicationController

  respond_to :html, :json
  before_filter :authenticate_user!


  def new
    @receipt = Receipt.new
  end

  def create
    @receipt = Receipt.new(params[:receipt])
    @receipt.amount = @receipt.amount_cash + @receipt.amount_check
    if @receipt.save
      flash[:success] = t('flash.receipt', message: t('flash.created'))
    end
    redirect_to options_documents_path
  end

end
