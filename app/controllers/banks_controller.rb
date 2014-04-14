class BanksController < ApplicationController

  respond_to :html, :json
  before_filter :authenticate_user!

  def new
    @bank = Bank.new
    if request.xhr?
      render partial: 'new_bank_modal'
    end  
  end

  def create
    @bank = Bank.new(params[:bank])
    @bank.save
    respond_to do |format|
      format.json { render json: @bank }
    end  
  end

  def show
    @bank = Bank.find(params[:id])
  end

  def edit
    @bank = Bank.find(params[:id])
  end

  def update
    @bank = Bank.find(params[:id])
    if @bank.update_attributes(params[:bank])
      flash[:success] = t('flash.bank', message: t('flash.updated'))
    end
    respond_with @bank
  end

end
