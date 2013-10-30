class LocationsController < ApplicationController

  respond_to :html, :json
  before_filter :authenticate_user!

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])
    if @location.save
      flash[:success] = t('flash.location', message: t('flash.created'))
      respond_with(@location)
    else
      render :json =>{:errors => @location.errors.full_messages }, :status => 422
    end

  end

end
