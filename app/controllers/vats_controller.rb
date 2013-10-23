class VatsController < ApplicationController

  respond_to :html
  
  def new
    @vat = Vat.new
  end

  def create
    @vat = Vat.new(params[:vat])
    if @vat.save
      flash[:success] = t('flash.vat', message: t('flash.created'))
    end
    respond_to do |format|
      format.json { render :json => @vat}
    end
  end

end
