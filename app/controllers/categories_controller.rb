class CategoriesController < ApplicationController

  respond_to :html, :json
  before_filter :authenticate_user!
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    flash[:success] = t('flash.category', message: t('flash.created')) if @category.save
    respond_with(@category)
  end

end
