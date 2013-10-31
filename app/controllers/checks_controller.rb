class ChecksController < ApplicationController

  respond_to :html, :json
  before_filter :authenticate_user!

  def new
    @check = Check.new
  end

  def create
    @check = Check.new(params[:check])
    flash[:success] = t('flash.check', message: t('flash.created')) if @check.save
    respond_with(@check)
  end

  def show
    @check = Check.find(params[:id])
  end

  def edit
    @check = Check.find(params[:id])
  end

  def update
    @check = Check.find(params[:id])
    if @check.update_attributes(params[:check])
      flash[:success] = t('flash.check', message: t('flash.updated'))
    end
    respond_with @check
  end
end
