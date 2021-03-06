class BanksController < ApplicationController

  respond_to :html, :json
  before_filter :authenticate_user!

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(params[:bank])
    flash[:success] = t('flash.bank', message: t('flash.created')) if @bank.save
    redirect_to new_check_path
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
