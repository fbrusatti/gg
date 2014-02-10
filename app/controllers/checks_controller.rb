class ChecksController < ApplicationController

  respond_to :html, :json
  before_filter :authenticate_user!

  def index
    respond_to do |format|
      format.html
      format.json { render json: ChecksDatatable.new(view_context) }
    end
  end

  def new
    @check = Check.new
  end

  def create
    @check = Check.new(params[:check])
    @check.save
    respond_to do |format|
      format.html { render partial: "new_check"}
      format.json { render json: @check }
      format.js
    end
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

  def destroy
    ids = params[:id].split(",")
    ids.map { |c| Check.find(c).destroy }
    respond_with @check
  end
  
end
