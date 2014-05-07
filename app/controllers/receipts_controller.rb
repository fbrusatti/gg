class ReceiptsController < ApplicationController

  respond_to :html, :json
  before_filter :authenticate_user!


  def new
    @receipt = Receipt.new
  end

  def create
    @receipt = Receipt.new(params[:receipt])
    @receipt.invoice_ids = params[:receipt][:invoice_ids].split(",").map(&:to_i)
    @receipt.card_ids = params[:receipt][:card_ids].split(",").map(&:to_i)
    @receipt.check_ids = params[:receipt][:check_ids].split(",").map(&:to_i)
    if @receipt.save
      flash[:success] = t('flash.receipt', message: t('flash.created'))
    end
    redirect_to options_documents_path
  end

end
