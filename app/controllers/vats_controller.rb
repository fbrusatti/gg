class VatsController < ApplicationController

  respond_to :html, :json
  before_filter :authenticate_user!
  
  def new
    @vat = Vat.new
  end

  def create
    @vat = Vat.new(params[:vat])
    flash[:success] = t('flash.vat', message: t('flash.created')) if @vat.save
    respond_with(@vat)
  end

end
